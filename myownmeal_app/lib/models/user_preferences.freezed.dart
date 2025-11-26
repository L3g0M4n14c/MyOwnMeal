// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  String get userId => throw _privateConstructorUsedError;
  List<String> get defaultTags =>
      throw _privateConstructorUsedError; // vegan, vegetarisch, proteinreich, lowcarb, etc.
  int get defaultRecipesPerWeek => throw _privateConstructorUsedError;
  int get defaultCookingTimeMinutes => throw _privateConstructorUsedError;
  bool get allowRepeatRecipes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {String userId,
      List<String> defaultTags,
      int defaultRecipesPerWeek,
      int defaultCookingTimeMinutes,
      bool allowRepeatRecipes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? defaultTags = null,
    Object? defaultRecipesPerWeek = null,
    Object? defaultCookingTimeMinutes = null,
    Object? allowRepeatRecipes = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      defaultTags: null == defaultTags
          ? _value.defaultTags
          : defaultTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultRecipesPerWeek: null == defaultRecipesPerWeek
          ? _value.defaultRecipesPerWeek
          : defaultRecipesPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      defaultCookingTimeMinutes: null == defaultCookingTimeMinutes
          ? _value.defaultCookingTimeMinutes
          : defaultCookingTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      allowRepeatRecipes: null == allowRepeatRecipes
          ? _value.allowRepeatRecipes
          : allowRepeatRecipes // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      List<String> defaultTags,
      int defaultRecipesPerWeek,
      int defaultCookingTimeMinutes,
      bool allowRepeatRecipes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? defaultTags = null,
    Object? defaultRecipesPerWeek = null,
    Object? defaultCookingTimeMinutes = null,
    Object? allowRepeatRecipes = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserPreferencesImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      defaultTags: null == defaultTags
          ? _value._defaultTags
          : defaultTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultRecipesPerWeek: null == defaultRecipesPerWeek
          ? _value.defaultRecipesPerWeek
          : defaultRecipesPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      defaultCookingTimeMinutes: null == defaultCookingTimeMinutes
          ? _value.defaultCookingTimeMinutes
          : defaultCookingTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      allowRepeatRecipes: null == allowRepeatRecipes
          ? _value.allowRepeatRecipes
          : allowRepeatRecipes // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {required this.userId,
      required final List<String> defaultTags,
      required this.defaultRecipesPerWeek,
      required this.defaultCookingTimeMinutes,
      required this.allowRepeatRecipes,
      this.createdAt,
      this.updatedAt})
      : _defaultTags = defaultTags;

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  final String userId;
  final List<String> _defaultTags;
  @override
  List<String> get defaultTags {
    if (_defaultTags is EqualUnmodifiableListView) return _defaultTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_defaultTags);
  }

