// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEntity {

 String get id; String get name; int get age; String get location; String get gender; String? get sexualOrientation; String? get bio; String? get datingGoals; String? get music; bool get photoVerification; bool get identityVerification; String? get premium; String? get instagramUrl; String? get spotifyUrl; DateTime get createdAt; DateTime get updatedAt; List<String> get promptIds; String? get activePollId; List<String> get mediaIds; List<String> get interestIds; List<String> get badgeIds;
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<ProfileEntity> get copyWith => _$ProfileEntityCopyWithImpl<ProfileEntity>(this as ProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.sexualOrientation, sexualOrientation) || other.sexualOrientation == sexualOrientation)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.datingGoals, datingGoals) || other.datingGoals == datingGoals)&&(identical(other.music, music) || other.music == music)&&(identical(other.photoVerification, photoVerification) || other.photoVerification == photoVerification)&&(identical(other.identityVerification, identityVerification) || other.identityVerification == identityVerification)&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.spotifyUrl, spotifyUrl) || other.spotifyUrl == spotifyUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.promptIds, promptIds)&&(identical(other.activePollId, activePollId) || other.activePollId == activePollId)&&const DeepCollectionEquality().equals(other.mediaIds, mediaIds)&&const DeepCollectionEquality().equals(other.interestIds, interestIds)&&const DeepCollectionEquality().equals(other.badgeIds, badgeIds));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,age,location,gender,sexualOrientation,bio,datingGoals,music,photoVerification,identityVerification,premium,instagramUrl,spotifyUrl,createdAt,updatedAt,const DeepCollectionEquality().hash(promptIds),activePollId,const DeepCollectionEquality().hash(mediaIds),const DeepCollectionEquality().hash(interestIds),const DeepCollectionEquality().hash(badgeIds)]);



}

