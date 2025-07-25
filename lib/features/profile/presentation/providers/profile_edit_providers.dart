import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_edit_providers.freezed.dart';
part 'profile_edit_providers.g.dart';

/// 🎛️ Profile Edit Providers - Complete Edit State Management (2025)
///
/// This file manages all state related to profile editing functionality:
/// - Tab selection (Edit/View)
/// - Form validation and changes tracking
/// - Save/discard operations
/// - Loading states for various operations
///
/// Key Features:
/// - Type-safe immutable state using Freezed
/// - Clean separation from UI logic
/// - Easy testing and debugging
/// - Future-ready for complex editing features
/// - Proper state lifecycle management

// ============================================================================
// 🎯 EDIT TAB ENUM
// ============================================================================

/// Edit tab options
enum ProfileEditTab { edit, view }

// ============================================================================
// 📋 FREEZED STATE MODELS
// ============================================================================

/// 🎯 Profile Edit State Model
///
/// Contains all state related to profile editing
@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    /// Currently selected tab (Edit/View)
    @Default(ProfileEditTab.edit) ProfileEditTab currentTab,

    /// Whether there are unsaved changes
    @Default(false) bool hasUnsavedChanges,

    /// Whether save operation is in progress
    @Default(false) bool isSaving,

    /// Whether the form is valid
    @Default(true) bool isFormValid,

    /// Field-specific validation errors
    @Default({}) Map<String, String> fieldErrors,

    /// Modified form data
    @Default({}) Map<String, dynamic> modifiedData,

    /// Original form data (for comparison)
    @Default({}) Map<String, dynamic> originalData,

    /// Loading states for different operations
    @Default({}) Map<String, bool> loadingStates,

    /// Success/error messages
    String? statusMessage,

    /// Whether to show validation errors
    @Default(false) bool showValidationErrors,
  }) = _ProfileEditState;

  /// Factory for initial state
  factory ProfileEditState.initial() => const ProfileEditState();

  @override
  // TODO: implement currentTab
  ProfileEditTab get currentTab => throw UnimplementedError();

  @override
  // TODO: implement fieldErrors
  Map<String, String> get fieldErrors => throw UnimplementedError();

  @override
  // TODO: implement hasUnsavedChanges
  bool get hasUnsavedChanges => throw UnimplementedError();

  @override
  // TODO: implement isFormValid
  bool get isFormValid => throw UnimplementedError();

  @override
  // TODO: implement isSaving
  bool get isSaving => throw UnimplementedError();

  @override
  // TODO: implement loadingStates
  Map<String, bool> get loadingStates => throw UnimplementedError();

  @override
  // TODO: implement modifiedData
  Map<String, dynamic> get modifiedData => throw UnimplementedError();

  @override
  // TODO: implement originalData
  Map<String, dynamic> get originalData => throw UnimplementedError();

  @override
  // TODO: implement showValidationErrors
  bool get showValidationErrors => throw UnimplementedError();

  @override
  // TODO: implement statusMessage
  String? get statusMessage => throw UnimplementedError();
}

// ============================================================================
// 🎛️ RIVERPOD NOTIFIER PROVIDERS
// ============================================================================

/// 🎯 Profile Edit Notifier - RENAMED TO AVOID CONFLICT
///
/// Main state management for profile editing screen
@riverpod
class ProfileEditNotifier extends _$ProfileEditNotifier {
  @override
  ProfileEditState build() => ProfileEditState.initial();

  /// 🔄 Change active tab
  void changeTab(ProfileEditTab tab) {
    state = state.copyWith(currentTab: tab);
  }

  /// ✏️ Update form field
  void updateField(String fieldName, dynamic value) {
    final newModifiedData = Map<String, dynamic>.from(state.modifiedData);
    newModifiedData[fieldName] = value;

    // Check if this creates unsaved changes
    final hasChanges = _hasDataChanged(newModifiedData, state.originalData);

    state = state.copyWith(
      modifiedData: newModifiedData,
      hasUnsavedChanges: hasChanges,
      // Clear field-specific errors when user makes changes
      fieldErrors: Map<String, String>.from(state.fieldErrors)
        ..remove(fieldName),
    );

    // Validate the updated field
    _validateField(fieldName, value);
  }

  /// 🔍 Validate specific field
  void _validateField(String fieldName, dynamic value) {
    final errors = Map<String, String>.from(state.fieldErrors);

    // Remove existing error for this field
    errors.remove(fieldName);

    // Add validation logic here as needed
    switch (fieldName) {
      case 'name':
        if (value == null || value.toString().trim().isEmpty) {
          errors[fieldName] = 'Name is required';
        } else if (value.toString().trim().length < 2) {
          errors[fieldName] = 'Name must be at least 2 characters';
        }
        break;
      case 'age':
        if (value == null) {
          errors[fieldName] = 'Age is required';
        } else if (value is int && (value < 18 || value > 99)) {
          errors[fieldName] = 'Age must be between 18 and 99';
        }
        break;
      // Add more field validations as needed
    }

    state = state.copyWith(fieldErrors: errors, isFormValid: errors.isEmpty);
  }

