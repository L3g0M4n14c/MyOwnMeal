import 'package:hive_flutter/hive_flutter.dart';
import '../models/recipe.dart';
import '../models/user_preferences.dart';
import '../models/meal_plan.dart';
import '../models/shopping_list.dart';

class LocalStorageService {
  static const String recipesBoxName = 'recipes';
  static const String preferencesBoxName = 'preferences';
  static const String mealPlansBoxName = 'mealPlans';
  static const String shoppingListsBoxName = 'shoppingLists';

  late Box<String> _recipesBox;
  late Box<String> _preferencesBox;
  late Box<String> _mealPlansBox;
  late Box<String> _shoppingListsBox;

  Future<void> init() async {
    await Hive.initFlutter();

    // Öffne Boxen (verwende String für JSON-Serialisierung)
    _recipesBox = await Hive.openBox<String>(recipesBoxName);
    _preferencesBox = await Hive.openBox<String>(preferencesBoxName);
    _mealPlansBox = await Hive.openBox<String>(mealPlansBoxName);
    _shoppingListsBox = await Hive.openBox<String>(shoppingListsBoxName);
  }

  // ===== RECIPES =====
  Future<void> saveRecipe(Recipe recipe) async {
    // Für jetzt: JSON-Serialisierung
    await _recipesBox.put(recipe.id, recipe.toJson().toString());
  }

  Future<void> deleteRecipe(String recipeId) async {
    await _recipesBox.delete(recipeId);
  }

  Recipe? getRecipe(String recipeId) {
    return null; // Vereinfacht für MVP
  }

  List<Recipe> getAllRecipes() {
    return [];
  }

  List<Recipe> getRecipesByTags(List<String> tags) {
    if (tags.isEmpty) {
      return getAllRecipes();
    }
    return [];
  }

  // ===== USER PREFERENCES =====
  Future<void> saveUserPreferences(UserPreferences prefs) async {
    await _preferencesBox.put(prefs.userId, prefs.toJson().toString());
  }

  UserPreferences? getUserPreferences(String userId) {
    return null;
  }

  // ===== MEAL PLANS =====
  Future<void> saveMealPlan(MealPlan mealPlan) async {
    await _mealPlansBox.put(mealPlan.id, mealPlan.toJson().toString());
  }

  MealPlan? getMealPlan(String mealPlanId) {
    return null;
  }

  MealPlan? getMealPlanForWeek(String weekIdentifier) {
    return null;
  }

  // ===== SHOPPING LISTS =====
  Future<void> saveShoppingList(ShoppingList list) async {
    await _shoppingListsBox.put(list.id, list.toJson().toString());
  }

  ShoppingList? getShoppingList(String listId) {
    return null;
  }

  ShoppingList? getShoppingListForWeek(String weekIdentifier) {
    return null;
  }

  Future<void> close() async {
    await Hive.close();
  }
}
