// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_ui_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileUIStateModel {

/// Whether the profile is in edit mode
 bool get isEditMode;/// Currently selected photo index in gallery
 int get selectedPhotoIndex;/// Whether the photo gallery is expanded
 bool get isPhotoGalleryExpanded;/// Currently active prompt for editing
 String? get activePromptId;/// Whether interests are being edited
 bool get isEditingInterests;/// Whether bio section is expanded
 bool get isBioExpanded;/// Form validation errors
 Map<String, String> get validationErrors;/// Loading states for different UI actions
 Map<String, bool> get loadingStates;/// Whether to show verification prompt
 bool get showVerificationPrompt;/// Selected interests during editing
 List<String> get selectedInterests;/// Photo upload progress (0.0 to 1.0)
 double get photoUploadProgress;/// Whether the profile action sheet is visible
 bool get showActionSheet;
/// Create a copy of ProfileUIStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUIStateModelCopyWith<ProfileUIStateModel> get copyWith => _$ProfileUIStateModelCopyWithImpl<ProfileUIStateModel>(this as ProfileUIStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUIStateModel&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&(identical(other.selectedPhotoIndex, selectedPhotoIndex) || other.selectedPhotoIndex == selectedPhotoIndex)&&(identical(other.isPhotoGalleryExpanded, isPhotoGalleryExpanded) || other.isPhotoGalleryExpanded == isPhotoGalleryExpanded)&&(identical(other.activePromptId, activePromptId) || other.activePromptId == activePromptId)&&(identical(other.isEditingInterests, isEditingInterests) || other.isEditingInterests == isEditingInterests)&&(identical(other.isBioExpanded, isBioExpanded) || other.isBioExpanded == isBioExpanded)&&const DeepCollectionEquality().equals(other.validationErrors, validationErrors)&&const DeepCollectionEquality().equals(other.loadingStates, loadingStates)&&(identical(other.showVerificationPrompt, showVerificationPrompt) || other.showVerificationPrompt == showVerificationPrompt)&&const DeepCollectionEquality().equals(other.selectedInterests, selectedInterests)&&(identical(other.photoUploadProgress, photoUploadProgress) || other.photoUploadProgress == photoUploadProgress)&&(identical(other.showActionSheet, showActionSheet) || other.showActionSheet == showActionSheet));
}


@override
int get hashCode => Object.hash(runtimeType,isEditMode,selectedPhotoIndex,isPhotoGalleryExpanded,activePromptId,isEditingInterests,isBioExpanded,const DeepCollectionEquality().hash(validationErrors),const DeepCollectionEquality().hash(loadingStates),showVerificationPrompt,const DeepCollectionEquality().hash(selectedInterests),photoUploadProgress,showActionSheet);

@override
String toString() {
  return 'ProfileUIStateModel(isEditMode: $isEditMode, selectedPhotoIndex: $selectedPhotoIndex, isPhotoGalleryExpanded: $isPhotoGalleryExpanded, activePromptId: $activePromptId, isEditingInterests: $isEditingInterests, isBioExpanded: $isBioExpanded, validationErrors: $validationErrors, loadingStates: $loadingStates, showVerificationPrompt: $showVerificationPrompt, selectedInterests: $selectedInterests, photoUploadProgress: $photoUploadProgress, showActionSheet: $showActionSheet)';
}


}

