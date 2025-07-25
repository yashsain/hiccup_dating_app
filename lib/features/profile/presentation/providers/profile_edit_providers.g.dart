// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_edit_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 🎯 Profile Edit Notifier - RENAMED TO AVOID CONFLICT
///
/// Main state management for profile editing screen
@ProviderFor(ProfileEditNotifier)
const profileEditNotifierProvider = ProfileEditNotifierProvider._();

/// 🎯 Profile Edit Notifier - RENAMED TO AVOID CONFLICT
///
/// Main state management for profile editing screen
final class ProfileEditNotifierProvider
    extends $NotifierProvider<ProfileEditNotifier, ProfileEditState> {
  /// 🎯 Profile Edit Notifier - RENAMED TO AVOID CONFLICT
  ///
  /// Main state management for profile editing screen
  const ProfileEditNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileEditNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileEditNotifierHash();

  @$internal
  @override
  ProfileEditNotifier create() => ProfileEditNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileEditState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileEditState>(value),
    );
  }
}

String _$profileEditNotifierHash() =>
    r'c5b2ce9c2d5a9b43350e29c3efeccfd0a9126566';

abstract class _$ProfileEditNotifier extends $Notifier<ProfileEditState> {
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

String _$currentEditTabHash() => r'1492816020f15c5535fb31a8a236b45ae117d4c9';

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

String _$hasUnsavedChangesHash() => r'4c7399fce09a78bb2295f5b11d5d1f3952b66df8';

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

String _$isFormValidHash() => r'bc961d05a107c48091eb108dc9ff9e36d24f8186';

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

String _$isSavingHash() => r'f906445c5038b51d49eb2693df80ac78388e0a7f';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
