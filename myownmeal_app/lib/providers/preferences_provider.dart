import 'package:flutter/material.dart';
import '../models/user_preferences.dart';
import '../services/local_storage_service.dart';

class PreferencesProvider with ChangeNotifier {
  final LocalStorageService _storageService;
  final String userId = 'default_user'; // TODO: Echte User-Auth

  UserPreferences? _preferences;
  WeeklyPreferences? _weeklyPreferences;
  bool _isLoading = false;

  PreferencesProvider(this._storageService);

  UserPreferences? get preferences => _preferences;
  WeeklyPreferences? get weeklyPreferences => _weeklyPreferences;
  bool get isLoading => _isLoading;

  Future<void> loadPreferences() async {
    _isLoading = true;
    notifyListeners();

    try {
      _preferences = _storageService.getUserPreferences(userId);
      _preferences ??= UserPreferences(
        userId: userId,
        defaultTags: [],
        defaultRecipesPerWeek: 3,
        defaultCookingTimeMinutes: 120,
        allowRepeatRecipes: false,
        createdAt: DateTime.now(),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateDefaultPreferences({
    required List<String> tags,
    required int recipesPerWeek,
    required int cookingTimeMinutes,
  }) async {
    final updated = _preferences!.copyWith(
      defaultTags: tags,
      defaultRecipesPerWeek: recipesPerWeek,
      defaultCookingTimeMinutes: cookingTimeMinutes,
      updatedAt: DateTime.now(),
    );

    await _storageService.saveUserPreferences(updated);
    _preferences = updated;
    notifyListeners();
  }

  Future<void> setWeeklyPreferences(
    List<String> tags,
    int recipesPerWeek,
    int cookingTimeMinutes,
  ) async {
    final weekId = _getWeekIdentifier();
    final weekly = WeeklyPreferences(
      weekIdentifier: weekId,
      tags: tags,
      recipesPerWeek: recipesPerWeek,
      cookingTimeMinutes: cookingTimeMinutes,
      createdAt: DateTime.now(),
    );

    _weeklyPreferences = weekly;
    notifyListeners();
  }

  void resetWeeklyPreferences() {
    _weeklyPreferences = null;
    notifyListeners();
  }

  List<String> getActiveTagsForWeek() {
    return _weeklyPreferences?.tags ?? _preferences?.defaultTags ?? [];
  }

  int getActiveRecipesCountForWeek() {
    return _weeklyPreferences?.recipesPerWeek ??
        _preferences?.defaultRecipesPerWeek ??
        3;
  }

  int getActiveCookingTimeForWeek() {
    return _weeklyPreferences?.cookingTimeMinutes ??
        _preferences?.defaultCookingTimeMinutes ??
        120;
  }

  String _getWeekIdentifier() {
    final now = DateTime.now();
    final weekNumber =
        ((now.difference(DateTime(now.year, 1, 1)).inDays + 1) / 7).ceil();
    return '${now.year}-W${weekNumber.toString().padLeft(2, '0')}';
  }
}
