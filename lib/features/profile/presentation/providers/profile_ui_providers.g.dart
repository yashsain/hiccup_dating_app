// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_ui_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 🎯 Profile UI State Provider
///
/// Main UI state management for profile screen
@ProviderFor(ProfileUIState)
const profileUIStateProvider = ProfileUIStateProvider._();

/// 🎯 Profile UI State Provider
///
/// Main UI state management for profile screen
final class ProfileUIStateProvider
    extends $NotifierProvider<ProfileUIState, ProfileUIState> {
  /// 🎯 Profile UI State Provider
  ///
  /// Main UI state management for profile screen
  const ProfileUIStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileUIStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileUIStateHash();

  @$internal
  @override
  ProfileUIState create() => ProfileUIState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileUIState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileUIState>(value),
    );
  }
}

String _$profileUIStateHash() => r'25d37b2b6826c69a5e1a7d1f7ecff68f4cecfe2e';

abstract class _$ProfileUIState extends $Notifier<ProfileUIState> {
  ProfileUIState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProfileUIState, ProfileUIState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileUIState, ProfileUIState>,
              ProfileUIState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 📸 Photo Gallery State Provider
///
/// Manages photo gallery specific UI state
@ProviderFor(PhotoGalleryState)
const photoGalleryStateProvider = PhotoGalleryStateProvider._();

/// 📸 Photo Gallery State Provider
///
/// Manages photo gallery specific UI state
final class PhotoGalleryStateProvider
    extends $NotifierProvider<PhotoGalleryState, PhotoGalleryState> {
  /// 📸 Photo Gallery State Provider
  ///
  /// Manages photo gallery specific UI state
  const PhotoGalleryStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoGalleryStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoGalleryStateHash();

  @$internal
  @override
  PhotoGalleryState create() => PhotoGalleryState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhotoGalleryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhotoGalleryState>(value),
    );
  }
}

String _$photoGalleryStateHash() => r'2085c31cb2dbfb90a75a7f660d243fe7b78453ad';

abstract class _$PhotoGalleryState extends $Notifier<PhotoGalleryState> {
  PhotoGalleryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PhotoGalleryState, PhotoGalleryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PhotoGalleryState, PhotoGalleryState>,
              PhotoGalleryState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// ✏️ Edit Form State Provider
///
/// Manages profile editing form state
@ProviderFor(EditFormState)
const editFormStateProvider = EditFormStateProvider._();

/// ✏️ Edit Form State Provider
///
/// Manages profile editing form state
final class EditFormStateProvider
    extends $NotifierProvider<EditFormState, EditFormState> {
  /// ✏️ Edit Form State Provider
  ///
  /// Manages profile editing form state
  const EditFormStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editFormStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editFormStateHash();

  @$internal
  @override
  EditFormState create() => EditFormState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditFormState>(value),
    );
  }
}

String _$editFormStateHash() => r'920a76dede898b98d090589c758dec3908b7aef8';

abstract class _$EditFormState extends $Notifier<EditFormState> {
  EditFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<EditFormState, EditFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditFormState, EditFormState>,
              EditFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 🎯 Check if any loading state is active
@ProviderFor(hasActiveLoading)
const hasActiveLoadingProvider = HasActiveLoadingProvider._();

/// 🎯 Check if any loading state is active
final class HasActiveLoadingProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 🎯 Check if any loading state is active
  const HasActiveLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasActiveLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasActiveLoadingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasActiveLoading(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasActiveLoadingHash() => r'0d039c0a662e2a690464577310264ef8d553c019';

/// 🎯 Check if profile has unsaved changes
@ProviderFor(hasUnsavedChanges)
const hasUnsavedChangesProvider = HasUnsavedChangesProvider._();

/// 🎯 Check if profile has unsaved changes
final class HasUnsavedChangesProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 🎯 Check if profile has unsaved changes
  const HasUnsavedChangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasUnsavedChangesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasUnsavedChangesHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasUnsavedChanges(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasUnsavedChangesHash() => r'fec86abe914617f1e4b01a9fcee6d19774bacf88';

/// 🎯 Get current validation errors count
@ProviderFor(validationErrorCount)
const validationErrorCountProvider = ValidationErrorCountProvider._();

/// 🎯 Get current validation errors count
final class ValidationErrorCountProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// 🎯 Get current validation errors count
  const ValidationErrorCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'validationErrorCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$validationErrorCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return validationErrorCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$validationErrorCountHash() =>
    r'6c188246cc2993569d9a6b7dc20bdf2cee33620d';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
