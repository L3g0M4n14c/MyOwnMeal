// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cookingSteps: (json['cookingSteps'] as List<dynamic>)
          .map((e) => CookingStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      prepTimeMinutes: (json['prepTimeMinutes'] as num).toInt(),
      cookTimeMinutes: (json['cookTimeMinutes'] as num).toInt(),
      servings: (json['servings'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      sourceUrl: json['sourceUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'cookingSteps': instance.cookingSteps,
      'prepTimeMinutes': instance.prepTimeMinutes,
      'cookTimeMinutes': instance.cookTimeMinutes,
      'servings': instance.servings,
      'tags': instance.tags,
      'rating': instance.rating,
      'imageUrl': instance.imageUrl,
      'sourceUrl': instance.sourceUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$CookingStepImpl _$$CookingStepImplFromJson(Map<String, dynamic> json) =>
    _$CookingStepImpl(
      stepNumber: (json['stepNumber'] as num).toInt(),
      description: json['description'] as String,
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      requiredIngredients: (json['requiredIngredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      equipment:
          (json['equipment'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CookingStepImplToJson(_$CookingStepImpl instance) =>
    <String, dynamic>{
      'stepNumber': instance.stepNumber,
      'description': instance.description,
      'durationMinutes': instance.durationMinutes,
      'requiredIngredients': instance.requiredIngredients,
      'equipment': instance.equipment,
    };

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'] as String,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'category': instance.category,
    };
