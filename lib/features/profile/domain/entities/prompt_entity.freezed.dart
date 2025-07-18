// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PromptEntity {

 String get id; String get profileId; String get question; String get response; int get displayOrder; DateTime get createdAt;
/// Create a copy of PromptEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptEntityCopyWith<PromptEntity> get copyWith => _$PromptEntityCopyWithImpl<PromptEntity>(this as PromptEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.question, question) || other.question == question)&&(identical(other.response, response) || other.response == response)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,question,response,displayOrder,createdAt);

@override
String toString() {
  return 'PromptEntity(id: $id, profileId: $profileId, question: $question, response: $response, displayOrder: $displayOrder, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PromptEntityCopyWith<$Res>  {
  factory $PromptEntityCopyWith(PromptEntity value, $Res Function(PromptEntity) _then) = _$PromptEntityCopyWithImpl;
@useResult
$Res call({
 String id, String profileId, String question, String response, int displayOrder, DateTime createdAt
});




}
/// @nodoc
class _$PromptEntityCopyWithImpl<$Res>
    implements $PromptEntityCopyWith<$Res> {
  _$PromptEntityCopyWithImpl(this._self, this._then);

  final PromptEntity _self;
  final $Res Function(PromptEntity) _then;

/// Create a copy of PromptEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profileId = null,Object? question = null,Object? response = null,Object? displayOrder = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PromptEntity].
extension PromptEntityPatterns on PromptEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptEntity value)  $default,){
final _that = this;
switch (_that) {
case _PromptEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PromptEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String profileId,  String question,  String response,  int displayOrder,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.question,_that.response,_that.displayOrder,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String profileId,  String question,  String response,  int displayOrder,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PromptEntity():
return $default(_that.id,_that.profileId,_that.question,_that.response,_that.displayOrder,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String profileId,  String question,  String response,  int displayOrder,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PromptEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.question,_that.response,_that.displayOrder,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _PromptEntity extends PromptEntity {
  const _PromptEntity({required this.id, required this.profileId, required this.question, required this.response, required this.displayOrder, required this.createdAt}): super._();
  

@override final  String id;
@override final  String profileId;
@override final  String question;
@override final  String response;
@override final  int displayOrder;
@override final  DateTime createdAt;

/// Create a copy of PromptEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptEntityCopyWith<_PromptEntity> get copyWith => __$PromptEntityCopyWithImpl<_PromptEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.question, question) || other.question == question)&&(identical(other.response, response) || other.response == response)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,question,response,displayOrder,createdAt);

@override
String toString() {
  return 'PromptEntity(id: $id, profileId: $profileId, question: $question, response: $response, displayOrder: $displayOrder, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PromptEntityCopyWith<$Res> implements $PromptEntityCopyWith<$Res> {
  factory _$PromptEntityCopyWith(_PromptEntity value, $Res Function(_PromptEntity) _then) = __$PromptEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String profileId, String question, String response, int displayOrder, DateTime createdAt
});




}
/// @nodoc
class __$PromptEntityCopyWithImpl<$Res>
    implements _$PromptEntityCopyWith<$Res> {
  __$PromptEntityCopyWithImpl(this._self, this._then);

  final _PromptEntity _self;
  final $Res Function(_PromptEntity) _then;

/// Create a copy of PromptEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? profileId = null,Object? question = null,Object? response = null,Object? displayOrder = null,Object? createdAt = null,}) {
  return _then(_PromptEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
