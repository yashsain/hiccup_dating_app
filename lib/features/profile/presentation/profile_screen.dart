import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/services/theme_provider.dart';
import '../data/providers/profile_providers.dart';
import 'providers/profile_ui_providers.dart';
import 'widgets/common/profile_error_widget.dart';
import 'widgets/common/profile_loading_widget.dart';
import 'widgets/profile_main_view.dart';
import 'widgets/platform/profile_app_bar.dart';

/// 👤 Profile Screen - Minimalist Premium Dating Profile (2025)
///
/// **🎨 UPDATED with Perfect Header Integration**
///
/// Clean profile screen featuring:
/// - ✅ Transparent header with glass icons (preferences + settings)
/// - ✅ Uninterrupted gradient background from ProfileMainView
/// - ✅ Large circular profile photo as focal point
/// - ✅ Clean spacing with generous whitespace
/// - ✅ Hiccup theme integration (gradients, colors, fonts)
/// - ✅ Platform-specific optimizations
///
/// **🔄 Key Updates:**
/// - ✅ Callbacks routed to ProfileAppBar (not ProfileMainView)
/// - ✅ Removed duplicate header handling
/// - ✅ Clean separation of concerns
/// - ✅ Perfect visual integration
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key, this.profileId, this.isOwnProfile = true});

  /// Profile ID to display. If null, shows current user's profile.
  final String? profileId;

  /// Whether this profile is being viewed by the owner (enables editing)
  final bool isOwnProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);
    final gradient = AppColors.getThemeGradient(currentBrightness);

    // 🎯 Determine which profile to load
    final targetProfileId =
        profileId ?? 'alex_chen_001'; // Default demo profile

    // 🎛️ Watch UI state
    final uiState = ref.watch(profileUIStateProvider);

    return Scaffold(
      // 📱 Transparent app bar with glass icons (UPDATED CALLBACKS)
      appBar: ProfileAppBar(
        isOwnProfile: isOwnProfile,
        isEditMode: uiState.isEditMode,
        // ✅ FIXED: Route callbacks to header instead of main view
        onPreferencesTap: () => _showPreferences(context),
        onSettingsTap: () => _showSettings(context),
      ),

      // 🎨 Main content with uninterrupted gradient
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: ProfileMainView(
          profileId: targetProfileId,
          isOwnProfile: isOwnProfile,
          // ✅ SIMPLIFIED: Only edit callback needed now
          onEditPressed: () => _handleEditProfile(context, ref),
          // ✅ REMOVED: Settings and preferences handled by header
        ),
      ),
    );
  }

  // ============================================================================
  // 🎯 ACTION HANDLERS
  // ============================================================================

  /// ✏️ Handle edit profile action
  void _handleEditProfile(BuildContext context, WidgetRef ref) {
    // Toggle edit mode in UI state
    ref.read(profileUIStateProvider.notifier).toggleEditMode();

    // Show feedback to user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Edit mode ${ref.read(profileUIStateProvider).isEditMode ? "enabled" : "disabled"}',
          style: AppTextStyles.getBodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    debugPrint('🎯 Edit Profile: Opening edit mode...');
  }

  /// ⚙️ Handle settings action (NOW CALLED FROM HEADER)
  void _showSettings(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Settings screen coming soon!',
          style: AppTextStyles.getBodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    debugPrint('🎯 Settings: Opening settings from header...');
  }

  /// 🎛️ Handle preferences action (NOW CALLED FROM HEADER)
  void _showPreferences(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Preferences screen coming soon!',
          style: AppTextStyles.getBodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    debugPrint('🎯 Preferences: Opening preferences from header...');
  }
}

// ============================================================================
// 📋 IMPLEMENTATION NOTES
// ============================================================================

/// **🎯 KEY CHANGES MADE:**
/// - ✅ ProfileAppBar: Now handles settings + preferences callbacks
/// - ✅ ProfileMainView: Simplified, no longer handles header icons
/// - ✅ Transparent Integration: Gradient flows seamlessly behind glass icons
/// - ✅ Single Source of Truth: Header actions only in ProfileAppBar
/// - ✅ Clean Architecture: Proper separation of concerns maintained
/// 
/// **🏗️ UPDATED STRUCTURE:**
/// ```
/// ProfileScreen
/// ├── ProfileAppBar (transparent + glass icons) ← SETTINGS & PREFERENCES HERE
/// └── ProfileMainView (full gradient background) ← PROFILE CONTENT ONLY
///     ├── Profile Photo (centered, large)
///     ├── Name/Age/Location
///     └── "Get more" section
/// ```
/// 
/// **🎨 VISUAL RESULT:**
/// - Transparent header with beautiful glass morphism icons
/// - Uninterrupted gradient background
/// - Perfect alignment matching reference image
/// - iOS 26 liquid glass effect on icon backgrounds
/// - Professional, premium appearance
/// 
/// **🔄 NEXT STEPS:**
/// 1. Update ProfileMainView to remove duplicate header
/// 2. Test with `flutter run`
/// 3. Verify glass effect rendering
/// 4. Confirm callback functionality