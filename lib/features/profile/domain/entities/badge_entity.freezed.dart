// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BadgeEntity {

 String get id; String get profileId; String get badge; BadgeType get type; String? get description; bool get isVisible; bool get isRare; DateTime? get earnedAt; DateTime? get expiresAt; String? get iconUrl; String? get color;// Hex color for badge display
 DateTime get createdAt;
/// Create a copy of BadgeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeEntityCopyWith<BadgeEntity> get copyWith => _$BadgeEntityCopyWithImpl<BadgeEntity>(this as BadgeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadgeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isRare, isRare) || other.isRare == isRare)&&(identical(other.earnedAt, earnedAt) || other.earnedAt == earnedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.color, color) || other.color == color)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,badge,type,description,isVisible,isRare,earnedAt,expiresAt,iconUrl,color,createdAt);

@override
String toString() {
  return 'BadgeEntity(id: $id, profileId: $profileId, badge: $badge, type: $type, description: $description, isVisible: $isVisible, isRare: $isRare, earnedAt: $earnedAt, expiresAt: $expiresAt, iconUrl: $iconUrl, color: $color, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BadgeEntityCopyWith<$Res>  {
  factory $BadgeEntityCopyWith(BadgeEntity value, $Res Function(BadgeEntity) _then) = _$BadgeEntityCopyWithImpl;
@useResult
$Res call({
 String id, String profileId, String badge, BadgeType type, String? description, bool isVisible, bool isRare, DateTime? earnedAt, DateTime? expiresAt, String? iconUrl, String? color, DateTime createdAt
});




}
/// @nodoc
class _$BadgeEntityCopyWithImpl<$Res>
    implements $BadgeEntityCopyWith<$Res> {
  _$BadgeEntityCopyWithImpl(this._self, this._then);

  final BadgeEntity _self;
  final $Res Function(BadgeEntity) _then;

/// Create a copy of BadgeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profileId = null,Object? badge = null,Object? type = null,Object? description = freezed,Object? isVisible = null,Object? isRare = null,Object? earnedAt = freezed,Object? expiresAt = freezed,Object? iconUrl = freezed,Object? color = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BadgeType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isRare: null == isRare ? _self.isRare : isRare // ignore: cast_nullable_to_non_nullable
as bool,earnedAt: freezed == earnedAt ? _self.earnedAt : earnedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BadgeEntity].
extension BadgeEntityPatterns on BadgeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BadgeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BadgeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BadgeEntity value)  $default,){
final _that = this;
switch (_that) {
case _BadgeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BadgeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BadgeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String profileId,  String badge,  BadgeType type,  String? description,  bool isVisible,  bool isRare,  DateTime? earnedAt,  DateTime? expiresAt,  String? iconUrl,  String? color,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BadgeEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.badge,_that.type,_that.description,_that.isVisible,_that.isRare,_that.earnedAt,_that.expiresAt,_that.iconUrl,_that.color,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String profileId,  String badge,  BadgeType type,  String? description,  bool isVisible,  bool isRare,  DateTime? earnedAt,  DateTime? expiresAt,  String? iconUrl,  String? color,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _BadgeEntity():
return $default(_that.id,_that.profileId,_that.badge,_that.type,_that.description,_that.isVisible,_that.isRare,_that.earnedAt,_that.expiresAt,_that.iconUrl,_that.color,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String profileId,  String badge,  BadgeType type,  String? description,  bool isVisible,  bool isRare,  DateTime? earnedAt,  DateTime? expiresAt,  String? iconUrl,  String? color,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BadgeEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.badge,_that.type,_that.description,_that.isVisible,_that.isRare,_that.earnedAt,_that.expiresAt,_that.iconUrl,_that.color,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _BadgeEntity extends BadgeEntity {
  const _BadgeEntity({required this.id, required this.profileId, required this.badge, required this.type, this.description, this.isVisible = true, this.isRare = false, this.earnedAt, this.expiresAt, this.iconUrl, this.color, required this.createdAt}): super._();
  

@override final  String id;
@override final  String profileId;
@override final  String badge;
@override final  BadgeType type;
@override final  String? description;
@override@JsonKey() final  bool isVisible;
@override@JsonKey() final  bool isRare;
@override final  DateTime? earnedAt;
@override final  DateTime? expiresAt;
@override final  String? iconUrl;
@override final  String? color;
// Hex color for badge display
@override final  DateTime createdAt;

/// Create a copy of BadgeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeEntityCopyWith<_BadgeEntity> get copyWith => __$BadgeEntityCopyWithImpl<_BadgeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadgeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isRare, isRare) || other.isRare == isRare)&&(identical(other.earnedAt, earnedAt) || other.earnedAt == earnedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.color, color) || other.color == color)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,badge,type,description,isVisible,isRare,earnedAt,expiresAt,iconUrl,color,createdAt);

@override
String toString() {
  return 'BadgeEntity(id: $id, profileId: $profileId, badge: $badge, type: $type, description: $description, isVisible: $isVisible, isRare: $isRare, earnedAt: $earnedAt, expiresAt: $expiresAt, iconUrl: $iconUrl, color: $color, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BadgeEntityCopyWith<$Res> implements $BadgeEntityCopyWith<$Res> {
  factory _$BadgeEntityCopyWith(_BadgeEntity value, $Res Function(_BadgeEntity) _then) = __$BadgeEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String profileId, String badge, BadgeType type, String? description, bool isVisible, bool isRare, DateTime? earnedAt, DateTime? expiresAt, String? iconUrl, String? color, DateTime createdAt
});




}
/// @nodoc
class __$BadgeEntityCopyWithImpl<$Res>
    implements _$BadgeEntityCopyWith<$Res> {
  __$BadgeEntityCopyWithImpl(this._self, this._then);

  final _BadgeEntity _self;
  final $Res Function(_BadgeEntity) _then;

/// Create a copy of BadgeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? profileId = null,Object? badge = null,Object? type = null,Object? description = freezed,Object? isVisible = null,Object? isRare = null,Object? earnedAt = freezed,Object? expiresAt = freezed,Object? iconUrl = freezed,Object? color = freezed,Object? createdAt = null,}) {
  return _then(_BadgeEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BadgeType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isRare: null == isRare ? _self.isRare : isRare // ignore: cast_nullable_to_non_nullable
as bool,earnedAt: freezed == earnedAt ? _self.earnedAt : earnedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
