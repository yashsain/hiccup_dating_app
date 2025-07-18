// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interest_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InterestEntity {

 String get id; String get profileId; String get interest; InterestCategory get category; int get popularity; bool get isCustom; DateTime get createdAt;
/// Create a copy of InterestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterestEntityCopyWith<InterestEntity> get copyWith => _$InterestEntityCopyWithImpl<InterestEntity>(this as InterestEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.category, category) || other.category == category)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,interest,category,popularity,isCustom,createdAt);

@override
String toString() {
  return 'InterestEntity(id: $id, profileId: $profileId, interest: $interest, category: $category, popularity: $popularity, isCustom: $isCustom, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $InterestEntityCopyWith<$Res>  {
  factory $InterestEntityCopyWith(InterestEntity value, $Res Function(InterestEntity) _then) = _$InterestEntityCopyWithImpl;
@useResult
$Res call({
 String id, String profileId, String interest, InterestCategory category, int popularity, bool isCustom, DateTime createdAt
});




}
/// @nodoc
class _$InterestEntityCopyWithImpl<$Res>
    implements $InterestEntityCopyWith<$Res> {
  _$InterestEntityCopyWithImpl(this._self, this._then);

  final InterestEntity _self;
  final $Res Function(InterestEntity) _then;

/// Create a copy of InterestEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profileId = null,Object? interest = null,Object? category = null,Object? popularity = null,Object? isCustom = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as InterestCategory,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [InterestEntity].
extension InterestEntityPatterns on InterestEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterestEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterestEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterestEntity value)  $default,){
final _that = this;
switch (_that) {
case _InterestEntity():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterestEntity value)?  $default,){
final _that = this;
switch (_that) {
case _InterestEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String profileId,  String interest,  InterestCategory category,  int popularity,  bool isCustom,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterestEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.interest,_that.category,_that.popularity,_that.isCustom,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String profileId,  String interest,  InterestCategory category,  int popularity,  bool isCustom,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _InterestEntity():
return $default(_that.id,_that.profileId,_that.interest,_that.category,_that.popularity,_that.isCustom,_that.createdAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String profileId,  String interest,  InterestCategory category,  int popularity,  bool isCustom,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _InterestEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.interest,_that.category,_that.popularity,_that.isCustom,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _InterestEntity extends InterestEntity {
  const _InterestEntity({required this.id, required this.profileId, required this.interest, required this.category, this.popularity = 0, this.isCustom = false, required this.createdAt}): super._();
  

@override final  String id;
@override final  String profileId;
@override final  String interest;
@override final  InterestCategory category;
@override@JsonKey() final  int popularity;
@override@JsonKey() final  bool isCustom;
@override final  DateTime createdAt;

/// Create a copy of InterestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterestEntityCopyWith<_InterestEntity> get copyWith => __$InterestEntityCopyWithImpl<_InterestEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.category, category) || other.category == category)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,interest,category,popularity,isCustom,createdAt);

@override
String toString() {
  return 'InterestEntity(id: $id, profileId: $profileId, interest: $interest, category: $category, popularity: $popularity, isCustom: $isCustom, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$InterestEntityCopyWith<$Res> implements $InterestEntityCopyWith<$Res> {
  factory _$InterestEntityCopyWith(_InterestEntity value, $Res Function(_InterestEntity) _then) = __$InterestEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String profileId, String interest, InterestCategory category, int popularity, bool isCustom, DateTime createdAt
});




}
/// @nodoc
class __$InterestEntityCopyWithImpl<$Res>
    implements _$InterestEntityCopyWith<$Res> {
  __$InterestEntityCopyWithImpl(this._self, this._then);

  final _InterestEntity _self;
  final $Res Function(_InterestEntity) _then;

/// Create a copy of InterestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? profileId = null,Object? interest = null,Object? category = null,Object? popularity = null,Object? isCustom = null,Object? createdAt = null,}) {
  return _then(_InterestEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as InterestCategory,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
