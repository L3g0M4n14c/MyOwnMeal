// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  List<CookingStep> get cookingSteps => throw _privateConstructorUsedError;
  int get prepTimeMinutes => throw _privateConstructorUsedError;
  int get cookTimeMinutes => throw _privateConstructorUsedError;
  int get servings => throw _privateConstructorUsedError;
  List<String> get tags =>
      throw _privateConstructorUsedError; // vegan, vegetarisch, proteinreich, lowcarb, etc.
  double get rating => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get sourceUrl => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      List<String> ingredients,
      List<CookingStep> cookingSteps,
      int prepTimeMinutes,
      int cookTimeMinutes,
      int servings,
      List<String> tags,
      double rating,
      String? imageUrl,
      String? sourceUrl,
      DateTime? createdAt});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? cookingSteps = null,
    Object? prepTimeMinutes = null,
    Object? cookTimeMinutes = null,
    Object? servings = null,
    Object? tags = null,
    Object? rating = null,
    Object? imageUrl = freezed,
    Object? sourceUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cookingSteps: null == cookingSteps
          ? _value.cookingSteps
          : cookingSteps // ignore: cast_nullable_to_non_nullable
              as List<CookingStep>,
      prepTimeMinutes: null == prepTimeMinutes
          ? _value.prepTimeMinutes
          : prepTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      cookTimeMinutes: null == cookTimeMinutes
          ? _value.cookTimeMinutes
          : cookTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      servings: null == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      List<String> ingredients,
      List<CookingStep> cookingSteps,
      int prepTimeMinutes,
      int cookTimeMinutes,
      int servings,
      List<String> tags,
      double rating,
      String? imageUrl,
      String? sourceUrl,
      DateTime? createdAt});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? cookingSteps = null,
    Object? prepTimeMinutes = null,
    Object? cookTimeMinutes = null,
    Object? servings = null,
    Object? tags = null,
    Object? rating = null,
    Object? imageUrl = freezed,
    Object? sourceUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$RecipeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cookingSteps: null == cookingSteps
          ? _value._cookingSteps
          : cookingSteps // ignore: cast_nullable_to_non_nullable
              as List<CookingStep>,
      prepTimeMinutes: null == prepTimeMinutes
          ? _value.prepTimeMinutes
          : prepTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      cookTimeMinutes: null == cookTimeMinutes
          ? _value.cookTimeMinutes
          : cookTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      servings: null == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl(
      {required this.id,
      required this.name,
      required this.description,
      required final List<String> ingredients,
      required final List<CookingStep> cookingSteps,
      required this.prepTimeMinutes,
      required this.cookTimeMinutes,
      required this.servings,
      required final List<String> tags,
      required this.rating,
      this.imageUrl,
      this.sourceUrl,
      this.createdAt})
      : _ingredients = ingredients,
        _cookingSteps = cookingSteps,
        _tags = tags;

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<CookingStep> _cookingSteps;
  @override
  List<CookingStep> get cookingSteps {
    if (_cookingSteps is EqualUnmodifiableListView) return _cookingSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cookingSteps);
  }

  @override
  final int prepTimeMinutes;
  @override
  final int cookTimeMinutes;
  @override
  final int servings;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

