// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_edit_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 🎯 Profile Edit State Provider
///
/// Main state management for profile editing screen
@ProviderFor(ProfileEditState)
const profileEditStateProvider = ProfileEditStateProvider._();

/// 🎯 Profile Edit State Provider
///
/// Main state management for profile editing screen
final class ProfileEditStateProvider
    extends $NotifierProvider<ProfileEditState, ProfileEditState> {
  /// 🎯 Profile Edit State Provider
  ///
  /// Main state management for profile editing screen
  const ProfileEditStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileEditStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileEditStateHash();

  @$internal
  @override
  ProfileEditState create() => ProfileEditState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileEditState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileEditState>(value),
    );
  }
}

String _$profileEditStateHash() => r'7dd4429576714f63b5798154c4759d978c7ffaae';

abstract class _$ProfileEditState extends $Notifier<ProfileEditState> {
  ProfileEditState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProfileEditState, ProfileEditState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileEditState, ProfileEditState>,
              ProfileEditState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 🎯 Current Tab Provider (convenience)
@ProviderFor(currentEditTab)
const currentEditTabProvider = CurrentEditTabProvider._();

/// 🎯 Current Tab Provider (convenience)
final class CurrentEditTabProvider
    extends $FunctionalProvider<ProfileEditTab, ProfileEditTab, ProfileEditTab>
    with $Provider<ProfileEditTab> {
  /// 🎯 Current Tab Provider (convenience)
  const CurrentEditTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentEditTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentEditTabHash();

  @$internal
  @override
  $ProviderElement<ProfileEditTab> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProfileEditTab create(Ref ref) {
    return currentEditTab(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileEditTab value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileEditTab>(value),
    );
  }
}

String _$currentEditTabHash() => r'3f07923dd3792f780074054026ade9abc64d72b7';

/// 💾 Has Unsaved Changes Provider (convenience)
@ProviderFor(hasUnsavedChanges)
const hasUnsavedChangesProvider = HasUnsavedChangesProvider._();

/// 💾 Has Unsaved Changes Provider (convenience)
final class HasUnsavedChangesProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 💾 Has Unsaved Changes Provider (convenience)
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

String _$hasUnsavedChangesHash() => r'447a7cf4f7f83f8a34fa754276eb3eb1b035ea57';

/// ✅ Form Valid Provider (convenience)
@ProviderFor(isFormValid)
const isFormValidProvider = IsFormValidProvider._();

/// ✅ Form Valid Provider (convenience)
final class IsFormValidProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// ✅ Form Valid Provider (convenience)
  const IsFormValidProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isFormValidProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isFormValidHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isFormValid(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isFormValidHash() => r'd44f3e8c698da60d3080c7b98537162fc5f8b47b';

/// 🔄 Is Saving Provider (convenience)
@ProviderFor(isSaving)
const isSavingProvider = IsSavingProvider._();

/// 🔄 Is Saving Provider (convenience)
final class IsSavingProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 🔄 Is Saving Provider (convenience)
  const IsSavingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isSavingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isSavingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isSaving(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isSavingHash() => r'4b641121e95056123d08878b5fd2f9a68b5084c9';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
