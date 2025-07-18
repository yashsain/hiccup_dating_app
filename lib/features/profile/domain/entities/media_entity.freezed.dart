// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaEntity {

 String get id; String get profileId; String get filePath; MediaType get type; int get displayOrder; String? get caption; int get fileSizeBytes; int? get durationSeconds;// For videos and voice notes
 int? get width;// For photos and videos
 int? get height;// For photos and videos
 String? get thumbnailPath;// For videos
 bool get isProcessing;// Upload/processing status
 bool get isVisible; DateTime get createdAt;
/// Create a copy of MediaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaEntityCopyWith<MediaEntity> get copyWith => _$MediaEntityCopyWithImpl<MediaEntity>(this as MediaEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.type, type) || other.type == type)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,filePath,type,displayOrder,caption,fileSizeBytes,durationSeconds,width,height,thumbnailPath,isProcessing,isVisible,createdAt);

@override
String toString() {
  return 'MediaEntity(id: $id, profileId: $profileId, filePath: $filePath, type: $type, displayOrder: $displayOrder, caption: $caption, fileSizeBytes: $fileSizeBytes, durationSeconds: $durationSeconds, width: $width, height: $height, thumbnailPath: $thumbnailPath, isProcessing: $isProcessing, isVisible: $isVisible, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MediaEntityCopyWith<$Res>  {
  factory $MediaEntityCopyWith(MediaEntity value, $Res Function(MediaEntity) _then) = _$MediaEntityCopyWithImpl;
@useResult
$Res call({
 String id, String profileId, String filePath, MediaType type, int displayOrder, String? caption, int fileSizeBytes, int? durationSeconds, int? width, int? height, String? thumbnailPath, bool isProcessing, bool isVisible, DateTime createdAt
});




}
/// @nodoc
class _$MediaEntityCopyWithImpl<$Res>
    implements $MediaEntityCopyWith<$Res> {
  _$MediaEntityCopyWithImpl(this._self, this._then);

  final MediaEntity _self;
  final $Res Function(MediaEntity) _then;

/// Create a copy of MediaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profileId = null,Object? filePath = null,Object? type = null,Object? displayOrder = null,Object? caption = freezed,Object? fileSizeBytes = null,Object? durationSeconds = freezed,Object? width = freezed,Object? height = freezed,Object? thumbnailPath = freezed,Object? isProcessing = null,Object? isVisible = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,fileSizeBytes: null == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaEntity].
extension MediaEntityPatterns on MediaEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaEntity value)  $default,){
final _that = this;
switch (_that) {
case _MediaEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MediaEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String profileId,  String filePath,  MediaType type,  int displayOrder,  String? caption,  int fileSizeBytes,  int? durationSeconds,  int? width,  int? height,  String? thumbnailPath,  bool isProcessing,  bool isVisible,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.filePath,_that.type,_that.displayOrder,_that.caption,_that.fileSizeBytes,_that.durationSeconds,_that.width,_that.height,_that.thumbnailPath,_that.isProcessing,_that.isVisible,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String profileId,  String filePath,  MediaType type,  int displayOrder,  String? caption,  int fileSizeBytes,  int? durationSeconds,  int? width,  int? height,  String? thumbnailPath,  bool isProcessing,  bool isVisible,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MediaEntity():
return $default(_that.id,_that.profileId,_that.filePath,_that.type,_that.displayOrder,_that.caption,_that.fileSizeBytes,_that.durationSeconds,_that.width,_that.height,_that.thumbnailPath,_that.isProcessing,_that.isVisible,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String profileId,  String filePath,  MediaType type,  int displayOrder,  String? caption,  int fileSizeBytes,  int? durationSeconds,  int? width,  int? height,  String? thumbnailPath,  bool isProcessing,  bool isVisible,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MediaEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.filePath,_that.type,_that.displayOrder,_that.caption,_that.fileSizeBytes,_that.durationSeconds,_that.width,_that.height,_that.thumbnailPath,_that.isProcessing,_that.isVisible,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _MediaEntity extends MediaEntity {
  const _MediaEntity({required this.id, required this.profileId, required this.filePath, required this.type, required this.displayOrder, this.caption, this.fileSizeBytes = 0, this.durationSeconds, this.width, this.height, this.thumbnailPath, this.isProcessing = false, this.isVisible = true, required this.createdAt}): super._();
  

@override final  String id;
@override final  String profileId;
@override final  String filePath;
@override final  MediaType type;
@override final  int displayOrder;
@override final  String? caption;
@override@JsonKey() final  int fileSizeBytes;
@override final  int? durationSeconds;
// For videos and voice notes
@override final  int? width;
// For photos and videos
@override final  int? height;
// For photos and videos
@override final  String? thumbnailPath;
// For videos
@override@JsonKey() final  bool isProcessing;
// Upload/processing status
@override@JsonKey() final  bool isVisible;
@override final  DateTime createdAt;

/// Create a copy of MediaEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaEntityCopyWith<_MediaEntity> get copyWith => __$MediaEntityCopyWithImpl<_MediaEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.type, type) || other.type == type)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,filePath,type,displayOrder,caption,fileSizeBytes,durationSeconds,width,height,thumbnailPath,isProcessing,isVisible,createdAt);

@override
String toString() {
  return 'MediaEntity(id: $id, profileId: $profileId, filePath: $filePath, type: $type, displayOrder: $displayOrder, caption: $caption, fileSizeBytes: $fileSizeBytes, durationSeconds: $durationSeconds, width: $width, height: $height, thumbnailPath: $thumbnailPath, isProcessing: $isProcessing, isVisible: $isVisible, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MediaEntityCopyWith<$Res> implements $MediaEntityCopyWith<$Res> {
  factory _$MediaEntityCopyWith(_MediaEntity value, $Res Function(_MediaEntity) _then) = __$MediaEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String profileId, String filePath, MediaType type, int displayOrder, String? caption, int fileSizeBytes, int? durationSeconds, int? width, int? height, String? thumbnailPath, bool isProcessing, bool isVisible, DateTime createdAt
});




}
/// @nodoc
class __$MediaEntityCopyWithImpl<$Res>
    implements _$MediaEntityCopyWith<$Res> {
  __$MediaEntityCopyWithImpl(this._self, this._then);

  final _MediaEntity _self;
  final $Res Function(_MediaEntity) _then;

/// Create a copy of MediaEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? profileId = null,Object? filePath = null,Object? type = null,Object? displayOrder = null,Object? caption = freezed,Object? fileSizeBytes = null,Object? durationSeconds = freezed,Object? width = freezed,Object? height = freezed,Object? thumbnailPath = freezed,Object? isProcessing = null,Object? isVisible = null,Object? createdAt = null,}) {
  return _then(_MediaEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,fileSizeBytes: null == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
