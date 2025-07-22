import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_ui_providers.freezed.dart';
part 'profile_ui_providers.g.dart';

/// 🎛️ Profile UI Providers - UI State Management (2025)
///
/// This file manages UI-specific state for the profile screen, separate from
/// business logic. It handles:
/// - Edit mode toggling
/// - Photo gallery navigation
/// - Form validation states
/// - Loading states for UI interactions
/// - Platform-specific UI adjustments
///
/// Key principles:
/// - Separate UI state from business data
/// - Immutable state using Freezed
/// - Type-safe state management
/// - Easy testing and debugging
/// - Platform-agnostic state handling

// ============================================================================
// 📋 UI STATE MODELS
// ============================================================================

/// 🎯 Profile UI State Model
///
/// Contains all UI-specific state for the profile screen
@freezed
class ProfileUIState with _$ProfileUIState {
  const factory ProfileUIState({
    /// Whether the profile is in edit mode
    @Default(false) bool isEditMode,

    /// Currently selected photo index in gallery
    @Default(0) int selectedPhotoIndex,

    /// Whether the photo gallery is expanded
    @Default(false) bool isPhotoGalleryExpanded,

    /// Currently active prompt for editing
    String? activePromptId,

    /// Whether interests are being edited
    @Default(false) bool isEditingInterests,

    /// Whether bio section is expanded
    @Default(false) bool isBioExpanded,

    /// Form validation errors
    @Default({}) Map<String, String> validationErrors,

    /// Loading states for different UI actions
    @Default({}) Map<String, bool> loadingStates,

    /// Whether to show verification prompt
    @Default(false) bool showVerificationPrompt,

    /// Selected interests during editing
    @Default([]) List<String> selectedInterests,

    /// Photo upload progress (0.0 to 1.0)
    @Default(0.0) double photoUploadProgress,

    /// Whether the profile action sheet is visible
    @Default(false) bool showActionSheet,
  }) = _ProfileUIState;

  /// 📱 Factory for initial state
  factory ProfileUIState.initial() => const ProfileUIState();
}

/// 🎯 Photo Gallery State Model
///
/// Specific state for photo gallery interactions
@freezed
class PhotoGalleryState with _$PhotoGalleryState {
  const factory PhotoGalleryState({
    /// Currently selected photo index
    @Default(0) int currentIndex,

    /// Whether gallery is in fullscreen mode
    @Default(false) bool isFullscreen,

    /// Whether photo info overlay is visible
    @Default(false) bool showPhotoInfo,

    /// Photos being uploaded
    @Default([]) List<String> uploading,

    /// Failed upload attempts
    @Default([]) List<String> failedUploads,
  }) = _PhotoGalleryState;

  factory PhotoGalleryState.initial() => const PhotoGalleryState();
}

/// 🎯 Edit Form State Model
///
/// State for profile editing forms
@freezed
class EditFormState with _$EditFormState {
  const factory EditFormState({
    /// Whether form has unsaved changes
    @Default(false) bool hasUnsavedChanges,

    /// Current editing section
    String? currentSection,

    /// Form validation state
    @Default(true) bool isValid,

    /// Whether save operation is in progress
    @Default(false) bool isSaving,

    /// Field-specific errors
    @Default({}) Map<String, String> fieldErrors,

    /// Modified fields tracking
    @Default({}) Map<String, dynamic> modifiedFields,
  }) = _EditFormState;

  factory EditFormState.initial() => const EditFormState();
}

// ============================================================================
// 🎛️ UI STATE PROVIDERS
// ============================================================================

/// 🎯 Profile UI State Provider
///
/// Main UI state management for profile screen
@riverpod
class ProfileUIState extends _$ProfileUIState {
  @override
  ProfileUIState build() => ProfileUIState.initial();

  /// 🔄 Toggle edit mode
  void toggleEditMode() {
    state = state.copyWith(isEditMode: !state.isEditMode);

    // Reset other states when exiting edit mode
    if (!state.isEditMode) {
      state = state.copyWith(
        activePromptId: null,
        isEditingInterests: false,
        validationErrors: {},
        selectedInterests: [],
      );
    }
  }

  /// 📸 Select photo in gallery
  void selectPhoto(int index) {
    state = state.copyWith(selectedPhotoIndex: index);
  }

  /// 🖼️ Toggle photo gallery expansion
  void togglePhotoGallery() {
    state = state.copyWith(
      isPhotoGalleryExpanded: !state.isPhotoGalleryExpanded,
    );
  }

  /// ✏️ Set active prompt for editing
  void setActivePrompt(String? promptId) {
    state = state.copyWith(activePromptId: promptId);
  }

  /// 🏷️ Toggle interests editing
  void toggleInterestsEditing() {
    state = state.copyWith(isEditingInterests: !state.isEditingInterests);
  }

  /// 📖 Toggle bio expansion
  void toggleBioExpansion() {
    state = state.copyWith(isBioExpanded: !state.isBioExpanded);
  }

  /// ❌ Add validation error
  void addValidationError(String field, String error) {
    final errors = Map<String, String>.from(state.validationErrors);
    errors[field] = error;
    state = state.copyWith(validationErrors: errors);
  }

  /// ✅ Clear validation error
  void clearValidationError(String field) {
    final errors = Map<String, String>.from(state.validationErrors);
    errors.remove(field);
    state = state.copyWith(validationErrors: errors);
  }