// vegan, vegetarisch, proteinreich, lowcarb, etc.
  @override
  final int defaultRecipesPerWeek;
  @override
  final int defaultCookingTimeMinutes;
  @override
  final bool allowRepeatRecipes;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserPreferences(userId: $userId, defaultTags: $defaultTags, defaultRecipesPerWeek: $defaultRecipesPerWeek, defaultCookingTimeMinutes: $defaultCookingTimeMinutes, allowRepeatRecipes: $allowRepeatRecipes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._defaultTags, _defaultTags) &&
            (identical(other.defaultRecipesPerWeek, defaultRecipesPerWeek) ||
                other.defaultRecipesPerWeek == defaultRecipesPerWeek) &&
            (identical(other.defaultCookingTimeMinutes,
                    defaultCookingTimeMinutes) ||
                other.defaultCookingTimeMinutes == defaultCookingTimeMinutes) &&
            (identical(other.allowRepeatRecipes, allowRepeatRecipes) ||
                other.allowRepeatRecipes == allowRepeatRecipes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(_defaultTags),
      defaultRecipesPerWeek,
      defaultCookingTimeMinutes,
      allowRepeatRecipes,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {required final String userId,
      required final List<String> defaultTags,
      required final int defaultRecipesPerWeek,
      required final int defaultCookingTimeMinutes,
      required final bool allowRepeatRecipes,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  String get userId;
  @override
  List<String> get defaultTags;
  @override // vegan, vegetarisch, proteinreich, lowcarb, etc.
  int get defaultRecipesPerWeek;
  @override
  int get defaultCookingTimeMinutes;
  @override
  bool get allowRepeatRecipes;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyPreferences _$WeeklyPreferencesFromJson(Map<String, dynamic> json) {
  return _WeeklyPreferences.fromJson(json);
}

/// @nodoc
mixin _$WeeklyPreferences {
  String get weekIdentifier =>
      throw _privateConstructorUsedError; // "2025-W48" format
  List<String> get tags => throw _privateConstructorUsedError;
  int get recipesPerWeek => throw _privateConstructorUsedError;
  int get cookingTimeMinutes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeeklyPreferencesCopyWith<WeeklyPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyPreferencesCopyWith<$Res> {
  factory $WeeklyPreferencesCopyWith(
          WeeklyPreferences value, $Res Function(WeeklyPreferences) then) =
      _$WeeklyPreferencesCopyWithImpl<$Res, WeeklyPreferences>;
  @useResult
  $Res call(
      {String weekIdentifier,
      List<String> tags,
      int recipesPerWeek,
      int cookingTimeMinutes,
      DateTime? createdAt});
}

/// @nodoc
class _$WeeklyPreferencesCopyWithImpl<$Res, $Val extends WeeklyPreferences>
    implements $WeeklyPreferencesCopyWith<$Res> {
  _$WeeklyPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekIdentifier = null,
    Object? tags = null,
    Object? recipesPerWeek = null,
    Object? cookingTimeMinutes = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      weekIdentifier: null == weekIdentifier
          ? _value.weekIdentifier
          : weekIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recipesPerWeek: null == recipesPerWeek
          ? _value.recipesPerWeek
          : recipesPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      cookingTimeMinutes: null == cookingTimeMinutes
          ? _value.cookingTimeMinutes
          : cookingTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyPreferencesImplCopyWith<$Res>
    implements $WeeklyPreferencesCopyWith<$Res> {
  factory _$$WeeklyPreferencesImplCopyWith(_$WeeklyPreferencesImpl value,
          $Res Function(_$WeeklyPreferencesImpl) then) =
      __$$WeeklyPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String weekIdentifier,
      List<String> tags,
      int recipesPerWeek,
      int cookingTimeMinutes,
      DateTime? createdAt});
}

/// @nodoc
class __$$WeeklyPreferencesImplCopyWithImpl<$Res>
    extends _$WeeklyPreferencesCopyWithImpl<$Res, _$WeeklyPreferencesImpl>
    implements _$$WeeklyPreferencesImplCopyWith<$Res> {
  __$$WeeklyPreferencesImplCopyWithImpl(_$WeeklyPreferencesImpl _value,
      $Res Function(_$WeeklyPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekIdentifier = null,
    Object? tags = null,
    Object? recipesPerWeek = null,
    Object? cookingTimeMinutes = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$WeeklyPreferencesImpl(
      weekIdentifier: null == weekIdentifier
          ? _value.weekIdentifier
          : weekIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recipesPerWeek: null == recipesPerWeek
          ? _value.recipesPerWeek
          : recipesPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      cookingTimeMinutes: null == cookingTimeMinutes
          ? _value.cookingTimeMinutes
          : cookingTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyPreferencesImpl implements _WeeklyPreferences {
  const _$WeeklyPreferencesImpl(
      {required this.weekIdentifier,
      required final List<String> tags,
      required this.recipesPerWeek,
      required this.cookingTimeMinutes,
      this.createdAt})
      : _tags = tags;

  factory _$WeeklyPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyPreferencesImplFromJson(json);

  @override
  final String weekIdentifier;
// "2025-W48" format
  final List<String> _tags;
// "2025-W48" format
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final int recipesPerWeek;
  @override
  final int cookingTimeMinutes;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'WeeklyPreferences(weekIdentifier: $weekIdentifier, tags: $tags, recipesPerWeek: $recipesPerWeek, cookingTimeMinutes: $cookingTimeMinutes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyPreferencesImpl &&
            (identical(other.weekIdentifier, weekIdentifier) ||
                other.weekIdentifier == weekIdentifier) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.recipesPerWeek, recipesPerWeek) ||
                other.recipesPerWeek == recipesPerWeek) &&
            (identical(other.cookingTimeMinutes, cookingTimeMinutes) ||
                other.cookingTimeMinutes == cookingTimeMinutes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      weekIdentifier,
      const DeepCollectionEquality().hash(_tags),
      recipesPerWeek,
      cookingTimeMinutes,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyPreferencesImplCopyWith<_$WeeklyPreferencesImpl> get copyWith =>
      __$$WeeklyPreferencesImplCopyWithImpl<_$WeeklyPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyPreferencesImplToJson(
      this,
    );
  }
}

abstract class _WeeklyPreferences implements WeeklyPreferences {
  const factory _WeeklyPreferences(
      {required final String weekIdentifier,
      required final List<String> tags,
      required final int recipesPerWeek,
      required final int cookingTimeMinutes,
      final DateTime? createdAt}) = _$WeeklyPreferencesImpl;

  factory _WeeklyPreferences.fromJson(Map<String, dynamic> json) =
      _$WeeklyPreferencesImpl.fromJson;

  @override
  String get weekIdentifier;
  @override // "2025-W48" format
  List<String> get tags;
  @override
  int get recipesPerWeek;
  @override
  int get cookingTimeMinutes;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$WeeklyPreferencesImplCopyWith<_$WeeklyPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