/// @nodoc
abstract mixin class $ProfileEntityCopyWith<$Res>  {
  factory $ProfileEntityCopyWith(ProfileEntity value, $Res Function(ProfileEntity) _then) = _$ProfileEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, int age, String location, String gender, String? sexualOrientation, String? bio, String? datingGoals, String? music, bool photoVerification, bool identityVerification, String? premium, String? instagramUrl, String? spotifyUrl, DateTime createdAt, DateTime updatedAt, List<String> promptIds, String? activePollId, List<String> mediaIds, List<String> interestIds, List<String> badgeIds
});




}
/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._self, this._then);

  final ProfileEntity _self;
  final $Res Function(ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? age = null,Object? location = null,Object? gender = null,Object? sexualOrientation = freezed,Object? bio = freezed,Object? datingGoals = freezed,Object? music = freezed,Object? photoVerification = null,Object? identityVerification = null,Object? premium = freezed,Object? instagramUrl = freezed,Object? spotifyUrl = freezed,Object? createdAt = null,Object? updatedAt = null,Object? promptIds = null,Object? activePollId = freezed,Object? mediaIds = null,Object? interestIds = null,Object? badgeIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,sexualOrientation: freezed == sexualOrientation ? _self.sexualOrientation : sexualOrientation // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,datingGoals: freezed == datingGoals ? _self.datingGoals : datingGoals // ignore: cast_nullable_to_non_nullable
as String?,music: freezed == music ? _self.music : music // ignore: cast_nullable_to_non_nullable
as String?,photoVerification: null == photoVerification ? _self.photoVerification : photoVerification // ignore: cast_nullable_to_non_nullable
as bool,identityVerification: null == identityVerification ? _self.identityVerification : identityVerification // ignore: cast_nullable_to_non_nullable
as bool,premium: freezed == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,spotifyUrl: freezed == spotifyUrl ? _self.spotifyUrl : spotifyUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,promptIds: null == promptIds ? _self.promptIds : promptIds // ignore: cast_nullable_to_non_nullable
as List<String>,activePollId: freezed == activePollId ? _self.activePollId : activePollId // ignore: cast_nullable_to_non_nullable
as String?,mediaIds: null == mediaIds ? _self.mediaIds : mediaIds // ignore: cast_nullable_to_non_nullable
as List<String>,interestIds: null == interestIds ? _self.interestIds : interestIds // ignore: cast_nullable_to_non_nullable
as List<String>,badgeIds: null == badgeIds ? _self.badgeIds : badgeIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileEntity].
extension ProfileEntityPatterns on ProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int age,  String location,  String gender,  String? sexualOrientation,  String? bio,  String? datingGoals,  String? music,  bool photoVerification,  bool identityVerification,  String? premium,  String? instagramUrl,  String? spotifyUrl,  DateTime createdAt,  DateTime updatedAt,  List<String> promptIds,  String? activePollId,  List<String> mediaIds,  List<String> interestIds,  List<String> badgeIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.age,_that.location,_that.gender,_that.sexualOrientation,_that.bio,_that.datingGoals,_that.music,_that.photoVerification,_that.identityVerification,_that.premium,_that.instagramUrl,_that.spotifyUrl,_that.createdAt,_that.updatedAt,_that.promptIds,_that.activePollId,_that.mediaIds,_that.interestIds,_that.badgeIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int age,  String location,  String gender,  String? sexualOrientation,  String? bio,  String? datingGoals,  String? music,  bool photoVerification,  bool identityVerification,  String? premium,  String? instagramUrl,  String? spotifyUrl,  DateTime createdAt,  DateTime updatedAt,  List<String> promptIds,  String? activePollId,  List<String> mediaIds,  List<String> interestIds,  List<String> badgeIds)  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity():
return $default(_that.id,_that.name,_that.age,_that.location,_that.gender,_that.sexualOrientation,_that.bio,_that.datingGoals,_that.music,_that.photoVerification,_that.identityVerification,_that.premium,_that.instagramUrl,_that.spotifyUrl,_that.createdAt,_that.updatedAt,_that.promptIds,_that.activePollId,_that.mediaIds,_that.interestIds,_that.badgeIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int age,  String location,  String gender,  String? sexualOrientation,  String? bio,  String? datingGoals,  String? music,  bool photoVerification,  bool identityVerification,  String? premium,  String? instagramUrl,  String? spotifyUrl,  DateTime createdAt,  DateTime updatedAt,  List<String> promptIds,  String? activePollId,  List<String> mediaIds,  List<String> interestIds,  List<String> badgeIds)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.age,_that.location,_that.gender,_that.sexualOrientation,_that.bio,_that.datingGoals,_that.music,_that.photoVerification,_that.identityVerification,_that.premium,_that.instagramUrl,_that.spotifyUrl,_that.createdAt,_that.updatedAt,_that.promptIds,_that.activePollId,_that.mediaIds,_that.interestIds,_that.badgeIds);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileEntity extends ProfileEntity {
  const _ProfileEntity({required this.id, required this.name, required this.age, required this.location, required this.gender, this.sexualOrientation, this.bio, this.datingGoals, this.music, this.photoVerification = false, this.identityVerification = false, this.premium, this.instagramUrl, this.spotifyUrl, required this.createdAt, required this.updatedAt, final  List<String> promptIds = const [], this.activePollId, final  List<String> mediaIds = const [], final  List<String> interestIds = const [], final  List<String> badgeIds = const []}): _promptIds = promptIds,_mediaIds = mediaIds,_interestIds = interestIds,_badgeIds = badgeIds,super._();
  

@override final  String id;
@override final  String name;
@override final  int age;
@override final  String location;
@override final  String gender;
@override final  String? sexualOrientation;
@override final  String? bio;
@override final  String? datingGoals;
@override final  String? music;
@override@JsonKey() final  bool photoVerification;
@override@JsonKey() final  bool identityVerification;
@override final  String? premium;
@override final  String? instagramUrl;
@override final  String? spotifyUrl;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<String> _promptIds;
@override@JsonKey() List<String> get promptIds {
  if (_promptIds is EqualUnmodifiableListView) return _promptIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_promptIds);
}

@override final  String? activePollId;
 final  List<String> _mediaIds;
@override@JsonKey() List<String> get mediaIds {
  if (_mediaIds is EqualUnmodifiableListView) return _mediaIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaIds);
}

 final  List<String> _interestIds;
@override@JsonKey() List<String> get interestIds {
  if (_interestIds is EqualUnmodifiableListView) return _interestIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interestIds);
}

 final  List<String> _badgeIds;
