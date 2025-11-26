import 'package:freezed_annotation/freezed_annotation.dart';
import 'recipe.dart';

part 'meal_plan.freezed.dart';
part 'meal_plan.g.dart';

@freezed
class MealPlan with _$MealPlan {
  const factory MealPlan({
    required String id,
    required String weekIdentifier, // "2025-W48" format
    required List<PlannedMeal> meals,
    required List<CoordinatedCookingPlan> coordinatedPlans,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MealPlan;

  factory MealPlan.fromJson(Map<String, dynamic> json) =>
      _$MealPlanFromJson(json);
}

@freezed
class PlannedMeal with _$PlannedMeal {
  const factory PlannedMeal({
    required Recipe recipe,
    required int dayOfWeek, // 1-7 (Monday-Sunday)
    required String mealType, // Breakfast, Lunch, Dinner
  }) = _PlannedMeal;

  factory PlannedMeal.fromJson(Map<String, dynamic> json) =>
      _$PlannedMealFromJson(json);
}

@freezed
class CoordinatedCookingPlan with _$CoordinatedCookingPlan {
  const factory CoordinatedCookingPlan({
    required String id,
    required List<String> recipeIds,
    required List<CoordinatedStep> steps,
    required int totalDurationMinutes,
  }) = _CoordinatedCookingPlan;

  factory CoordinatedCookingPlan.fromJson(Map<String, dynamic> json) =>
      _$CoordinatedCookingPlanFromJson(json);
}

@freezed
class CoordinatedStep with _$CoordinatedStep {
  const factory CoordinatedStep({
    required int stepNumber,
    required int timeSlot, // Minute, bei der dieser Schritt startet
    required Map<String, String> recipeSteps, // recipeId -> description
    required int durationMinutes,
    required List<String> parallelize, // recipeIds, die parallel laufen können
  }) = _CoordinatedStep;

  factory CoordinatedStep.fromJson(Map<String, dynamic> json) =>
      _$CoordinatedStepFromJson(json);
}
