import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    required String description,
    required List<String> ingredients,
    required List<CookingStep> cookingSteps,
    required int prepTimeMinutes,
    required int cookTimeMinutes,
    required int servings,
    required List<String>
    tags, // vegan, vegetarisch, proteinreich, lowcarb, etc.
    required double rating,
    String? imageUrl,
    String? sourceUrl,
    DateTime? createdAt,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class CookingStep with _$CookingStep {
  const factory CookingStep({
    required int stepNumber,
    required String description,
    required int durationMinutes,
    required List<String> requiredIngredients,
    required List<String> equipment, // z.B. "Topf", "Pfanne", "Ofen"
  }) = _CookingStep;

  factory CookingStep.fromJson(Map<String, dynamic> json) =>
      _$CookingStepFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String name,
    required double quantity,
    required String unit, // kg, g, ml, l, Stück, etc.
    String? category, // Gemüse, Getreide, Protein, etc.
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
