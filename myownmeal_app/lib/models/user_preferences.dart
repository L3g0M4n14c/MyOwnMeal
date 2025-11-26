import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    required String userId,
    required List<String>
    defaultTags, // vegan, vegetarisch, proteinreich, lowcarb, etc.
    required int defaultRecipesPerWeek,
    required int defaultCookingTimeMinutes,
    required bool allowRepeatRecipes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}

@freezed
class WeeklyPreferences with _$WeeklyPreferences {
  const factory WeeklyPreferences({
    required String weekIdentifier, // "2025-W48" format
    required List<String> tags,
    required int recipesPerWeek,
    required int cookingTimeMinutes,
    DateTime? createdAt,
  }) = _WeeklyPreferences;

  factory WeeklyPreferences.fromJson(Map<String, dynamic> json) =>
      _$WeeklyPreferencesFromJson(json);
}