  /// ⏳ Set loading state for specific action
  void setLoading(String action, bool isLoading) {
    final loadingStates = Map<String, bool>.from(state.loadingStates);
    loadingStates[action] = isLoading;
    state = state.copyWith(loadingStates: loadingStates);
  }

  /// ✅ Show verification prompt
  void showVerificationPrompt() {
    state = state.copyWith(showVerificationPrompt: true);
  }

  /// ❌ Hide verification prompt
  void hideVerificationPrompt() {
    state = state.copyWith(showVerificationPrompt: false);
  }

  /// 🏷️ Update selected interests
  void updateSelectedInterests(List<String> interests) {
    state = state.copyWith(selectedInterests: interests);
  }

  /// 📤 Update photo upload progress
  void updatePhotoUploadProgress(double progress) {
    state = state.copyWith(photoUploadProgress: progress);
  }

  /// 📱 Toggle action sheet
  void toggleActionSheet() {
    state = state.copyWith(showActionSheet: !state.showActionSheet);
  }

  /// 🔄 Reset all UI state
  void reset() {
    state = ProfileUIState.initial();
  }
}

/// 📸 Photo Gallery State Provider
///
/// Manages photo gallery specific UI state
@riverpod
class PhotoGalleryState extends _$PhotoGalleryState {
  @override
  PhotoGalleryState build() => PhotoGalleryState.initial();

  /// 🖼️ Navigate to photo by index
  void navigateToPhoto(int index) {
    state = state.copyWith(currentIndex: index);
  }

  /// 🔍 Toggle fullscreen mode
  void toggleFullscreen() {
    state = state.copyWith(isFullscreen: !state.isFullscreen);
  }

  /// ℹ️ Toggle photo info overlay
  void togglePhotoInfo() {
    state = state.copyWith(showPhotoInfo: !state.showPhotoInfo);
  }

  /// 📤 Add photo to uploading list
  void addUploadingPhoto(String photoId) {
    final uploading = [...state.uploading, photoId];
    state = state.copyWith(uploading: uploading);
  }

  /// ✅ Remove photo from uploading list
  void removeUploadingPhoto(String photoId) {
    final uploading = state.uploading.where((id) => id != photoId).toList();
    state = state.copyWith(uploading: uploading);
  }

  /// ❌ Add failed upload
  void addFailedUpload(String photoId) {
    final failed = [...state.failedUploads, photoId];
    final uploading = state.uploading.where((id) => id != photoId).toList();
    state = state.copyWith(failedUploads: failed, uploading: uploading);
  }

  /// 🔄 Reset gallery state
  void reset() {
    state = PhotoGalleryState.initial();
  }
}

/// ✏️ Edit Form State Provider
///
/// Manages profile editing form state
@riverpod
class EditFormState extends _$EditFormState {
  @override
  EditFormState build() => EditFormState.initial();

  /// 📝 Set current editing section
  void setCurrentSection(String? section) {
    state = state.copyWith(currentSection: section);
  }

  /// 📝 Mark form as having unsaved changes
  void markAsChanged() {
    state = state.copyWith(hasUnsavedChanges: true);
  }

  /// 💾 Mark form as saved
  void markAsSaved() {
    state = state.copyWith(hasUnsavedChanges: false, modifiedFields: {});
  }

  /// ✅ Set form validation state
  void setValidationState(bool isValid) {
    state = state.copyWith(isValid: isValid);
  }

  /// ❌ Add field error
  void addFieldError(String field, String error) {
    final errors = Map<String, String>.from(state.fieldErrors);
    errors[field] = error;
    state = state.copyWith(fieldErrors: errors, isValid: false);
  }

  /// ✅ Clear field error
  void clearFieldError(String field) {
    final errors = Map<String, String>.from(state.fieldErrors);
    errors.remove(field);
    state = state.copyWith(fieldErrors: errors, isValid: errors.isEmpty);
  }

  /// 📝 Track modified field
  void trackModifiedField(String field, dynamic value) {
    final modified = Map<String, dynamic>.from(state.modifiedFields);
    modified[field] = value;
    state = state.copyWith(modifiedFields: modified, hasUnsavedChanges: true);
  }

  /// 💾 Set saving state
  void setSaving(bool isSaving) {
    state = state.copyWith(isSaving: isSaving);
  }

  /// 🔄 Reset form state
  void reset() {
    state = EditFormState.initial();
  }
}

// ============================================================================
// 🎯 UTILITY PROVIDERS
// ============================================================================

/// 🎯 Check if any loading state is active
@riverpod
bool hasActiveLoading(Ref ref) {
  final uiState = ref.watch(profileUIStateProvider);
  return uiState.loadingStates.values.any((isLoading) => isLoading);
}

/// 🎯 Check if profile has unsaved changes
@riverpod
bool hasUnsavedChanges(Ref ref) {
  final editState = ref.watch(editFormStateProvider);
  return editState.hasUnsavedChanges;
}

/// 🎯 Get current validation errors count
@riverpod
int validationErrorCount(Ref ref) {
  final uiState = ref.watch(profileUIStateProvider);
  final editState = ref.watch(editFormStateProvider);
  return uiState.validationErrors.length + editState.fieldErrors.length;
}
