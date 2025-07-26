// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostEntity {

 String get id; String get profileId; String get caption; List<PostMediaItem> get mediaItems; PostType get type; bool get isVisible; int get displayOrder; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostEntityCopyWith<PostEntity> get copyWith => _$PostEntityCopyWithImpl<PostEntity>(this as PostEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other.mediaItems, mediaItems)&&(identical(other.type, type) || other.type == type)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,caption,const DeepCollectionEquality().hash(mediaItems),type,isVisible,displayOrder,createdAt,updatedAt);

@override
String toString() {
  return 'PostEntity(id: $id, profileId: $profileId, caption: $caption, mediaItems: $mediaItems, type: $type, isVisible: $isVisible, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PostEntityCopyWith<$Res>  {
  factory $PostEntityCopyWith(PostEntity value, $Res Function(PostEntity) _then) = _$PostEntityCopyWithImpl;
@useResult
$Res call({
 String id, String profileId, String caption, List<PostMediaItem> mediaItems, PostType type, bool isVisible, int displayOrder, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$PostEntityCopyWithImpl<$Res>
    implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._self, this._then);

  final PostEntity _self;
  final $Res Function(PostEntity) _then;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profileId = null,Object? caption = null,Object? mediaItems = null,Object? type = null,Object? isVisible = null,Object? displayOrder = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,mediaItems: null == mediaItems ? _self.mediaItems : mediaItems // ignore: cast_nullable_to_non_nullable
as List<PostMediaItem>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PostType,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostEntity].
extension PostEntityPatterns on PostEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostEntity value)  $default,){
final _that = this;
switch (_that) {
case _PostEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String profileId,  String caption,  List<PostMediaItem> mediaItems,  PostType type,  bool isVisible,  int displayOrder,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.caption,_that.mediaItems,_that.type,_that.isVisible,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String profileId,  String caption,  List<PostMediaItem> mediaItems,  PostType type,  bool isVisible,  int displayOrder,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PostEntity():
return $default(_that.id,_that.profileId,_that.caption,_that.mediaItems,_that.type,_that.isVisible,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String profileId,  String caption,  List<PostMediaItem> mediaItems,  PostType type,  bool isVisible,  int displayOrder,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
return $default(_that.id,_that.profileId,_that.caption,_that.mediaItems,_that.type,_that.isVisible,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _PostEntity extends PostEntity {
  const _PostEntity({required this.id, required this.profileId, required this.caption, required final  List<PostMediaItem> mediaItems, required this.type, this.isVisible = true, this.displayOrder = 0, required this.createdAt, this.updatedAt}): _mediaItems = mediaItems,super._();
  

@override final  String id;
@override final  String profileId;
@override final  String caption;
 final  List<PostMediaItem> _mediaItems;
@override List<PostMediaItem> get mediaItems {
  if (_mediaItems is EqualUnmodifiableListView) return _mediaItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaItems);
}

@override final  PostType type;
@override@JsonKey() final  bool isVisible;
@override@JsonKey() final  int displayOrder;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostEntityCopyWith<_PostEntity> get copyWith => __$PostEntityCopyWithImpl<_PostEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other._mediaItems, _mediaItems)&&(identical(other.type, type) || other.type == type)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileId,caption,const DeepCollectionEquality().hash(_mediaItems),type,isVisible,displayOrder,createdAt,updatedAt);

@override
String toString() {
  return 'PostEntity(id: $id, profileId: $profileId, caption: $caption, mediaItems: $mediaItems, type: $type, isVisible: $isVisible, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PostEntityCopyWith<$Res> implements $PostEntityCopyWith<$Res> {
  factory _$PostEntityCopyWith(_PostEntity value, $Res Function(_PostEntity) _then) = __$PostEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String profileId, String caption, List<PostMediaItem> mediaItems, PostType type, bool isVisible, int displayOrder, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$PostEntityCopyWithImpl<$Res>
    implements _$PostEntityCopyWith<$Res> {
  __$PostEntityCopyWithImpl(this._self, this._then);

  final _PostEntity _self;
  final $Res Function(_PostEntity) _then;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? profileId = null,Object? caption = null,Object? mediaItems = null,Object? type = null,Object? isVisible = null,Object? displayOrder = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_PostEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,mediaItems: null == mediaItems ? _self._mediaItems : mediaItems // ignore: cast_nullable_to_non_nullable
as List<PostMediaItem>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PostType,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$PostMediaItem {

 String get id; String get filePath; MediaType get type; int get orderInPost;// 0-5 for ordering within the post
 int get fileSizeBytes; int? get durationSeconds;// For videos and voice notes
 int? get width;// For photos and videos
 int? get height;// For photos and videos
 String? get thumbnailPath;// For videos
 bool get isProcessing;// Upload/processing status
 String? get mimeType;// File MIME type
 DateTime? get capturedAt;
/// Create a copy of PostMediaItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostMediaItemCopyWith<PostMediaItem> get copyWith => _$PostMediaItemCopyWithImpl<PostMediaItem>(this as PostMediaItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostMediaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.type, type) || other.type == type)&&(identical(other.orderInPost, orderInPost) || other.orderInPost == orderInPost)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,filePath,type,orderInPost,fileSizeBytes,durationSeconds,width,height,thumbnailPath,isProcessing,mimeType,capturedAt);

@override
String toString() {
  return 'PostMediaItem(id: $id, filePath: $filePath, type: $type, orderInPost: $orderInPost, fileSizeBytes: $fileSizeBytes, durationSeconds: $durationSeconds, width: $width, height: $height, thumbnailPath: $thumbnailPath, isProcessing: $isProcessing, mimeType: $mimeType, capturedAt: $capturedAt)';
}


}

/// @nodoc
abstract mixin class $PostMediaItemCopyWith<$Res>  {
  factory $PostMediaItemCopyWith(PostMediaItem value, $Res Function(PostMediaItem) _then) = _$PostMediaItemCopyWithImpl;
@useResult
$Res call({
 String id, String filePath, MediaType type, int orderInPost, int fileSizeBytes, int? durationSeconds, int? width, int? height, String? thumbnailPath, bool isProcessing, String? mimeType, DateTime? capturedAt
});




}
/// @nodoc
class _$PostMediaItemCopyWithImpl<$Res>
    implements $PostMediaItemCopyWith<$Res> {
  _$PostMediaItemCopyWithImpl(this._self, this._then);

  final PostMediaItem _self;
  final $Res Function(PostMediaItem) _then;

/// Create a copy of PostMediaItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? filePath = null,Object? type = null,Object? orderInPost = null,Object? fileSizeBytes = null,Object? durationSeconds = freezed,Object? width = freezed,Object? height = freezed,Object? thumbnailPath = freezed,Object? isProcessing = null,Object? mimeType = freezed,Object? capturedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,orderInPost: null == orderInPost ? _self.orderInPost : orderInPost // ignore: cast_nullable_to_non_nullable
as int,fileSizeBytes: null == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,capturedAt: freezed == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostMediaItem].
extension PostMediaItemPatterns on PostMediaItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostMediaItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostMediaItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostMediaItem value)  $default,){
final _that = this;
switch (_that) {
case _PostMediaItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostMediaItem value)?  $default,){
final _that = this;
switch (_that) {
case _PostMediaItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String filePath,  MediaType type,  int orderInPost,  int fileSizeBytes,  int? durationSeconds,  int? width,  int? height,  String? thumbnailPath,  bool isProcessing,  String? mimeType,  DateTime? capturedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostMediaItem() when $default != null:
return $default(_that.id,_that.filePath,_that.type,_that.orderInPost,_that.fileSizeBytes,_that.durationSeconds,_that.width,_that.height,_that.thumbnailPath,_that.isProcessing,_that.mimeType,_that.capturedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String filePath,  MediaType type,  int orderInPost,  int fileSizeBytes,  int? durationSeconds,  int? width,  int? height,  String? thumbnailPath,  bool isProcessing,  String? mimeType,  DateTime? capturedAt)  $default,) {final _that = this;
switch (_that) {
case _PostMediaItem():
return $default(_that.id,_that.filePath,_that.type,_that.orderInPost,_that.fileSizeBytes,_that.durationSeconds,_that.width,_that.height,_that.thumbnailPath,_that.isProcessing,_that.mimeType,_that.capturedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String filePath,  MediaType type,  int orderInPost,  int fileSizeBytes,  int? durationSeconds,  int? width,  int? height,  String? thumbnailPath,  bool isProcessing,  String? mimeType,  DateTime? capturedAt)?  $default,) {final _that = this;
switch (_that) {
case _PostMediaItem() when $default != null:
return $default(_that.id,_that.filePath,_that.type,_that.orderInPost,_that.fileSizeBytes,_that.durationSeconds,_that.width,_that.height,_that.thumbnailPath,_that.isProcessing,_that.mimeType,_that.capturedAt);case _:
  return null;

}
}

}

/// @nodoc


class _PostMediaItem extends PostMediaItem {
  const _PostMediaItem({required this.id, required this.filePath, required this.type, required this.orderInPost, this.fileSizeBytes = 0, this.durationSeconds, this.width, this.height, this.thumbnailPath, this.isProcessing = false, this.mimeType, this.capturedAt}): super._();
  

@override final  String id;
@override final  String filePath;
@override final  MediaType type;
@override final  int orderInPost;
// 0-5 for ordering within the post
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
@override final  String? mimeType;
// File MIME type
@override final  DateTime? capturedAt;

/// Create a copy of PostMediaItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostMediaItemCopyWith<_PostMediaItem> get copyWith => __$PostMediaItemCopyWithImpl<_PostMediaItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostMediaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.type, type) || other.type == type)&&(identical(other.orderInPost, orderInPost) || other.orderInPost == orderInPost)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,filePath,type,orderInPost,fileSizeBytes,durationSeconds,width,height,thumbnailPath,isProcessing,mimeType,capturedAt);

@override
String toString() {
  return 'PostMediaItem(id: $id, filePath: $filePath, type: $type, orderInPost: $orderInPost, fileSizeBytes: $fileSizeBytes, durationSeconds: $durationSeconds, width: $width, height: $height, thumbnailPath: $thumbnailPath, isProcessing: $isProcessing, mimeType: $mimeType, capturedAt: $capturedAt)';
}


}

/// @nodoc
abstract mixin class _$PostMediaItemCopyWith<$Res> implements $PostMediaItemCopyWith<$Res> {
  factory _$PostMediaItemCopyWith(_PostMediaItem value, $Res Function(_PostMediaItem) _then) = __$PostMediaItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String filePath, MediaType type, int orderInPost, int fileSizeBytes, int? durationSeconds, int? width, int? height, String? thumbnailPath, bool isProcessing, String? mimeType, DateTime? capturedAt
});




}
/// @nodoc
class __$PostMediaItemCopyWithImpl<$Res>
    implements _$PostMediaItemCopyWith<$Res> {
  __$PostMediaItemCopyWithImpl(this._self, this._then);

  final _PostMediaItem _self;
  final $Res Function(_PostMediaItem) _then;

/// Create a copy of PostMediaItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filePath = null,Object? type = null,Object? orderInPost = null,Object? fileSizeBytes = null,Object? durationSeconds = freezed,Object? width = freezed,Object? height = freezed,Object? thumbnailPath = freezed,Object? isProcessing = null,Object? mimeType = freezed,Object? capturedAt = freezed,}) {
  return _then(_PostMediaItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,orderInPost: null == orderInPost ? _self.orderInPost : orderInPost // ignore: cast_nullable_to_non_nullable
as int,fileSizeBytes: null == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,capturedAt: freezed == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