/// @nodoc
abstract mixin class $ProfileUIStateModelCopyWith<$Res>  {
  factory $ProfileUIStateModelCopyWith(ProfileUIStateModel value, $Res Function(ProfileUIStateModel) _then) = _$ProfileUIStateModelCopyWithImpl;
@useResult
$Res call({
 bool isEditMode, int selectedPhotoIndex, bool isPhotoGalleryExpanded, String? activePromptId, bool isEditingInterests, bool isBioExpanded, Map<String, String> validationErrors, Map<String, bool> loadingStates, bool showVerificationPrompt, List<String> selectedInterests, double photoUploadProgress, bool showActionSheet
});




}
/// @nodoc
class _$ProfileUIStateModelCopyWithImpl<$Res>
    implements $ProfileUIStateModelCopyWith<$Res> {
  _$ProfileUIStateModelCopyWithImpl(this._self, this._then);

  final ProfileUIStateModel _self;
  final $Res Function(ProfileUIStateModel) _then;

/// Create a copy of ProfileUIStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isEditMode = null,Object? selectedPhotoIndex = null,Object? isPhotoGalleryExpanded = null,Object? activePromptId = freezed,Object? isEditingInterests = null,Object? isBioExpanded = null,Object? validationErrors = null,Object? loadingStates = null,Object? showVerificationPrompt = null,Object? selectedInterests = null,Object? photoUploadProgress = null,Object? showActionSheet = null,}) {
  return _then(_self.copyWith(
isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,selectedPhotoIndex: null == selectedPhotoIndex ? _self.selectedPhotoIndex : selectedPhotoIndex // ignore: cast_nullable_to_non_nullable
as int,isPhotoGalleryExpanded: null == isPhotoGalleryExpanded ? _self.isPhotoGalleryExpanded : isPhotoGalleryExpanded // ignore: cast_nullable_to_non_nullable
as bool,activePromptId: freezed == activePromptId ? _self.activePromptId : activePromptId // ignore: cast_nullable_to_non_nullable
as String?,isEditingInterests: null == isEditingInterests ? _self.isEditingInterests : isEditingInterests // ignore: cast_nullable_to_non_nullable
as bool,isBioExpanded: null == isBioExpanded ? _self.isBioExpanded : isBioExpanded // ignore: cast_nullable_to_non_nullable
as bool,validationErrors: null == validationErrors ? _self.validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,loadingStates: null == loadingStates ? _self.loadingStates : loadingStates // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,showVerificationPrompt: null == showVerificationPrompt ? _self.showVerificationPrompt : showVerificationPrompt // ignore: cast_nullable_to_non_nullable
as bool,selectedInterests: null == selectedInterests ? _self.selectedInterests : selectedInterests // ignore: cast_nullable_to_non_nullable
as List<String>,photoUploadProgress: null == photoUploadProgress ? _self.photoUploadProgress : photoUploadProgress // ignore: cast_nullable_to_non_nullable
as double,showActionSheet: null == showActionSheet ? _self.showActionSheet : showActionSheet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileUIStateModel].
extension ProfileUIStateModelPatterns on ProfileUIStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileUIStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileUIStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileUIStateModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileUIStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileUIStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileUIStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isEditMode,  int selectedPhotoIndex,  bool isPhotoGalleryExpanded,  String? activePromptId,  bool isEditingInterests,  bool isBioExpanded,  Map<String, String> validationErrors,  Map<String, bool> loadingStates,  bool showVerificationPrompt,  List<String> selectedInterests,  double photoUploadProgress,  bool showActionSheet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileUIStateModel() when $default != null:
return $default(_that.isEditMode,_that.selectedPhotoIndex,_that.isPhotoGalleryExpanded,_that.activePromptId,_that.isEditingInterests,_that.isBioExpanded,_that.validationErrors,_that.loadingStates,_that.showVerificationPrompt,_that.selectedInterests,_that.photoUploadProgress,_that.showActionSheet);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isEditMode,  int selectedPhotoIndex,  bool isPhotoGalleryExpanded,  String? activePromptId,  bool isEditingInterests,  bool isBioExpanded,  Map<String, String> validationErrors,  Map<String, bool> loadingStates,  bool showVerificationPrompt,  List<String> selectedInterests,  double photoUploadProgress,  bool showActionSheet)  $default,) {final _that = this;
switch (_that) {
case _ProfileUIStateModel():
return $default(_that.isEditMode,_that.selectedPhotoIndex,_that.isPhotoGalleryExpanded,_that.activePromptId,_that.isEditingInterests,_that.isBioExpanded,_that.validationErrors,_that.loadingStates,_that.showVerificationPrompt,_that.selectedInterests,_that.photoUploadProgress,_that.showActionSheet);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isEditMode,  int selectedPhotoIndex,  bool isPhotoGalleryExpanded,  String? activePromptId,  bool isEditingInterests,  bool isBioExpanded,  Map<String, String> validationErrors,  Map<String, bool> loadingStates,  bool showVerificationPrompt,  List<String> selectedInterests,  double photoUploadProgress,  bool showActionSheet)?  $default,) {final _that = this;
switch (_that) {
case _ProfileUIStateModel() when $default != null:
return $default(_that.isEditMode,_that.selectedPhotoIndex,_that.isPhotoGalleryExpanded,_that.activePromptId,_that.isEditingInterests,_that.isBioExpanded,_that.validationErrors,_that.loadingStates,_that.showVerificationPrompt,_that.selectedInterests,_that.photoUploadProgress,_that.showActionSheet);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileUIStateModel implements ProfileUIStateModel {
  const _ProfileUIStateModel({this.isEditMode = false, this.selectedPhotoIndex = 0, this.isPhotoGalleryExpanded = false, this.activePromptId, this.isEditingInterests = false, this.isBioExpanded = false, final  Map<String, String> validationErrors = const {}, final  Map<String, bool> loadingStates = const {}, this.showVerificationPrompt = false, final  List<String> selectedInterests = const [], this.photoUploadProgress = 0.0, this.showActionSheet = false}): _validationErrors = validationErrors,_loadingStates = loadingStates,_selectedInterests = selectedInterests;
  

/// Whether the profile is in edit mode
@override@JsonKey() final  bool isEditMode;
/// Currently selected photo index in gallery
@override@JsonKey() final  int selectedPhotoIndex;
/// Whether the photo gallery is expanded
@override@JsonKey() final  bool isPhotoGalleryExpanded;
/// Currently active prompt for editing
@override final  String? activePromptId;
/// Whether interests are being edited
@override@JsonKey() final  bool isEditingInterests;
/// Whether bio section is expanded
@override@JsonKey() final  bool isBioExpanded;
/// Form validation errors
 final  Map<String, String> _validationErrors;
/// Form validation errors
@override@JsonKey() Map<String, String> get validationErrors {
  if (_validationErrors is EqualUnmodifiableMapView) return _validationErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_validationErrors);
}

/// Loading states for different UI actions
 final  Map<String, bool> _loadingStates;
/// Loading states for different UI actions
@override@JsonKey() Map<String, bool> get loadingStates {
  if (_loadingStates is EqualUnmodifiableMapView) return _loadingStates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_loadingStates);
}

/// Whether to show verification prompt
@override@JsonKey() final  bool showVerificationPrompt;
/// Selected interests during editing
 final  List<String> _selectedInterests;
/// Selected interests during editing
@override@JsonKey() List<String> get selectedInterests {
  if (_selectedInterests is EqualUnmodifiableListView) return _selectedInterests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedInterests);
}

