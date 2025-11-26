// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      userId: json['userId'] as String,
      defaultTags: (json['defaultTags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      defaultRecipesPerWeek: (json['defaultRecipesPerWeek'] as num).toInt(),
      defaultCookingTimeMinutes:
          (json['defaultCookingTimeMinutes'] as num).toInt(),
      allowRepeatRecipes: json['allowRepeatRecipes'] as bool,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'defaultTags': instance.defaultTags,
      'defaultRecipesPerWeek': instance.defaultRecipesPerWeek,
      'defaultCookingTimeMinutes': instance.defaultCookingTimeMinutes,
      'allowRepeatRecipes': instance.allowRepeatRecipes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$WeeklyPreferencesImpl _$$WeeklyPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyPreferencesImpl(
      weekIdentifier: json['weekIdentifier'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      recipesPerWeek: (json['recipesPerWeek'] as num).toInt(),
      cookingTimeMinutes: (json['cookingTimeMinutes'] as num).toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$WeeklyPreferencesImplToJson(
        _$WeeklyPreferencesImpl instance) =>
    <String, dynamic>{
      'weekIdentifier': instance.weekIdentifier,
      'tags': instance.tags,
      'recipesPerWeek': instance.recipesPerWeek,
      'cookingTimeMinutes': instance.cookingTimeMinutes,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
