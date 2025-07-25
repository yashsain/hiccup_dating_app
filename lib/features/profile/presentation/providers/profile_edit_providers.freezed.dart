// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEditState {

/// Currently selected tab (Edit/View)
 ProfileEditTab get currentTab;/// Whether there are unsaved changes
 bool get hasUnsavedChanges;/// Whether save operation is in progress
 bool get isSaving;/// Whether the form is valid
 bool get isFormValid;/// Field-specific validation errors
 Map<String, String> get fieldErrors;/// Modified form data
 Map<String, dynamic> get modifiedData;/// Original form data (for comparison)
 Map<String, dynamic> get originalData;/// Loading states for different operations
 Map<String, bool> get loadingStates;/// Success/error messages
 String? get statusMessage;/// Whether to show validation errors
 bool get showValidationErrors;
/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEditStateCopyWith<ProfileEditState> get copyWith => _$ProfileEditStateCopyWithImpl<ProfileEditState>(this as ProfileEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.hasUnsavedChanges, hasUnsavedChanges) || other.hasUnsavedChanges == hasUnsavedChanges)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&const DeepCollectionEquality().equals(other.modifiedData, modifiedData)&&const DeepCollectionEquality().equals(other.originalData, originalData)&&const DeepCollectionEquality().equals(other.loadingStates, loadingStates)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.showValidationErrors, showValidationErrors) || other.showValidationErrors == showValidationErrors));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,hasUnsavedChanges,isSaving,isFormValid,const DeepCollectionEquality().hash(fieldErrors),const DeepCollectionEquality().hash(modifiedData),const DeepCollectionEquality().hash(originalData),const DeepCollectionEquality().hash(loadingStates),statusMessage,showValidationErrors);

@override
String toString() {
  return 'ProfileEditState(currentTab: $currentTab, hasUnsavedChanges: $hasUnsavedChanges, isSaving: $isSaving, isFormValid: $isFormValid, fieldErrors: $fieldErrors, modifiedData: $modifiedData, originalData: $originalData, loadingStates: $loadingStates, statusMessage: $statusMessage, showValidationErrors: $showValidationErrors)';
}


}

/// @nodoc
abstract mixin class $ProfileEditStateCopyWith<$Res>  {
  factory $ProfileEditStateCopyWith(ProfileEditState value, $Res Function(ProfileEditState) _then) = _$ProfileEditStateCopyWithImpl;
@useResult
$Res call({
 ProfileEditTab currentTab, bool hasUnsavedChanges, bool isSaving, bool isFormValid, Map<String, String> fieldErrors, Map<String, dynamic> modifiedData, Map<String, dynamic> originalData, Map<String, bool> loadingStates, String? statusMessage, bool showValidationErrors
});




}
/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._self, this._then);

  final ProfileEditState _self;
  final $Res Function(ProfileEditState) _then;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTab = null,Object? hasUnsavedChanges = null,Object? isSaving = null,Object? isFormValid = null,Object? fieldErrors = null,Object? modifiedData = null,Object? originalData = null,Object? loadingStates = null,Object? statusMessage = freezed,Object? showValidationErrors = null,}) {
  return _then(_self.copyWith(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as ProfileEditTab,hasUnsavedChanges: null == hasUnsavedChanges ? _self.hasUnsavedChanges : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,modifiedData: null == modifiedData ? _self.modifiedData : modifiedData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,originalData: null == originalData ? _self.originalData : originalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,loadingStates: null == loadingStates ? _self.loadingStates : loadingStates // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,showValidationErrors: null == showValidationErrors ? _self.showValidationErrors : showValidationErrors // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileEditState].
extension ProfileEditStatePatterns on ProfileEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEditState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEditState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfileEditTab currentTab,  bool hasUnsavedChanges,  bool isSaving,  bool isFormValid,  Map<String, String> fieldErrors,  Map<String, dynamic> modifiedData,  Map<String, dynamic> originalData,  Map<String, bool> loadingStates,  String? statusMessage,  bool showValidationErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
return $default(_that.currentTab,_that.hasUnsavedChanges,_that.isSaving,_that.isFormValid,_that.fieldErrors,_that.modifiedData,_that.originalData,_that.loadingStates,_that.statusMessage,_that.showValidationErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfileEditTab currentTab,  bool hasUnsavedChanges,  bool isSaving,  bool isFormValid,  Map<String, String> fieldErrors,  Map<String, dynamic> modifiedData,  Map<String, dynamic> originalData,  Map<String, bool> loadingStates,  String? statusMessage,  bool showValidationErrors)  $default,) {final _that = this;
switch (_that) {
case _ProfileEditState():
return $default(_that.currentTab,_that.hasUnsavedChanges,_that.isSaving,_that.isFormValid,_that.fieldErrors,_that.modifiedData,_that.originalData,_that.loadingStates,_that.statusMessage,_that.showValidationErrors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfileEditTab currentTab,  bool hasUnsavedChanges,  bool isSaving,  bool isFormValid,  Map<String, String> fieldErrors,  Map<String, dynamic> modifiedData,  Map<String, dynamic> originalData,  Map<String, bool> loadingStates,  String? statusMessage,  bool showValidationErrors)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
return $default(_that.currentTab,_that.hasUnsavedChanges,_that.isSaving,_that.isFormValid,_that.fieldErrors,_that.modifiedData,_that.originalData,_that.loadingStates,_that.statusMessage,_that.showValidationErrors);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileEditState implements ProfileEditState {
  const _ProfileEditState({this.currentTab = ProfileEditTab.edit, this.hasUnsavedChanges = false, this.isSaving = false, this.isFormValid = true, final  Map<String, String> fieldErrors = const {}, final  Map<String, dynamic> modifiedData = const {}, final  Map<String, dynamic> originalData = const {}, final  Map<String, bool> loadingStates = const {}, this.statusMessage, this.showValidationErrors = false}): _fieldErrors = fieldErrors,_modifiedData = modifiedData,_originalData = originalData,_loadingStates = loadingStates;
  

/// Currently selected tab (Edit/View)
@override@JsonKey() final  ProfileEditTab currentTab;
/// Whether there are unsaved changes
@override@JsonKey() final  bool hasUnsavedChanges;
/// Whether save operation is in progress
@override@JsonKey() final  bool isSaving;
/// Whether the form is valid
@override@JsonKey() final  bool isFormValid;
/// Field-specific validation errors
 final  Map<String, String> _fieldErrors;
/// Field-specific validation errors
@override@JsonKey() Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

/// Modified form data
 final  Map<String, dynamic> _modifiedData;
/// Modified form data
@override@JsonKey() Map<String, dynamic> get modifiedData {
  if (_modifiedData is EqualUnmodifiableMapView) return _modifiedData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_modifiedData);
}

/// Original form data (for comparison)
 final  Map<String, dynamic> _originalData;
/// Original form data (for comparison)
@override@JsonKey() Map<String, dynamic> get originalData {
  if (_originalData is EqualUnmodifiableMapView) return _originalData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_originalData);
}

/// Loading states for different operations
 final  Map<String, bool> _loadingStates;
/// Loading states for different operations
@override@JsonKey() Map<String, bool> get loadingStates {
  if (_loadingStates is EqualUnmodifiableMapView) return _loadingStates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_loadingStates);
}

/// Success/error messages
@override final  String? statusMessage;
/// Whether to show validation errors
@override@JsonKey() final  bool showValidationErrors;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEditStateCopyWith<_ProfileEditState> get copyWith => __$ProfileEditStateCopyWithImpl<_ProfileEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEditState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.hasUnsavedChanges, hasUnsavedChanges) || other.hasUnsavedChanges == hasUnsavedChanges)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&const DeepCollectionEquality().equals(other._modifiedData, _modifiedData)&&const DeepCollectionEquality().equals(other._originalData, _originalData)&&const DeepCollectionEquality().equals(other._loadingStates, _loadingStates)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.showValidationErrors, showValidationErrors) || other.showValidationErrors == showValidationErrors));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,hasUnsavedChanges,isSaving,isFormValid,const DeepCollectionEquality().hash(_fieldErrors),const DeepCollectionEquality().hash(_modifiedData),const DeepCollectionEquality().hash(_originalData),const DeepCollectionEquality().hash(_loadingStates),statusMessage,showValidationErrors);