/// Photo upload progress (0.0 to 1.0)
@override@JsonKey() final  double photoUploadProgress;
/// Whether the profile action sheet is visible
@override@JsonKey() final  bool showActionSheet;

/// Create a copy of ProfileUIStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileUIStateModelCopyWith<_ProfileUIStateModel> get copyWith => __$ProfileUIStateModelCopyWithImpl<_ProfileUIStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUIStateModel&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&(identical(other.selectedPhotoIndex, selectedPhotoIndex) || other.selectedPhotoIndex == selectedPhotoIndex)&&(identical(other.isPhotoGalleryExpanded, isPhotoGalleryExpanded) || other.isPhotoGalleryExpanded == isPhotoGalleryExpanded)&&(identical(other.activePromptId, activePromptId) || other.activePromptId == activePromptId)&&(identical(other.isEditingInterests, isEditingInterests) || other.isEditingInterests == isEditingInterests)&&(identical(other.isBioExpanded, isBioExpanded) || other.isBioExpanded == isBioExpanded)&&const DeepCollectionEquality().equals(other._validationErrors, _validationErrors)&&const DeepCollectionEquality().equals(other._loadingStates, _loadingStates)&&(identical(other.showVerificationPrompt, showVerificationPrompt) || other.showVerificationPrompt == showVerificationPrompt)&&const DeepCollectionEquality().equals(other._selectedInterests, _selectedInterests)&&(identical(other.photoUploadProgress, photoUploadProgress) || other.photoUploadProgress == photoUploadProgress)&&(identical(other.showActionSheet, showActionSheet) || other.showActionSheet == showActionSheet));
}


