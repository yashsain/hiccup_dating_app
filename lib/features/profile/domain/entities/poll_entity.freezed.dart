// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PollEntity {

 String get id; String get profileId; String get question; List<String> get options; bool get isActive; Map<String, int> get votes; int get totalVotes; DateTime get createdAt;
/// Create a copy of PollEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollEntityCopyWith<PollEntity> get copyWith => _$PollEntityCopyWithImpl<PollEntity>(this as PollEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.votes, votes)&&(identical(other.totalVotes, totalVotes) || other.totalVotes == totalVotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,question,const DeepCollectionEquality().hash(options),isActive,const DeepCollectionEquality().hash(votes),totalVotes,createdAt);

@override
String toString() {
  return 'PollEntity(id: $id, profileId: $profileId, question: $question, options: $options, isActive: $isActive, votes: $votes, totalVotes: $totalVotes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PollEntityCopyWith<$Res>  {
  factory $PollEntityCopyWith(PollEntity value, $Res Function(PollEntity) _then) = _$PollEntityCopyWithImpl;
@useResult
$Res call({
 String id, String profileId, String question, List<String> options, bool isActive, Map<String, int> votes, int totalVotes, DateTime createdAt
});




}
/// @nodoc
class _$PollEntityCopyWithImpl<$Res>
    implements $PollEntityCopyWith<$Res> {
  _$PollEntityCopyWithImpl(this._self, this._then);

  final PollEntity _self;
  final $Res Function(PollEntity) _then;

/// Create a copy of PollEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profileId = null,Object? question = null,Object? options = null,Object? isActive = null,Object? votes = null,Object? totalVotes = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,votes: null == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as Map<String, int>,totalVotes: null == totalVotes ? _self.totalVotes : totalVotes // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PollEntity].
extension PollEntityPatterns on PollEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PollEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PollEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PollEntity value)  $default,){
final _that = this;
switch (_that) {
case _PollEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PollEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PollEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String profileId,  String question,  List<String> options,  bool isActive,  Map<String, int> votes,  int totalVotes,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PollEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.question,_that.options,_that.isActive,_that.votes,_that.totalVotes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String profileId,  String question,  List<String> options,  bool isActive,  Map<String, int> votes,  int totalVotes,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PollEntity():
return $default(_that.id,_that.profileId,_that.question,_that.options,_that.isActive,_that.votes,_that.totalVotes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String profileId,  String question,  List<String> options,  bool isActive,  Map<String, int> votes,  int totalVotes,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PollEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.question,_that.options,_that.isActive,_that.votes,_that.totalVotes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _PollEntity extends PollEntity {
  const _PollEntity({required this.id, required this.profileId, required this.question, required final  List<String> options, this.isActive = true, final  Map<String, int> votes = const {}, this.totalVotes = 0, required this.createdAt}): _options = options,_votes = votes,super._();
  

@override final  String id;
@override final  String profileId;
@override final  String question;
 final  List<String> _options;
@override List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override@JsonKey() final  bool isActive;
 final  Map<String, int> _votes;
@override@JsonKey() Map<String, int> get votes {
  if (_votes is EqualUnmodifiableMapView) return _votes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_votes);
}

@override@JsonKey() final  int totalVotes;
@override final  DateTime createdAt;

/// Create a copy of PollEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PollEntityCopyWith<_PollEntity> get copyWith => __$PollEntityCopyWithImpl<_PollEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PollEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._votes, _votes)&&(identical(other.totalVotes, totalVotes) || other.totalVotes == totalVotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,question,const DeepCollectionEquality().hash(_options),isActive,const DeepCollectionEquality().hash(_votes),totalVotes,createdAt);

@override
String toString() {
  return 'PollEntity(id: $id, profileId: $profileId, question: $question, options: $options, isActive: $isActive, votes: $votes, totalVotes: $totalVotes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PollEntityCopyWith<$Res> implements $PollEntityCopyWith<$Res> {
  factory _$PollEntityCopyWith(_PollEntity value, $Res Function(_PollEntity) _then) = __$PollEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String profileId, String question, List<String> options, bool isActive, Map<String, int> votes, int totalVotes, DateTime createdAt
});




}
/// @nodoc
class __$PollEntityCopyWithImpl<$Res>
    implements _$PollEntityCopyWith<$Res> {
  __$PollEntityCopyWithImpl(this._self, this._then);

  final _PollEntity _self;
  final $Res Function(_PollEntity) _then;

/// Create a copy of PollEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? profileId = null,Object? question = null,Object? options = null,Object? isActive = null,Object? votes = null,Object? totalVotes = null,Object? createdAt = null,}) {
  return _then(_PollEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,votes: null == votes ? _self._votes : votes // ignore: cast_nullable_to_non_nullable
as Map<String, int>,totalVotes: null == totalVotes ? _self.totalVotes : totalVotes // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
