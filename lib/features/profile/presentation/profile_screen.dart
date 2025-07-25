import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/services/theme_provider.dart';
import '../data/providers/profile_providers.dart';
import 'providers/profile_ui_providers.dart';
import 'widgets/common/profile_error_widget.dart';
import 'widgets/common/profile_loading_widget.dart';
import 'widgets/profile_main_view.dart';
import 'widgets/platform/profile_app_bar.dart';

/// 👤 Profile Screen - Single Continuous Gradient (2025)
///
/// **🎨 UPDATED: Full Screen Gradient Implementation**
///
/// Perfect gradient flow screen featuring:
/// - ✅ Single continuous gradient (top pixel → bottom navigation)
/// - ✅ Transparent header with floating glass icons
/// - ✅ No white backgrounds or visual separations
/// - ✅ Edge-to-edge gradient behind status bar
/// - ✅ ProfileMainView completely transparent
/// - ✅ Clean, seamless visual experience
///
/// **🔄 Key Updates:**
/// - ✅ Moved gradient from ProfileMainView to Scaffold body
/// - ✅ Extended body behind app bar (edge-to-edge)
/// - ✅ Removed all competing backgrounds
/// - ✅ Perfect visual continuity
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
      // 🎨 CRITICAL: Remove all scaffold backgrounds
      backgroundColor: Colors.transparent,

      // 🌟 CRITICAL: Extend body behind app bar for edge-to-edge gradient
      extendBodyBehindAppBar: true,

      // 📱 Transparent app bar with glass icons (floating on gradient)
      appBar: ProfileAppBar(
        isOwnProfile: isOwnProfile,
        isEditMode: uiState.isEditMode,
        onPreferencesTap: () => _showPreferences(context),
        onSettingsTap: () => _showSettings(context),
      ),

      // 🎨 MAIN CHANGE: Single continuous gradient for entire screen
      body: Container(
        // ✅ FULL SCREEN GRADIENT (top pixel to bottom)
        decoration: BoxDecoration(gradient: gradient),

        // 🌟 EDGE-TO-EDGE: Gradient goes behind status bar and app bar
        width: double.infinity,
        height: double.infinity,

        // 📱 ProfileMainView now completely transparent
        child: ProfileMainView(
          profileId: targetProfileId,
          isOwnProfile: isOwnProfile,
          onEditPressed: () => _handleEditProfile(context, ref),
        ),
      ),
    );
  }

  // ============================================================================
  // 🎯 ACTION HANDLERS (UNCHANGED)
  // ============================================================================

  /// ✏️ Handle edit profile action
  void _handleEditProfile(BuildContext context, WidgetRef ref) {
    // Navigate directly to edit screen without snackbar
    context.push('/main/profile/edit?profileId=$profileId');

    debugPrint('🎯 Edit Profile: Navigating to edit screen...');
  }

  /// ⚙️ Handle settings action
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

  /// 🎛️ Handle preferences action
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

/// **🎯 CRITICAL CHANGES MADE:**
/// - ✅ `extendBodyBehindAppBar: true` - Gradient goes behind app bar
/// - ✅ `backgroundColor: Colors.transparent` - No scaffold background interference
/// - ✅ Single Container with gradient for entire body
/// - ✅ ProfileMainView receives no background (completely transparent)
/// - ✅ Edge-to-edge gradient from top pixel to bottom
/// 
/// **🏗️ PERFECT STRUCTURE:**
/// ```
/// Scaffold (transparent)
/// ├── ProfileAppBar (transparent, floating on gradient)
/// └── Container (FULL GRADIENT)
///     └── ProfileMainView (transparent, content only)
/// ```
/// 
/// **🎨 VISUAL RESULT:**
/// - Single continuous gradient from status bar to bottom nav
/// - No white backgrounds anywhere
/// - No visual separations or borders
/// - Glass icons floating perfectly on gradient
/// - Edge-to-edge modern design
/// 
/// **🔄 WHAT HAPPENS:**
/// 1. Scaffold has no background (transparent)
/// 2. extendBodyBehindAppBar makes content go behind transparent app bar
/// 3. Single Container with gradient covers entire screen
/// 4. ProfileMainView is completely transparent
/// 5. Result: Seamless gradient with floating elements