  /// 📋 Initialize form data
  void initializeFormData(Map<String, dynamic> profileData) {
    state = state.copyWith(
      originalData: Map<String, dynamic>.from(profileData),
      modifiedData: Map<String, dynamic>.from(profileData),
      hasUnsavedChanges: false,
      fieldErrors: {},
      isFormValid: true,
    );
  }

  /// 💾 Save changes
  Future<void> saveChanges() async {
    if (!state.isFormValid) {
      state = state.copyWith(showValidationErrors: true);
      return;
    }

    state = state.copyWith(isSaving: true, statusMessage: null);

    try {
      // TODO: Implement actual save logic here
      // This is where you'd call your repository/API
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      // Update original data to match saved data
      state = state.copyWith(
        originalData: Map<String, dynamic>.from(state.modifiedData),
        hasUnsavedChanges: false,
        isSaving: false,
        statusMessage: 'Profile updated successfully!',
      );
    } catch (error) {
      state = state.copyWith(
        isSaving: false,
        statusMessage: 'Failed to save changes: ${error.toString()}',
      );
    }
  }

  /// 🗑️ Discard changes
  void discardChanges() {
    state = state.copyWith(
      modifiedData: Map<String, dynamic>.from(state.originalData),
      hasUnsavedChanges: false,
      fieldErrors: {},
      isFormValid: true,
      showValidationErrors: false,
      statusMessage: null,
    );
  }

  /// 🔄 Set loading state for specific operation
  void setLoadingState(String operation, bool isLoading) {
    final newLoadingStates = Map<String, bool>.from(state.loadingStates);
    newLoadingStates[operation] = isLoading;

    state = state.copyWith(loadingStates: newLoadingStates);
  }

  /// 💬 Clear status message
  void clearStatusMessage() {
    state = state.copyWith(statusMessage: null);
  }

  /// 🔍 Check if data has changed
  bool _hasDataChanged(
    Map<String, dynamic> modified,
    Map<String, dynamic> original,
  ) {
    if (modified.length != original.length) return true;

    for (final key in modified.keys) {
      if (modified[key] != original[key]) return true;
    }

    return false;
  }

  /// ✅ Validate entire form
  void validateForm() {
    final errors = <String, String>{};

    // Validate all fields
    for (final entry in state.modifiedData.entries) {
      _validateField(entry.key, entry.value);
      if (state.fieldErrors.containsKey(entry.key)) {
        errors[entry.key] = state.fieldErrors[entry.key]!;
      }
    }

    state = state.copyWith(
      fieldErrors: errors,
      isFormValid: errors.isEmpty,
      showValidationErrors: true,
    );
  }
}

// ============================================================================
// 🔧 HELPER PROVIDERS
// ============================================================================

/// 🎯 Current Tab Provider (convenience)
@riverpod
ProfileEditTab currentEditTab(Ref ref) =>
    ref.watch(profileEditNotifierProvider).currentTab;

/// 💾 Has Unsaved Changes Provider (convenience)
@riverpod
bool hasUnsavedChanges(Ref ref) =>
    ref.watch(profileEditNotifierProvider).hasUnsavedChanges;

/// ✅ Form Valid Provider (convenience)
@riverpod
bool isFormValid(Ref ref) {
  return ref.watch(profileEditNotifierProvider).isFormValid;
}

/// 🔄 Is Saving Provider (convenience)
@riverpod
bool isSaving(Ref ref) {
  return ref.watch(profileEditNotifierProvider).isSaving;
}

// ============================================================================
// 📋 IMPLEMENTATION NOTES
// ============================================================================

/// **🎯 KEY FIXES APPLIED:**
/// - ✅ RENAMED: ProfileEditState notifier → ProfileEditNotifier
/// - ✅ FIXED: Proper extension of _$ProfileEditNotifier (generated base)
/// - ✅ UPDATED: All provider references to use profileEditNotifierProvider
/// - ✅ MAINTAINED: All functionality and method signatures
/// - ✅ RESOLVED: Naming conflicts between Freezed model and Riverpod notifier
/// 
/// **🏗️ ARCHITECTURE BENEFITS:**
/// - Clean separation between state model (ProfileEditState) and notifier (ProfileEditNotifier)
/// - Proper code generation without naming conflicts
/// - Type-safe state management with immutable state
/// - Easy testing and debugging capabilities
/// 
/// **🔄 USAGE PATTERN:**
/// ```dart
/// // In your widget:
/// final editState = ref.watch(profileEditNotifierProvider);
/// 
/// // Change tabs:
/// ref.read(profileEditNotifierProvider.notifier).changeTab(ProfileEditTab.view);
/// 
/// // Update fields:
/// ref.read(profileEditNotifierProvider.notifier).updateField('name', 'New Name');
/// 
/// // Save changes:
/// await ref.read(profileEditNotifierProvider.notifier).saveChanges();
/// ```