@override
String toString() {
  return 'ProfileEditState(currentTab: $currentTab, hasUnsavedChanges: $hasUnsavedChanges, isSaving: $isSaving, isFormValid: $isFormValid, fieldErrors: $fieldErrors, modifiedData: $modifiedData, originalData: $originalData, loadingStates: $loadingStates, statusMessage: $statusMessage, showValidationErrors: $showValidationErrors)';
}


}

/// @nodoc
abstract mixin class _$ProfileEditStateCopyWith<$Res> implements $ProfileEditStateCopyWith<$Res> {
  factory _$ProfileEditStateCopyWith(_ProfileEditState value, $Res Function(_ProfileEditState) _then) = __$ProfileEditStateCopyWithImpl;
@override @useResult
$Res call({
 ProfileEditTab currentTab, bool hasUnsavedChanges, bool isSaving, bool isFormValid, Map<String, String> fieldErrors, Map<String, dynamic> modifiedData, Map<String, dynamic> originalData, Map<String, bool> loadingStates, String? statusMessage, bool showValidationErrors
});




}
/// @nodoc
class __$ProfileEditStateCopyWithImpl<$Res>
    implements _$ProfileEditStateCopyWith<$Res> {
  __$ProfileEditStateCopyWithImpl(this._self, this._then);

  final _ProfileEditState _self;
  final $Res Function(_ProfileEditState) _then;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTab = null,Object? hasUnsavedChanges = null,Object? isSaving = null,Object? isFormValid = null,Object? fieldErrors = null,Object? modifiedData = null,Object? originalData = null,Object? loadingStates = null,Object? statusMessage = freezed,Object? showValidationErrors = null,}) {
  return _then(_ProfileEditState(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as ProfileEditTab,hasUnsavedChanges: null == hasUnsavedChanges ? _self.hasUnsavedChanges : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,modifiedData: null == modifiedData ? _self._modifiedData : modifiedData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,originalData: null == originalData ? _self._originalData : originalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,loadingStates: null == loadingStates ? _self._loadingStates : loadingStates // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,showValidationErrors: null == showValidationErrors ? _self.showValidationErrors : showValidationErrors // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
