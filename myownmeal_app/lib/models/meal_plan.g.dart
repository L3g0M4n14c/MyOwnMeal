// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealPlanImpl _$$MealPlanImplFromJson(Map<String, dynamic> json) =>
    _$MealPlanImpl(
      id: json['id'] as String,
      weekIdentifier: json['weekIdentifier'] as String,
      meals: (json['meals'] as List<dynamic>)
          .map((e) => PlannedMeal.fromJson(e as Map<String, dynamic>))
          .toList(),
      coordinatedPlans: (json['coordinatedPlans'] as List<dynamic>)
          .map(
              (e) => CoordinatedCookingPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MealPlanImplToJson(_$MealPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weekIdentifier': instance.weekIdentifier,
      'meals': instance.meals,
      'coordinatedPlans': instance.coordinatedPlans,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$PlannedMealImpl _$$PlannedMealImplFromJson(Map<String, dynamic> json) =>
    _$PlannedMealImpl(
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
      dayOfWeek: (json['dayOfWeek'] as num).toInt(),
      mealType: json['mealType'] as String,
    );

Map<String, dynamic> _$$PlannedMealImplToJson(_$PlannedMealImpl instance) =>
    <String, dynamic>{
      'recipe': instance.recipe,
      'dayOfWeek': instance.dayOfWeek,
      'mealType': instance.mealType,
    };

_$CoordinatedCookingPlanImpl _$$CoordinatedCookingPlanImplFromJson(
        Map<String, dynamic> json) =>
    _$CoordinatedCookingPlanImpl(
      id: json['id'] as String,
      recipeIds:
          (json['recipeIds'] as List<dynamic>).map((e) => e as String).toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => CoordinatedStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDurationMinutes: (json['totalDurationMinutes'] as num).toInt(),
    );

Map<String, dynamic> _$$CoordinatedCookingPlanImplToJson(
        _$CoordinatedCookingPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeIds': instance.recipeIds,
      'steps': instance.steps,
      'totalDurationMinutes': instance.totalDurationMinutes,
    };

_$CoordinatedStepImpl _$$CoordinatedStepImplFromJson(
        Map<String, dynamic> json) =>
    _$CoordinatedStepImpl(
      stepNumber: (json['stepNumber'] as num).toInt(),
      timeSlot: (json['timeSlot'] as num).toInt(),
      recipeSteps: Map<String, String>.from(json['recipeSteps'] as Map),
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      parallelize: (json['parallelize'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CoordinatedStepImplToJson(
        _$CoordinatedStepImpl instance) =>
    <String, dynamic>{
      'stepNumber': instance.stepNumber,
      'timeSlot': instance.timeSlot,
      'recipeSteps': instance.recipeSteps,
      'durationMinutes': instance.durationMinutes,
      'parallelize': instance.parallelize,
    };