// vegan, vegetarisch, proteinreich, lowcarb, etc.
  @override
  final double rating;
  @override
  final String? imageUrl;
  @override
  final String? sourceUrl;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, description: $description, ingredients: $ingredients, cookingSteps: $cookingSteps, prepTimeMinutes: $prepTimeMinutes, cookTimeMinutes: $cookTimeMinutes, servings: $servings, tags: $tags, rating: $rating, imageUrl: $imageUrl, sourceUrl: $sourceUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality()
                .equals(other._cookingSteps, _cookingSteps) &&
            (identical(other.prepTimeMinutes, prepTimeMinutes) ||
                other.prepTimeMinutes == prepTimeMinutes) &&
            (identical(other.cookTimeMinutes, cookTimeMinutes) ||
                other.cookTimeMinutes == cookTimeMinutes) &&
            (identical(other.servings, servings) ||
                other.servings == servings) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_cookingSteps),
      prepTimeMinutes,
      cookTimeMinutes,
      servings,
      const DeepCollectionEquality().hash(_tags),
      rating,
      imageUrl,
      sourceUrl,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final String id,
      required final String name,
      required final String description,
      required final List<String> ingredients,
      required final List<CookingStep> cookingSteps,
      required final int prepTimeMinutes,
      required final int cookTimeMinutes,
      required final int servings,
      required final List<String> tags,
      required final double rating,
      final String? imageUrl,
      final String? sourceUrl,
      final DateTime? createdAt}) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get ingredients;
  @override
  List<CookingStep> get cookingSteps;
  @override
  int get prepTimeMinutes;
  @override
  int get cookTimeMinutes;
  @override
  int get servings;
  @override
  List<String> get tags;
  @override // vegan, vegetarisch, proteinreich, lowcarb, etc.
  double get rating;
  @override
  String? get imageUrl;
  @override
  String? get sourceUrl;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CookingStep _$CookingStepFromJson(Map<String, dynamic> json) {
  return _CookingStep.fromJson(json);
}