@override
int get hashCode => Object.hash(runtimeType,isEditMode,selectedPhotoIndex,isPhotoGalleryExpanded,activePromptId,isEditingInterests,isBioExpanded,const DeepCollectionEquality().hash(_validationErrors),const DeepCollectionEquality().hash(_loadingStates),showVerificationPrompt,const DeepCollectionEquality().hash(_selectedInterests),photoUploadProgress,showActionSheet);

@override
String toString() {
  return 'ProfileUIStateModel(isEditMode: $isEditMode, selectedPhotoIndex: $selectedPhotoIndex, isPhotoGalleryExpanded: $isPhotoGalleryExpanded, activePromptId: $activePromptId, isEditingInterests: $isEditingInterests, isBioExpanded: $isBioExpanded, validationErrors: $validationErrors, loadingStates: $loadingStates, showVerificationPrompt: $showVerificationPrompt, selectedInterests: $selectedInterests, photoUploadProgress: $photoUploadProgress, showActionSheet: $showActionSheet)';
}


}

/// @nodoc
abstract mixin class _$ProfileUIStateModelCopyWith<$Res> implements $ProfileUIStateModelCopyWith<$Res> {
  factory _$ProfileUIStateModelCopyWith(_ProfileUIStateModel value, $Res Function(_ProfileUIStateModel) _then) = __$ProfileUIStateModelCopyWithImpl;
@override @useResult
$Res call({
 bool isEditMode, int selectedPhotoIndex, bool isPhotoGalleryExpanded, String? activePromptId, bool isEditingInterests, bool isBioExpanded, Map<String, String> validationErrors, Map<String, bool> loadingStates, bool showVerificationPrompt, List<String> selectedInterests, double photoUploadProgress, bool showActionSheet
});




}
/// @nodoc
class __$ProfileUIStateModelCopyWithImpl<$Res>
    implements _$ProfileUIStateModelCopyWith<$Res> {
  __$ProfileUIStateModelCopyWithImpl(this._self, this._then);

  final _ProfileUIStateModel _self;
  final $Res Function(_ProfileUIStateModel) _then;

/// Create a copy of ProfileUIStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isEditMode = null,Object? selectedPhotoIndex = null,Object? isPhotoGalleryExpanded = null,Object? activePromptId = freezed,Object? isEditingInterests = null,Object? isBioExpanded = null,Object? validationErrors = null,Object? loadingStates = null,Object? showVerificationPrompt = null,Object? selectedInterests = null,Object? photoUploadProgress = null,Object? showActionSheet = null,}) {
  return _then(_ProfileUIStateModel(
isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,selectedPhotoIndex: null == selectedPhotoIndex ? _self.selectedPhotoIndex : selectedPhotoIndex // ignore: cast_nullable_to_non_nullable
as int,isPhotoGalleryExpanded: null == isPhotoGalleryExpanded ? _self.isPhotoGalleryExpanded : isPhotoGalleryExpanded // ignore: cast_nullable_to_non_nullable
as bool,activePromptId: freezed == activePromptId ? _self.activePromptId : activePromptId // ignore: cast_nullable_to_non_nullable
as String?,isEditingInterests: null == isEditingInterests ? _self.isEditingInterests : isEditingInterests // ignore: cast_nullable_to_non_nullable
as bool,isBioExpanded: null == isBioExpanded ? _self.isBioExpanded : isBioExpanded // ignore: cast_nullable_to_non_nullable
as bool,validationErrors: null == validationErrors ? _self._validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,loadingStates: null == loadingStates ? _self._loadingStates : loadingStates // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,showVerificationPrompt: null == showVerificationPrompt ? _self.showVerificationPrompt : showVerificationPrompt // ignore: cast_nullable_to_non_nullable
as bool,selectedInterests: null == selectedInterests ? _self._selectedInterests : selectedInterests // ignore: cast_nullable_to_non_nullable
as List<String>,photoUploadProgress: null == photoUploadProgress ? _self.photoUploadProgress : photoUploadProgress // ignore: cast_nullable_to_non_nullable
as double,showActionSheet: null == showActionSheet ? _self.showActionSheet : showActionSheet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$PhotoGalleryStateModel {

/// Currently selected photo index
 int get currentIndex;/// Whether gallery is in fullscreen mode
 bool get isFullscreen;/// Whether photo info overlay is visible
 bool get showPhotoInfo;/// Photos being uploaded
 List<String> get uploading;/// Failed upload attempts
 List<String> get failedUploads;
/// Create a copy of PhotoGalleryStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoGalleryStateModelCopyWith<PhotoGalleryStateModel> get copyWith => _$PhotoGalleryStateModelCopyWithImpl<PhotoGalleryStateModel>(this as PhotoGalleryStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoGalleryStateModel&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.isFullscreen, isFullscreen) || other.isFullscreen == isFullscreen)&&(identical(other.showPhotoInfo, showPhotoInfo) || other.showPhotoInfo == showPhotoInfo)&&const DeepCollectionEquality().equals(other.uploading, uploading)&&const DeepCollectionEquality().equals(other.failedUploads, failedUploads));
}


@override
int get hashCode => Object.hash(runtimeType,currentIndex,isFullscreen,showPhotoInfo,const DeepCollectionEquality().hash(uploading),const DeepCollectionEquality().hash(failedUploads));

@override
String toString() {
  return 'PhotoGalleryStateModel(currentIndex: $currentIndex, isFullscreen: $isFullscreen, showPhotoInfo: $showPhotoInfo, uploading: $uploading, failedUploads: $failedUploads)';
}


}

/// @nodoc
abstract mixin class $PhotoGalleryStateModelCopyWith<$Res>  {
  factory $PhotoGalleryStateModelCopyWith(PhotoGalleryStateModel value, $Res Function(PhotoGalleryStateModel) _then) = _$PhotoGalleryStateModelCopyWithImpl;
@useResult
$Res call({
 int currentIndex, bool isFullscreen, bool showPhotoInfo, List<String> uploading, List<String> failedUploads
});




}
/// @nodoc
class _$PhotoGalleryStateModelCopyWithImpl<$Res>
    implements $PhotoGalleryStateModelCopyWith<$Res> {
  _$PhotoGalleryStateModelCopyWithImpl(this._self, this._then);

  final PhotoGalleryStateModel _self;
  final $Res Function(PhotoGalleryStateModel) _then;

/// Create a copy of PhotoGalleryStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentIndex = null,Object? isFullscreen = null,Object? showPhotoInfo = null,Object? uploading = null,Object? failedUploads = null,}) {
  return _then(_self.copyWith(
currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,isFullscreen: null == isFullscreen ? _self.isFullscreen : isFullscreen // ignore: cast_nullable_to_non_nullable
as bool,showPhotoInfo: null == showPhotoInfo ? _self.showPhotoInfo : showPhotoInfo // ignore: cast_nullable_to_non_nullable
as bool,uploading: null == uploading ? _self.uploading : uploading // ignore: cast_nullable_to_non_nullable
as List<String>,failedUploads: null == failedUploads ? _self.failedUploads : failedUploads // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoGalleryStateModel].
extension PhotoGalleryStateModelPatterns on PhotoGalleryStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoGalleryStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoGalleryStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoGalleryStateModel value)  $default,){
final _that = this;
switch (_that) {
case _PhotoGalleryStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoGalleryStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoGalleryStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentIndex,  bool isFullscreen,  bool showPhotoInfo,  List<String> uploading,  List<String> failedUploads)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoGalleryStateModel() when $default != null:
return $default(_that.currentIndex,_that.isFullscreen,_that.showPhotoInfo,_that.uploading,_that.failedUploads);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentIndex,  bool isFullscreen,  bool showPhotoInfo,  List<String> uploading,  List<String> failedUploads)  $default,) {final _that = this;
switch (_that) {
case _PhotoGalleryStateModel():
return $default(_that.currentIndex,_that.isFullscreen,_that.showPhotoInfo,_that.uploading,_that.failedUploads);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentIndex,  bool isFullscreen,  bool showPhotoInfo,  List<String> uploading,  List<String> failedUploads)?  $default,) {final _that = this;
switch (_that) {
case _PhotoGalleryStateModel() when $default != null:
return $default(_that.currentIndex,_that.isFullscreen,_that.showPhotoInfo,_that.uploading,_that.failedUploads);case _:
  return null;

}
}

}

/// @nodoc


class _PhotoGalleryStateModel implements PhotoGalleryStateModel {
  const _PhotoGalleryStateModel({this.currentIndex = 0, this.isFullscreen = false, this.showPhotoInfo = false, final  List<String> uploading = const [], final  List<String> failedUploads = const []}): _uploading = uploading,_failedUploads = failedUploads;
  

/// Currently selected photo index
@override@JsonKey() final  int currentIndex;
/// Whether gallery is in fullscreen mode
@override@JsonKey() final  bool isFullscreen;
/// Whether photo info overlay is visible
@override@JsonKey() final  bool showPhotoInfo;
/// Photos being uploaded
 final  List<String> _uploading;
/// Photos being uploaded
@override@JsonKey() List<String> get uploading {
  if (_uploading is EqualUnmodifiableListView) return _uploading;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uploading);
}

/// Failed upload attempts
 final  List<String> _failedUploads;
/// Failed upload attempts
@override@JsonKey() List<String> get failedUploads {
  if (_failedUploads is EqualUnmodifiableListView) return _failedUploads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_failedUploads);
}


