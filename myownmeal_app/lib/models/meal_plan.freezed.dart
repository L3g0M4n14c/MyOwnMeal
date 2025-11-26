// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealPlan _$MealPlanFromJson(Map<String, dynamic> json) {
  return _MealPlan.fromJson(json);
}

/// @nodoc
mixin _$MealPlan {
  String get id => throw _privateConstructorUsedError;
  String get weekIdentifier =>
      throw _privateConstructorUsedError; // "2025-W48" format
  List<PlannedMeal> get meals => throw _privateConstructorUsedError;
  List<CoordinatedCookingPlan> get coordinatedPlans =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MealPlanCopyWith<MealPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPlanCopyWith<$Res> {
  factory $MealPlanCopyWith(MealPlan value, $Res Function(MealPlan) then) =
      _$MealPlanCopyWithImpl<$Res, MealPlan>;
  @useResult
  $Res call(
      {String id,
      String weekIdentifier,
      List<PlannedMeal> meals,
      List<CoordinatedCookingPlan> coordinatedPlans,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$MealPlanCopyWithImpl<$Res, $Val extends MealPlan>
    implements $MealPlanCopyWith<$Res> {
  _$MealPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekIdentifier = null,
    Object? meals = null,
    Object? coordinatedPlans = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      weekIdentifier: null == weekIdentifier
          ? _value.weekIdentifier
          : weekIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<PlannedMeal>,
      coordinatedPlans: null == coordinatedPlans
          ? _value.coordinatedPlans
          : coordinatedPlans // ignore: cast_nullable_to_non_nullable
              as List<CoordinatedCookingPlan>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealPlanImplCopyWith<$Res>
    implements $MealPlanCopyWith<$Res> {
  factory _$$MealPlanImplCopyWith(
          _$MealPlanImpl value, $Res Function(_$MealPlanImpl) then) =
      __$$MealPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String weekIdentifier,
      List<PlannedMeal> meals,
      List<CoordinatedCookingPlan> coordinatedPlans,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$MealPlanImplCopyWithImpl<$Res>
    extends _$MealPlanCopyWithImpl<$Res, _$MealPlanImpl>
    implements _$$MealPlanImplCopyWith<$Res> {
  __$$MealPlanImplCopyWithImpl(
      _$MealPlanImpl _value, $Res Function(_$MealPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekIdentifier = null,
    Object? meals = null,
    Object? coordinatedPlans = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MealPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      weekIdentifier: null == weekIdentifier
          ? _value.weekIdentifier
          : weekIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<PlannedMeal>,
      coordinatedPlans: null == coordinatedPlans
          ? _value._coordinatedPlans
          : coordinatedPlans // ignore: cast_nullable_to_non_nullable
              as List<CoordinatedCookingPlan>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealPlanImpl implements _MealPlan {
  const _$MealPlanImpl(
      {required this.id,
      required this.weekIdentifier,
      required final List<PlannedMeal> meals,
      required final List<CoordinatedCookingPlan> coordinatedPlans,
      this.createdAt,
      this.updatedAt})
      : _meals = meals,
        _coordinatedPlans = coordinatedPlans;

  factory _$MealPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealPlanImplFromJson(json);

  @override
  final String id;
  @override
  final String weekIdentifier;
// "2025-W48" format
  final List<PlannedMeal> _meals;
// "2025-W48" format
  @override
  List<PlannedMeal> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  final List<CoordinatedCookingPlan> _coordinatedPlans;
  @override
  List<CoordinatedCookingPlan> get coordinatedPlans {
    if (_coordinatedPlans is EqualUnmodifiableListView)
      return _coordinatedPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinatedPlans);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MealPlan(id: $id, weekIdentifier: $weekIdentifier, meals: $meals, coordinatedPlans: $coordinatedPlans, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekIdentifier, weekIdentifier) ||
                other.weekIdentifier == weekIdentifier) &&
            const DeepCollectionEquality().equals(other._meals, _meals) &&
            const DeepCollectionEquality()
                .equals(other._coordinatedPlans, _coordinatedPlans) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      weekIdentifier,
      const DeepCollectionEquality().hash(_meals),
      const DeepCollectionEquality().hash(_coordinatedPlans),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPlanImplCopyWith<_$MealPlanImpl> get copyWith =>
      __$$MealPlanImplCopyWithImpl<_$MealPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealPlanImplToJson(
      this,
    );
  }
}

abstract class _MealPlan implements MealPlan {
  const factory _MealPlan(
      {required final String id,
      required final String weekIdentifier,
      required final List<PlannedMeal> meals,
      required final List<CoordinatedCookingPlan> coordinatedPlans,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$MealPlanImpl;

  factory _MealPlan.fromJson(Map<String, dynamic> json) =
      _$MealPlanImpl.fromJson;

  @override
  String get id;
  @override
  String get weekIdentifier;
  @override // "2025-W48" format
  List<PlannedMeal> get meals;
  @override
  List<CoordinatedCookingPlan> get coordinatedPlans;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$MealPlanImplCopyWith<_$MealPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlannedMeal _$PlannedMealFromJson(Map<String, dynamic> json) {
  return _PlannedMeal.fromJson(json);
}

/// @nodoc
mixin _$PlannedMeal {
  Recipe get recipe => throw _privateConstructorUsedError;
  int get dayOfWeek =>
      throw _privateConstructorUsedError; // 1-7 (Monday-Sunday)
  String get mealType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlannedMealCopyWith<PlannedMeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannedMealCopyWith<$Res> {
  factory $PlannedMealCopyWith(
          PlannedMeal value, $Res Function(PlannedMeal) then) =
      _$PlannedMealCopyWithImpl<$Res, PlannedMeal>;
  @useResult
  $Res call({Recipe recipe, int dayOfWeek, String mealType});

  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class _$PlannedMealCopyWithImpl<$Res, $Val extends PlannedMeal>
    implements $PlannedMealCopyWith<$Res> {
  _$PlannedMealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
    Object? dayOfWeek = null,
    Object? mealType = null,
  }) {
    return _then(_value.copyWith(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<$Res> get recipe {
    return $RecipeCopyWith<$Res>(_value.recipe, (value) {
      return _then(_value.copyWith(recipe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlannedMealImplCopyWith<$Res>
    implements $PlannedMealCopyWith<$Res> {
  factory _$$PlannedMealImplCopyWith(
          _$PlannedMealImpl value, $Res Function(_$PlannedMealImpl) then) =
      __$$PlannedMealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Recipe recipe, int dayOfWeek, String mealType});

  @override
  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class __$$PlannedMealImplCopyWithImpl<$Res>
    extends _$PlannedMealCopyWithImpl<$Res, _$PlannedMealImpl>
    implements _$$PlannedMealImplCopyWith<$Res> {
  __$$PlannedMealImplCopyWithImpl(
      _$PlannedMealImpl _value, $Res Function(_$PlannedMealImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
    Object? dayOfWeek = null,
    Object? mealType = null,
  }) {
    return _then(_$PlannedMealImpl(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannedMealImpl implements _PlannedMeal {
  const _$PlannedMealImpl(
      {required this.recipe, required this.dayOfWeek, required this.mealType});

  factory _$PlannedMealImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannedMealImplFromJson(json);

  @override
  final Recipe recipe;
  @override
  final int dayOfWeek;
// 1-7 (Monday-Sunday)
  @override
  final String mealType;

  @override
  String toString() {
    return 'PlannedMeal(recipe: $recipe, dayOfWeek: $dayOfWeek, mealType: $mealType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannedMealImpl &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, recipe, dayOfWeek, mealType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannedMealImplCopyWith<_$PlannedMealImpl> get copyWith =>
      __$$PlannedMealImplCopyWithImpl<_$PlannedMealImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannedMealImplToJson(
      this,
    );
  }
}

abstract class _PlannedMeal implements PlannedMeal {
  const factory _PlannedMeal(
      {required final Recipe recipe,
      required final int dayOfWeek,
      required final String mealType}) = _$PlannedMealImpl;

  factory _PlannedMeal.fromJson(Map<String, dynamic> json) =
      _$PlannedMealImpl.fromJson;

  @override
  Recipe get recipe;
  @override
  int get dayOfWeek;
  @override // 1-7 (Monday-Sunday)
  String get mealType;
  @override
  @JsonKey(ignore: true)
  _$$PlannedMealImplCopyWith<_$PlannedMealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoordinatedCookingPlan _$CoordinatedCookingPlanFromJson(
    Map<String, dynamic> json) {
  return _CoordinatedCookingPlan.fromJson(json);
}

/// @nodoc
mixin _$CoordinatedCookingPlan {
  String get id => throw _privateConstructorUsedError;
  List<String> get recipeIds => throw _privateConstructorUsedError;
  List<CoordinatedStep> get steps => throw _privateConstructorUsedError;
  int get totalDurationMinutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordinatedCookingPlanCopyWith<CoordinatedCookingPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatedCookingPlanCopyWith<$Res> {
  factory $CoordinatedCookingPlanCopyWith(CoordinatedCookingPlan value,
          $Res Function(CoordinatedCookingPlan) then) =
      _$CoordinatedCookingPlanCopyWithImpl<$Res, CoordinatedCookingPlan>;
  @useResult
  $Res call(
      {String id,
      List<String> recipeIds,
      List<CoordinatedStep> steps,
      int totalDurationMinutes});
}

/// @nodoc
class _$CoordinatedCookingPlanCopyWithImpl<$Res,
        $Val extends CoordinatedCookingPlan>
    implements $CoordinatedCookingPlanCopyWith<$Res> {
  _$CoordinatedCookingPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeIds = null,
    Object? steps = null,
    Object? totalDurationMinutes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recipeIds: null == recipeIds
          ? _value.recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<CoordinatedStep>,
      totalDurationMinutes: null == totalDurationMinutes
          ? _value.totalDurationMinutes
          : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinatedCookingPlanImplCopyWith<$Res>
    implements $CoordinatedCookingPlanCopyWith<$Res> {
  factory _$$CoordinatedCookingPlanImplCopyWith(
          _$CoordinatedCookingPlanImpl value,
          $Res Function(_$CoordinatedCookingPlanImpl) then) =
      __$$CoordinatedCookingPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> recipeIds,
      List<CoordinatedStep> steps,
      int totalDurationMinutes});
}

/// @nodoc
class __$$CoordinatedCookingPlanImplCopyWithImpl<$Res>
    extends _$CoordinatedCookingPlanCopyWithImpl<$Res,
        _$CoordinatedCookingPlanImpl>
    implements _$$CoordinatedCookingPlanImplCopyWith<$Res> {
  __$$CoordinatedCookingPlanImplCopyWithImpl(
      _$CoordinatedCookingPlanImpl _value,
      $Res Function(_$CoordinatedCookingPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeIds = null,
    Object? steps = null,
    Object? totalDurationMinutes = null,
  }) {
    return _then(_$CoordinatedCookingPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recipeIds: null == recipeIds
          ? _value._recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<CoordinatedStep>,
      totalDurationMinutes: null == totalDurationMinutes
          ? _value.totalDurationMinutes
          : totalDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoordinatedCookingPlanImpl implements _CoordinatedCookingPlan {
  const _$CoordinatedCookingPlanImpl(
      {required this.id,
      required final List<String> recipeIds,
      required final List<CoordinatedStep> steps,
      required this.totalDurationMinutes})
      : _recipeIds = recipeIds,
        _steps = steps;

  factory _$CoordinatedCookingPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinatedCookingPlanImplFromJson(json);

  @override
  final String id;
  final List<String> _recipeIds;
  @override
  List<String> get recipeIds {
    if (_recipeIds is EqualUnmodifiableListView) return _recipeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeIds);
  }

  final List<CoordinatedStep> _steps;
  @override
  List<CoordinatedStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final int totalDurationMinutes;

  @override
  String toString() {
    return 'CoordinatedCookingPlan(id: $id, recipeIds: $recipeIds, steps: $steps, totalDurationMinutes: $totalDurationMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatedCookingPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._recipeIds, _recipeIds) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.totalDurationMinutes, totalDurationMinutes) ||
                other.totalDurationMinutes == totalDurationMinutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_recipeIds),
      const DeepCollectionEquality().hash(_steps),
      totalDurationMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatedCookingPlanImplCopyWith<_$CoordinatedCookingPlanImpl>
      get copyWith => __$$CoordinatedCookingPlanImplCopyWithImpl<
          _$CoordinatedCookingPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinatedCookingPlanImplToJson(
      this,
    );
  }
}

abstract class _CoordinatedCookingPlan implements CoordinatedCookingPlan {
  const factory _CoordinatedCookingPlan(
      {required final String id,
      required final List<String> recipeIds,
      required final List<CoordinatedStep> steps,
      required final int totalDurationMinutes}) = _$CoordinatedCookingPlanImpl;

  factory _CoordinatedCookingPlan.fromJson(Map<String, dynamic> json) =
      _$CoordinatedCookingPlanImpl.fromJson;

  @override
  String get id;
  @override
  List<String> get recipeIds;
  @override
  List<CoordinatedStep> get steps;
  @override
  int get totalDurationMinutes;
  @override
  @JsonKey(ignore: true)
  _$$CoordinatedCookingPlanImplCopyWith<_$CoordinatedCookingPlanImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CoordinatedStep _$CoordinatedStepFromJson(Map<String, dynamic> json) {
  return _CoordinatedStep.fromJson(json);
}

/// @nodoc
mixin _$CoordinatedStep {
  int get stepNumber => throw _privateConstructorUsedError;
  int get timeSlot =>
      throw _privateConstructorUsedError; // Minute, bei der dieser Schritt startet
  Map<String, String> get recipeSteps =>
      throw _privateConstructorUsedError; // recipeId -> description
  int get durationMinutes => throw _privateConstructorUsedError;
  List<String> get parallelize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordinatedStepCopyWith<CoordinatedStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatedStepCopyWith<$Res> {
  factory $CoordinatedStepCopyWith(
          CoordinatedStep value, $Res Function(CoordinatedStep) then) =
      _$CoordinatedStepCopyWithImpl<$Res, CoordinatedStep>;
  @useResult
  $Res call(
      {int stepNumber,
      int timeSlot,
      Map<String, String> recipeSteps,
      int durationMinutes,
      List<String> parallelize});
}

/// @nodoc
class _$CoordinatedStepCopyWithImpl<$Res, $Val extends CoordinatedStep>
    implements $CoordinatedStepCopyWith<$Res> {
  _$CoordinatedStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? timeSlot = null,
    Object? recipeSteps = null,
    Object? durationMinutes = null,
    Object? parallelize = null,
  }) {
    return _then(_value.copyWith(
      stepNumber: null == stepNumber
          ? _value.stepNumber
          : stepNumber // ignore: cast_nullable_to_non_nullable
              as int,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as int,
      recipeSteps: null == recipeSteps
          ? _value.recipeSteps
          : recipeSteps // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      parallelize: null == parallelize
          ? _value.parallelize
          : parallelize // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinatedStepImplCopyWith<$Res>
    implements $CoordinatedStepCopyWith<$Res> {
  factory _$$CoordinatedStepImplCopyWith(_$CoordinatedStepImpl value,
          $Res Function(_$CoordinatedStepImpl) then) =
      __$$CoordinatedStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int stepNumber,
      int timeSlot,
      Map<String, String> recipeSteps,
      int durationMinutes,
      List<String> parallelize});
}

/// @nodoc
class __$$CoordinatedStepImplCopyWithImpl<$Res>
    extends _$CoordinatedStepCopyWithImpl<$Res, _$CoordinatedStepImpl>
    implements _$$CoordinatedStepImplCopyWith<$Res> {
  __$$CoordinatedStepImplCopyWithImpl(
      _$CoordinatedStepImpl _value, $Res Function(_$CoordinatedStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? timeSlot = null,
    Object? recipeSteps = null,
    Object? durationMinutes = null,
    Object? parallelize = null,
  }) {
    return _then(_$CoordinatedStepImpl(
      stepNumber: null == stepNumber
          ? _value.stepNumber
          : stepNumber // ignore: cast_nullable_to_non_nullable
              as int,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as int,
      recipeSteps: null == recipeSteps
          ? _value._recipeSteps
          : recipeSteps // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      parallelize: null == parallelize
          ? _value._parallelize
          : parallelize // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoordinatedStepImpl implements _CoordinatedStep {
  const _$CoordinatedStepImpl(
      {required this.stepNumber,
      required this.timeSlot,
      required final Map<String, String> recipeSteps,
      required this.durationMinutes,
      required final List<String> parallelize})
      : _recipeSteps = recipeSteps,
        _parallelize = parallelize;

  factory _$CoordinatedStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinatedStepImplFromJson(json);

  @override
  final int stepNumber;
  @override
  final int timeSlot;
// Minute, bei der dieser Schritt startet
  final Map<String, String> _recipeSteps;
// Minute, bei der dieser Schritt startet
  @override
  Map<String, String> get recipeSteps {
    if (_recipeSteps is EqualUnmodifiableMapView) return _recipeSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_recipeSteps);
  }

// recipeId -> description
  @override
  final int durationMinutes;
  final List<String> _parallelize;
  @override
  List<String> get parallelize {
    if (_parallelize is EqualUnmodifiableListView) return _parallelize;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parallelize);
  }

  @override
  String toString() {
    return 'CoordinatedStep(stepNumber: $stepNumber, timeSlot: $timeSlot, recipeSteps: $recipeSteps, durationMinutes: $durationMinutes, parallelize: $parallelize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatedStepImpl &&
            (identical(other.stepNumber, stepNumber) ||
                other.stepNumber == stepNumber) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            const DeepCollectionEquality()
                .equals(other._recipeSteps, _recipeSteps) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            const DeepCollectionEquality()
                .equals(other._parallelize, _parallelize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stepNumber,
      timeSlot,
      const DeepCollectionEquality().hash(_recipeSteps),
      durationMinutes,
      const DeepCollectionEquality().hash(_parallelize));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatedStepImplCopyWith<_$CoordinatedStepImpl> get copyWith =>
      __$$CoordinatedStepImplCopyWithImpl<_$CoordinatedStepImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinatedStepImplToJson(
      this,
    );
  }
}

abstract class _CoordinatedStep implements CoordinatedStep {
  const factory _CoordinatedStep(
      {required final int stepNumber,
      required final int timeSlot,
      required final Map<String, String> recipeSteps,
      required final int durationMinutes,
      required final List<String> parallelize}) = _$CoordinatedStepImpl;

  factory _CoordinatedStep.fromJson(Map<String, dynamic> json) =
      _$CoordinatedStepImpl.fromJson;

  @override
  int get stepNumber;
  @override
  int get timeSlot;
  @override // Minute, bei der dieser Schritt startet
  Map<String, String> get recipeSteps;
  @override // recipeId -> description
  int get durationMinutes;
  @override
  List<String> get parallelize;
  @override
  @JsonKey(ignore: true)
  _$$CoordinatedStepImplCopyWith<_$CoordinatedStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
