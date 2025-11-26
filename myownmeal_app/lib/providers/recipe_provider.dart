import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/recipe_scraper_service.dart';
import '../services/local_storage_service.dart';

class RecipeProvider with ChangeNotifier {
  final LocalStorageService _storageService;
  final RecipeScraperService _scraperService;

  List<Recipe> _recipes = [];
  List<Recipe> _filteredRecipes = [];
  bool _isLoading = false;
  String? _error;

  RecipeProvider(this._storageService, this._scraperService);

  List<Recipe> get recipes => _recipes;
  List<Recipe> get filteredRecipes => _filteredRecipes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadRecipes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _recipes = _storageService.getAllRecipes();
      _filteredRecipes = _recipes;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addRecipe(Recipe recipe) async {
    try {
      await _storageService.saveRecipe(recipe);
      _recipes.add(recipe);
      _filteredRecipes = _recipes;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<Recipe?> scrapeRecipeFromUrl(String url) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final recipe = await _scraperService.scrapeRecipeFromUrl(url);
      if (recipe != null) {
        await addRecipe(recipe);
      }
      return recipe;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteRecipe(String recipeId) async {
    try {
      await _storageService.deleteRecipe(recipeId);
      _recipes.removeWhere((r) => r.id == recipeId);
      _filteredRecipes = _recipes;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  void filterByTags(List<String> tags) {
    if (tags.isEmpty) {
      _filteredRecipes = _recipes;
    } else {
      _filteredRecipes = _recipes
          .where((recipe) => tags.any((tag) => recipe.tags.contains(tag)))
          .toList();
    }
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