/// Create a copy of PhotoGalleryStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoGalleryStateModelCopyWith<_PhotoGalleryStateModel> get copyWith => __$PhotoGalleryStateModelCopyWithImpl<_PhotoGalleryStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoGalleryStateModel&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.isFullscreen, isFullscreen) || other.isFullscreen == isFullscreen)&&(identical(other.showPhotoInfo, showPhotoInfo) || other.showPhotoInfo == showPhotoInfo)&&const DeepCollectionEquality().equals(other._uploading, _uploading)&&const DeepCollectionEquality().equals(other._failedUploads, _failedUploads));
}


@override
int get hashCode => Object.hash(runtimeType,currentIndex,isFullscreen,showPhotoInfo,const DeepCollectionEquality().hash(_uploading),const DeepCollectionEquality().hash(_failedUploads));

@override
String toString() {
  return 'PhotoGalleryStateModel(currentIndex: $currentIndex, isFullscreen: $isFullscreen, showPhotoInfo: $showPhotoInfo, uploading: $uploading, failedUploads: $failedUploads)';
}


}

/// @nodoc
abstract mixin class _$PhotoGalleryStateModelCopyWith<$Res> implements $PhotoGalleryStateModelCopyWith<$Res> {
  factory _$PhotoGalleryStateModelCopyWith(_PhotoGalleryStateModel value, $Res Function(_PhotoGalleryStateModel) _then) = __$PhotoGalleryStateModelCopyWithImpl;
@override @useResult
$Res call({
 int currentIndex, bool isFullscreen, bool showPhotoInfo, List<String> uploading, List<String> failedUploads
});




}
/// @nodoc
class __$PhotoGalleryStateModelCopyWithImpl<$Res>
    implements _$PhotoGalleryStateModelCopyWith<$Res> {
  __$PhotoGalleryStateModelCopyWithImpl(this._self, this._then);

  final _PhotoGalleryStateModel _self;
  final $Res Function(_PhotoGalleryStateModel) _then;

/// Create a copy of PhotoGalleryStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentIndex = null,Object? isFullscreen = null,Object? showPhotoInfo = null,Object? uploading = null,Object? failedUploads = null,}) {
  return _then(_PhotoGalleryStateModel(
currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,isFullscreen: null == isFullscreen ? _self.isFullscreen : isFullscreen // ignore: cast_nullable_to_non_nullable
as bool,showPhotoInfo: null == showPhotoInfo ? _self.showPhotoInfo : showPhotoInfo // ignore: cast_nullable_to_non_nullable
as bool,uploading: null == uploading ? _self._uploading : uploading // ignore: cast_nullable_to_non_nullable
as List<String>,failedUploads: null == failedUploads ? _self._failedUploads : failedUploads // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$EditFormStateModel {

/// Whether form has unsaved changes
 bool get hasUnsavedChanges;/// Current editing section
 String? get currentSection;/// Form validation state
 bool get isValid;/// Whether save operation is in progress
 bool get isSaving;/// Field-specific errors
 Map<String, String> get fieldErrors;/// Modified fields tracking
 Map<String, dynamic> get modifiedFields;
/// Create a copy of EditFormStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditFormStateModelCopyWith<EditFormStateModel> get copyWith => _$EditFormStateModelCopyWithImpl<EditFormStateModel>(this as EditFormStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditFormStateModel&&(identical(other.hasUnsavedChanges, hasUnsavedChanges) || other.hasUnsavedChanges == hasUnsavedChanges)&&(identical(other.currentSection, currentSection) || other.currentSection == currentSection)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&const DeepCollectionEquality().equals(other.modifiedFields, modifiedFields));
}


@override
int get hashCode => Object.hash(runtimeType,hasUnsavedChanges,currentSection,isValid,isSaving,const DeepCollectionEquality().hash(fieldErrors),const DeepCollectionEquality().hash(modifiedFields));

@override
String toString() {
  return 'EditFormStateModel(hasUnsavedChanges: $hasUnsavedChanges, currentSection: $currentSection, isValid: $isValid, isSaving: $isSaving, fieldErrors: $fieldErrors, modifiedFields: $modifiedFields)';
}


}

/// @nodoc
abstract mixin class $EditFormStateModelCopyWith<$Res>  {
  factory $EditFormStateModelCopyWith(EditFormStateModel value, $Res Function(EditFormStateModel) _then) = _$EditFormStateModelCopyWithImpl;
@useResult
$Res call({
 bool hasUnsavedChanges, String? currentSection, bool isValid, bool isSaving, Map<String, String> fieldErrors, Map<String, dynamic> modifiedFields
});




}
/// @nodoc
class _$EditFormStateModelCopyWithImpl<$Res>
    implements $EditFormStateModelCopyWith<$Res> {
  _$EditFormStateModelCopyWithImpl(this._self, this._then);

  final EditFormStateModel _self;
  final $Res Function(EditFormStateModel) _then;

/// Create a copy of EditFormStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasUnsavedChanges = null,Object? currentSection = freezed,Object? isValid = null,Object? isSaving = null,Object? fieldErrors = null,Object? modifiedFields = null,}) {
  return _then(_self.copyWith(
hasUnsavedChanges: null == hasUnsavedChanges ? _self.hasUnsavedChanges : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
as bool,currentSection: freezed == currentSection ? _self.currentSection : currentSection // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,modifiedFields: null == modifiedFields ? _self.modifiedFields : modifiedFields // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [EditFormStateModel].
extension EditFormStateModelPatterns on EditFormStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditFormStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditFormStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditFormStateModel value)  $default,){
final _that = this;
switch (_that) {
case _EditFormStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditFormStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _EditFormStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasUnsavedChanges,  String? currentSection,  bool isValid,  bool isSaving,  Map<String, String> fieldErrors,  Map<String, dynamic> modifiedFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditFormStateModel() when $default != null:
return $default(_that.hasUnsavedChanges,_that.currentSection,_that.isValid,_that.isSaving,_that.fieldErrors,_that.modifiedFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasUnsavedChanges,  String? currentSection,  bool isValid,  bool isSaving,  Map<String, String> fieldErrors,  Map<String, dynamic> modifiedFields)  $default,) {final _that = this;
switch (_that) {
case _EditFormStateModel():
return $default(_that.hasUnsavedChanges,_that.currentSection,_that.isValid,_that.isSaving,_that.fieldErrors,_that.modifiedFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasUnsavedChanges,  String? currentSection,  bool isValid,  bool isSaving,  Map<String, String> fieldErrors,  Map<String, dynamic> modifiedFields)?  $default,) {final _that = this;
switch (_that) {
case _EditFormStateModel() when $default != null:
return $default(_that.hasUnsavedChanges,_that.currentSection,_that.isValid,_that.isSaving,_that.fieldErrors,_that.modifiedFields);case _:
  return null;

}
}

}

/// @nodoc


class _EditFormStateModel implements EditFormStateModel {
  const _EditFormStateModel({this.hasUnsavedChanges = false, this.currentSection, this.isValid = true, this.isSaving = false, final  Map<String, String> fieldErrors = const {}, final  Map<String, dynamic> modifiedFields = const {}}): _fieldErrors = fieldErrors,_modifiedFields = modifiedFields;
  

/// Whether form has unsaved changes
@override@JsonKey() final  bool hasUnsavedChanges;
/// Current editing section
@override final  String? currentSection;
/// Form validation state
@override@JsonKey() final  bool isValid;
/// Whether save operation is in progress
@override@JsonKey() final  bool isSaving;
/// Field-specific errors
 final  Map<String, String> _fieldErrors;
/// Field-specific errors
@override@JsonKey() Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

/// Modified fields tracking
 final  Map<String, dynamic> _modifiedFields;
/// Modified fields tracking
@override@JsonKey() Map<String, dynamic> get modifiedFields {
  if (_modifiedFields is EqualUnmodifiableMapView) return _modifiedFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_modifiedFields);
}


/// Create a copy of EditFormStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditFormStateModelCopyWith<_EditFormStateModel> get copyWith => __$EditFormStateModelCopyWithImpl<_EditFormStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditFormStateModel&&(identical(other.hasUnsavedChanges, hasUnsavedChanges) || other.hasUnsavedChanges == hasUnsavedChanges)&&(identical(other.currentSection, currentSection) || other.currentSection == currentSection)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&const DeepCollectionEquality().equals(other._modifiedFields, _modifiedFields));
}


@override
int get hashCode => Object.hash(runtimeType,hasUnsavedChanges,currentSection,isValid,isSaving,const DeepCollectionEquality().hash(_fieldErrors),const DeepCollectionEquality().hash(_modifiedFields));

@override
String toString() {
  return 'EditFormStateModel(hasUnsavedChanges: $hasUnsavedChanges, currentSection: $currentSection, isValid: $isValid, isSaving: $isSaving, fieldErrors: $fieldErrors, modifiedFields: $modifiedFields)';
}


}

/// @nodoc
abstract mixin class _$EditFormStateModelCopyWith<$Res> implements $EditFormStateModelCopyWith<$Res> {
  factory _$EditFormStateModelCopyWith(_EditFormStateModel value, $Res Function(_EditFormStateModel) _then) = __$EditFormStateModelCopyWithImpl;
@override @useResult
$Res call({
 bool hasUnsavedChanges, String? currentSection, bool isValid, bool isSaving, Map<String, String> fieldErrors, Map<String, dynamic> modifiedFields
});




}
/// @nodoc
class __$EditFormStateModelCopyWithImpl<$Res>
    implements _$EditFormStateModelCopyWith<$Res> {
  __$EditFormStateModelCopyWithImpl(this._self, this._then);

  final _EditFormStateModel _self;
  final $Res Function(_EditFormStateModel) _then;

/// Create a copy of EditFormStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasUnsavedChanges = null,Object? currentSection = freezed,Object? isValid = null,Object? isSaving = null,Object? fieldErrors = null,Object? modifiedFields = null,}) {
  return _then(_EditFormStateModel(
hasUnsavedChanges: null == hasUnsavedChanges ? _self.hasUnsavedChanges : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
as bool,currentSection: freezed == currentSection ? _self.currentSection : currentSection // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,modifiedFields: null == modifiedFields ? _self._modifiedFields : modifiedFields // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