/// @nodoc
mixin _$CookingStep {
  int get stepNumber => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  List<String> get requiredIngredients => throw _privateConstructorUsedError;
  List<String> get equipment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CookingStepCopyWith<CookingStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CookingStepCopyWith<$Res> {
  factory $CookingStepCopyWith(
          CookingStep value, $Res Function(CookingStep) then) =
      _$CookingStepCopyWithImpl<$Res, CookingStep>;
  @useResult
  $Res call(
      {int stepNumber,
      String description,
      int durationMinutes,
      List<String> requiredIngredients,
      List<String> equipment});
}

/// @nodoc
class _$CookingStepCopyWithImpl<$Res, $Val extends CookingStep>
    implements $CookingStepCopyWith<$Res> {
  _$CookingStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? description = null,
    Object? durationMinutes = null,
    Object? requiredIngredients = null,
    Object? equipment = null,
  }) {
    return _then(_value.copyWith(
      stepNumber: null == stepNumber
          ? _value.stepNumber
          : stepNumber // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      requiredIngredients: null == requiredIngredients
          ? _value.requiredIngredients
          : requiredIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CookingStepImplCopyWith<$Res>
    implements $CookingStepCopyWith<$Res> {
  factory _$$CookingStepImplCopyWith(
          _$CookingStepImpl value, $Res Function(_$CookingStepImpl) then) =
      __$$CookingStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int stepNumber,
      String description,
      int durationMinutes,
      List<String> requiredIngredients,
      List<String> equipment});
}

/// @nodoc
class __$$CookingStepImplCopyWithImpl<$Res>
    extends _$CookingStepCopyWithImpl<$Res, _$CookingStepImpl>
    implements _$$CookingStepImplCopyWith<$Res> {
  __$$CookingStepImplCopyWithImpl(
      _$CookingStepImpl _value, $Res Function(_$CookingStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? description = null,
    Object? durationMinutes = null,
    Object? requiredIngredients = null,
    Object? equipment = null,
  }) {
    return _then(_$CookingStepImpl(
      stepNumber: null == stepNumber
          ? _value.stepNumber
          : stepNumber // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      requiredIngredients: null == requiredIngredients
          ? _value._requiredIngredients
          : requiredIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      equipment: null == equipment
          ? _value._equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CookingStepImpl implements _CookingStep {
  const _$CookingStepImpl(
      {required this.stepNumber,
      required this.description,
      required this.durationMinutes,
      required final List<String> requiredIngredients,
      required final List<String> equipment})
      : _requiredIngredients = requiredIngredients,
        _equipment = equipment;

  factory _$CookingStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$CookingStepImplFromJson(json);

  @override
  final int stepNumber;
  @override
  final String description;
  @override
  final int durationMinutes;
  final List<String> _requiredIngredients;
  @override
  List<String> get requiredIngredients {
    if (_requiredIngredients is EqualUnmodifiableListView)
      return _requiredIngredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredIngredients);
  }

  final List<String> _equipment;
  @override
  List<String> get equipment {
    if (_equipment is EqualUnmodifiableListView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipment);
  }

  @override
  String toString() {
    return 'CookingStep(stepNumber: $stepNumber, description: $description, durationMinutes: $durationMinutes, requiredIngredients: $requiredIngredients, equipment: $equipment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CookingStepImpl &&
            (identical(other.stepNumber, stepNumber) ||
                other.stepNumber == stepNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            const DeepCollectionEquality()
                .equals(other._requiredIngredients, _requiredIngredients) &&
            const DeepCollectionEquality()
                .equals(other._equipment, _equipment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stepNumber,
      description,
      durationMinutes,
      const DeepCollectionEquality().hash(_requiredIngredients),
      const DeepCollectionEquality().hash(_equipment));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CookingStepImplCopyWith<_$CookingStepImpl> get copyWith =>
      __$$CookingStepImplCopyWithImpl<_$CookingStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CookingStepImplToJson(
      this,
    );
  }
}

abstract class _CookingStep implements CookingStep {
  const factory _CookingStep(
      {required final int stepNumber,
      required final String description,
      required final int durationMinutes,
      required final List<String> requiredIngredients,
      required final List<String> equipment}) = _$CookingStepImpl;

  factory _CookingStep.fromJson(Map<String, dynamic> json) =
      _$CookingStepImpl.fromJson;

  @override
  int get stepNumber;
  @override
  String get description;
  @override
  int get durationMinutes;
  @override
  List<String> get requiredIngredients;
  @override
  List<String> get equipment;
  @override
  @JsonKey(ignore: true)
  _$$CookingStepImplCopyWith<_$CookingStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
mixin _$Ingredient {
  String get name => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get unit =>
      throw _privateConstructorUsedError; // kg, g, ml, l, Stück, etc.
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res, Ingredient>;
  @useResult
  $Res call({String name, double quantity, String unit, String? category});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res, $Val extends Ingredient>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientImplCopyWith<$Res>
    implements $IngredientCopyWith<$Res> {
  factory _$$IngredientImplCopyWith(
          _$IngredientImpl value, $Res Function(_$IngredientImpl) then) =
      __$$IngredientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double quantity, String unit, String? category});
}

/// @nodoc
class __$$IngredientImplCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$IngredientImpl>
    implements _$$IngredientImplCopyWith<$Res> {
  __$$IngredientImplCopyWithImpl(
      _$IngredientImpl _value, $Res Function(_$IngredientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
    Object? category = freezed,
  }) {
    return _then(_$IngredientImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientImpl implements _Ingredient {
  const _$IngredientImpl(
      {required this.name,
      required this.quantity,
      required this.unit,
      this.category});

  factory _$IngredientImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientImplFromJson(json);

  @override
  final String name;
  @override
  final double quantity;
  @override
  final String unit;
// kg, g, ml, l, Stück, etc.
  @override
  final String? category;

  @override
  String toString() {
    return 'Ingredient(name: $name, quantity: $quantity, unit: $unit, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, quantity, unit, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      __$$IngredientImplCopyWithImpl<_$IngredientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientImplToJson(
      this,
    );
  }
}

abstract class _Ingredient implements Ingredient {
  const factory _Ingredient(
      {required final String name,
      required final double quantity,
      required final String unit,
      final String? category}) = _$IngredientImpl;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$IngredientImpl.fromJson;

  @override
  String get name;
  @override
  double get quantity;
  @override
  String get unit;
  @override // kg, g, ml, l, Stück, etc.
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
