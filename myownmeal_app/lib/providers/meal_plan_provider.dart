import 'package:flutter/material.dart';
import '../models/meal_plan.dart';
import '../models/recipe.dart';
import '../models/shopping_list.dart';
import '../services/llm_service.dart';
import '../services/local_storage_service.dart';

class MealPlanProvider with ChangeNotifier {
  final LocalStorageService _storageService;
  final LLMService _llmService;

  MealPlan? _currentMealPlan;
  ShoppingList? _currentShoppingList;
  String? _coordinatedPlanText;
  bool _isLoading = false;
  String? _error;

  MealPlanProvider(this._storageService, this._llmService);

  MealPlan? get currentMealPlan => _currentMealPlan;
  ShoppingList? get currentShoppingList => _currentShoppingList;
  String? get coordinatedPlanText => _coordinatedPlanText;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> generateWeeklyMealPlan(
    List<Recipe> availableRecipes,
    List<String> userTags,
    int recipeCount,
    int maxCookingTime,
  ) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Hole Rezept-Vorschläge vom LLM
      final selectedRecipes = await _llmService.suggestRecipes(
        availableRecipes,
        userTags,
        recipeCount,
        maxCookingTime,
      );

      if (selectedRecipes.isEmpty) {
        _error = 'No recipes found matching your preferences';
        notifyListeners();
        return;
      }

      // Koordiniere die Kochschritte
      _coordinatedPlanText = await _llmService.coordinateCookingSteps(
        selectedRecipes,
        maxCookingTime,
      );

      // Erstelle Meal Plan
      final weekId = _getWeekIdentifier();
      final plannedMeals = <PlannedMeal>[];

      for (var i = 0; i < selectedRecipes.length; i++) {
        plannedMeals.add(
          PlannedMeal(
            recipe: selectedRecipes[i],
            dayOfWeek: (i % 7) + 1,
            mealType: 'Dinner',
          ),
        );
      }

      _currentMealPlan = MealPlan(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        weekIdentifier: weekId,
        meals: plannedMeals,
        coordinatedPlans: [], // TODO: Füllen mit echten koordinierten Plänen
        createdAt: DateTime.now(),
      );

      // Speichere Meal Plan
      await _storageService.saveMealPlan(_currentMealPlan!);

      // Generiere Shopping List
      await _generateShoppingList(selectedRecipes, weekId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _generateShoppingList(
    List<Recipe> recipes,
    String weekIdentifier,
  ) async {
    final items = <ShoppingItem>[];
    final ingredientMap = <String, ShoppingItem>{};

    // Aggregiere Zutaten von allen Rezepten
    for (var recipe in recipes) {
      for (var ingredient in recipe.ingredients) {
        if (ingredientMap.containsKey(ingredient)) {
          // Aktualisiere Menge
          final existing = ingredientMap[ingredient]!;
          final updated = existing.copyWith(
            recipeIds: [...existing.recipeIds, recipe.id],
          );
          ingredientMap[ingredient] = updated;
        } else {
          items.add(
            ShoppingItem(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              name: ingredient,
              quantity: 1.0,
              unit: 'Stück',
              category: 'Unbekannt',
              isChecked: false,
              recipeIds: [recipe.id],
            ),
          );
          ingredientMap[ingredient] = items.last;
        }
      }
    }

    _currentShoppingList = ShoppingList(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      weekIdentifier: weekIdentifier,
      items: ingredientMap.values.toList(),
      isChecked: false,
      createdAt: DateTime.now(),
    );

    await _storageService.saveShoppingList(_currentShoppingList!);
  }

  Future<void> loadMealPlanForWeek(String weekIdentifier) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _currentMealPlan = _storageService.getMealPlanForWeek(weekIdentifier);
      _currentShoppingList = _storageService.getShoppingListForWeek(
        weekIdentifier,
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateShoppingItemCheck(String itemId, bool isChecked) async {
    if (_currentShoppingList == null) return;

    final updatedItems = _currentShoppingList!.items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(isChecked: isChecked);
      }
      return item;
    }).toList();

    _currentShoppingList = _currentShoppingList!.copyWith(items: updatedItems);
    await _storageService.saveShoppingList(_currentShoppingList!);
    notifyListeners();
  }

  String _getWeekIdentifier() {
    final now = DateTime.now();
    final weekNumber =
        ((now.difference(DateTime(now.year, 1, 1)).inDays + 1) / 7).ceil();
    return '${now.year}-W${weekNumber.toString().padLeft(2, '0')}';
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
