import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/services/theme_provider.dart';
import '../data/providers/profile_providers.dart';
import 'providers/profile_ui_providers.dart';
import 'widgets/common/profile_error_widget.dart';
import 'widgets/common/profile_loading_widget.dart';
import 'widgets/platform/profile_app_bar.dart';

/// 👤 Profile Screen - Modern Premium Dating Profile (2025)
///
/// This screen displays a complete user profile with:
/// - Beautiful gradient theming following Hiccup design
/// - Platform-specific optimizations (iOS/Android)
/// - Modular, reusable components
/// - Smooth animations and interactions
/// - Complete integration with existing data layer
///
/// Architecture:
/// - Clean separation of UI and business logic
/// - Platform-specific components in separate folders
/// - Theme-aware styling throughout
/// - Easy maintenance and testing
///
/// Key Features:
/// - Photo gallery with smooth transitions
/// - Interactive prompts and polls
/// - Interest chips with categories
/// - Verification badges and premium status
/// - Edit mode with form validation
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
        profileId ?? 'alex_chen_001'; // Default to Alex for demo

    // 📱 Load profile data
    final profileAsync = ref.watch(profileProvider(targetProfileId));

    // 🎛️ UI state management
    final uiState = ref.watch(profileUIStateProvider);

    // 🔄 Initialize demo data (development only)
    ref.watch(initializeDemoDataProvider);

    return Scaffold(
      // 📱 Platform-specific app bar
      appBar: ProfileAppBar(
        isOwnProfile: isOwnProfile,
        isEditMode: uiState.isEditMode,
        onEditToggle: () =>
            ref.read(profileUIStateProvider.notifier).toggleEditMode(),
        onSettingsTap: () => _showSettings(context),
        onShareTap: () => _shareProfile(context, targetProfileId),
      ),

      // 🎨 Gradient background matching Hiccup theme
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: profileAsync.when(
            // ✅ Profile loaded successfully
            data: (profileData) {
              if (profileData == null) {
                return ProfileErrorWidget(
                  message: 'Profile not found',
                  onRetry: () =>
                      ref.invalidate(profileProvider(targetProfileId)),
                );
              }

              return _buildProfileContent(context, ref, profileData, uiState);
            },

            // ⏳ Loading state with branded loading widget
            loading: () => const ProfileLoadingWidget(),

            // ❌ Error state with retry option
            error: (error, stack) => ProfileErrorWidget(
              message: 'Failed to load profile',
              error: error.toString(),
              onRetry: () => ref.invalidate(profileProvider(targetProfileId)),
            ),
          ),
        ),
      ),
    );
  }

  /// 🏗️ Build main profile content
  ///
  /// This will contain all the profile components:
  /// - Profile header (name, age, location, badges)
  /// - Photo gallery with media
  /// - Bio and dating goals
  /// - Prompts and interactive content
  /// - Interests and preferences
  /// - Action buttons
  Widget _buildProfileContent(
    BuildContext context,
    WidgetRef ref,
    dynamic profileData,
    ProfileUIState uiState,
  ) => CustomScrollView(
    slivers: [
      // 📝 TODO: Add profile components here in next phases
      SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // 🚧 Temporary content - will be replaced with real components
              Icon(
                Icons.favorite_rounded,
                size: 80,
                color: AppColors.getPrimaryColor(
                  ref.watch(currentBrightnessProvider),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Profile Foundation Ready!',
                style: AppTextStyles.getHeading2(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Clean architecture with theme integration complete.\nReady for component development.',
                style: AppTextStyles.getBodyMedium(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // 📊 Quick profile data preview (for verification)
              _buildQuickProfilePreview(context, profileData),
            ],
          ),
        ),
      ),
    ],
  );

  /// 📊 Quick profile preview for development verification
  Widget _buildQuickProfilePreview(BuildContext context, dynamic profileData) =>
      Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Data Loaded ✅',
              style: AppTextStyles.getLabelLarge(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Basic info preview
            _buildPreviewRow('Name', profileData.profile.name),
            _buildPreviewRow('Age', '${profileData.profile.age}'),
            _buildPreviewRow('Location', profileData.profile.location),
            _buildPreviewRow('Prompts', '${profileData.prompts.length}'),
            _buildPreviewRow('Media', '${profileData.media.length}'),
            _buildPreviewRow('Interests', '${profileData.interests.length}'),
            _buildPreviewRow('Badges', '${profileData.badges.length}'),

            const SizedBox(height: 8),
            Text(
              '🚀 Ready for UI components!',
              style: AppTextStyles.getCaption(
                context,
              ).copyWith(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      );

  /// 📋 Build preview row for data verification
  Widget _buildPreviewRow(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    ),
  );

  /// ⚙️ Show settings menu
  void _showSettings(BuildContext context) {
    // TODO: Implement settings in future phase
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings coming in Phase 4!')),
    );
  }

  /// 🔗 Share profile
  void _shareProfile(BuildContext context, String profileId) {
    // TODO: Implement sharing in future phase
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share feature coming in Phase 4!')),
    );
  }
}