@override@JsonKey() List<String> get badgeIds {
  if (_badgeIds is EqualUnmodifiableListView) return _badgeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badgeIds);
}


/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEntityCopyWith<_ProfileEntity> get copyWith => __$ProfileEntityCopyWithImpl<_ProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.sexualOrientation, sexualOrientation) || other.sexualOrientation == sexualOrientation)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.datingGoals, datingGoals) || other.datingGoals == datingGoals)&&(identical(other.music, music) || other.music == music)&&(identical(other.photoVerification, photoVerification) || other.photoVerification == photoVerification)&&(identical(other.identityVerification, identityVerification) || other.identityVerification == identityVerification)&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.spotifyUrl, spotifyUrl) || other.spotifyUrl == spotifyUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._promptIds, _promptIds)&&(identical(other.activePollId, activePollId) || other.activePollId == activePollId)&&const DeepCollectionEquality().equals(other._mediaIds, _mediaIds)&&const DeepCollectionEquality().equals(other._interestIds, _interestIds)&&const DeepCollectionEquality().equals(other._badgeIds, _badgeIds));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,age,location,gender,sexualOrientation,bio,datingGoals,music,photoVerification,identityVerification,premium,instagramUrl,spotifyUrl,createdAt,updatedAt,const DeepCollectionEquality().hash(_promptIds),activePollId,const DeepCollectionEquality().hash(_mediaIds),const DeepCollectionEquality().hash(_interestIds),const DeepCollectionEquality().hash(_badgeIds)]);



}

/// @nodoc
abstract mixin class _$ProfileEntityCopyWith<$Res> implements $ProfileEntityCopyWith<$Res> {
  factory _$ProfileEntityCopyWith(_ProfileEntity value, $Res Function(_ProfileEntity) _then) = __$ProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int age, String location, String gender, String? sexualOrientation, String? bio, String? datingGoals, String? music, bool photoVerification, bool identityVerification, String? premium, String? instagramUrl, String? spotifyUrl, DateTime createdAt, DateTime updatedAt, List<String> promptIds, String? activePollId, List<String> mediaIds, List<String> interestIds, List<String> badgeIds
});




}
/// @nodoc
class __$ProfileEntityCopyWithImpl<$Res>
    implements _$ProfileEntityCopyWith<$Res> {
  __$ProfileEntityCopyWithImpl(this._self, this._then);

  final _ProfileEntity _self;
  final $Res Function(_ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? age = null,Object? location = null,Object? gender = null,Object? sexualOrientation = freezed,Object? bio = freezed,Object? datingGoals = freezed,Object? music = freezed,Object? photoVerification = null,Object? identityVerification = null,Object? premium = freezed,Object? instagramUrl = freezed,Object? spotifyUrl = freezed,Object? createdAt = null,Object? updatedAt = null,Object? promptIds = null,Object? activePollId = freezed,Object? mediaIds = null,Object? interestIds = null,Object? badgeIds = null,}) {
  return _then(_ProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,sexualOrientation: freezed == sexualOrientation ? _self.sexualOrientation : sexualOrientation // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,datingGoals: freezed == datingGoals ? _self.datingGoals : datingGoals // ignore: cast_nullable_to_non_nullable
as String?,music: freezed == music ? _self.music : music // ignore: cast_nullable_to_non_nullable
as String?,photoVerification: null == photoVerification ? _self.photoVerification : photoVerification // ignore: cast_nullable_to_non_nullable
as bool,identityVerification: null == identityVerification ? _self.identityVerification : identityVerification // ignore: cast_nullable_to_non_nullable
as bool,premium: freezed == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,spotifyUrl: freezed == spotifyUrl ? _self.spotifyUrl : spotifyUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,promptIds: null == promptIds ? _self._promptIds : promptIds // ignore: cast_nullable_to_non_nullable
as List<String>,activePollId: freezed == activePollId ? _self.activePollId : activePollId // ignore: cast_nullable_to_non_nullable
as String?,mediaIds: null == mediaIds ? _self._mediaIds : mediaIds // ignore: cast_nullable_to_non_nullable
as List<String>,interestIds: null == interestIds ? _self._interestIds : interestIds // ignore: cast_nullable_to_non_nullable
as List<String>,badgeIds: null == badgeIds ? _self._badgeIds : badgeIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
