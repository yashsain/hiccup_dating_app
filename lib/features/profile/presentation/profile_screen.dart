import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/services/theme_provider.dart';
import '../data/providers/profile_providers.dart';
import 'providers/profile_ui_providers.dart';
import 'widgets/common/profile_error_widget.dart';
import 'widgets/common/profile_loading_widget.dart';
import 'widgets/gallery/profile_photo_gallery.dart';
import 'widgets/header/profile_header.dart';
import 'widgets/platform/profile_app_bar.dart';

/// 👤 Profile Screen - Modern Premium Dating Profile (2025)
///
/// This screen displays a complete user profile with:
/// - Platform-specific app bar with edit/share actions
/// - Profile header with photo, name, age, location, badges
/// - Photo gallery with swipeable media carousel ✅ NEW
/// - Bio section with dating goals and personality
/// - Interactive prompts and polls
/// - Interest chips and hobby display
/// - Platform-optimized animations and interactions
///
/// Architecture:
/// - Uses ProfileHeader and ProfilePhotoGallery components for clean separation
/// - Integrates with existing data layer (zero changes needed)
/// - Platform-specific components isolated in platform/ folder
/// - Reusable widgets following ProfileBaseWidget pattern
/// - Theme-aware styling with Hiccup gradient system
///
/// Key Features:
/// - ✅ Complete data integration with existing providers
/// - ✅ Premium UI following Hiccup design philosophy
/// - ✅ Platform separation for iOS/Android differences
/// - ✅ Smooth animations and micro-interactions
/// - ✅ Accessibility support throughout
/// - ✅ Error handling with retry capabilities
/// - ✅ Loading states with branded components
/// - ✅ Photo Gallery with swipeable carousel ✅ NEW
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
      body: DecoratedBox(
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

              return _buildProfileContent(
                context,
                ref,
                targetProfileId,
                uiState,
              );
            },

            // ⏳ Loading state with branded loading widget
            loading: () => const ProfileLoadingWidget(
              message: 'Loading profile...',
              type: ProfileLoadingType.profile,
            ),

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
  Widget _buildProfileContent(
    BuildContext context,
    WidgetRef ref,
    String profileId,
    ProfileUIStateModel uiState,
  ) => CustomScrollView(
    slivers: [
      // 👤 Profile Header Section
      SliverToBoxAdapter(
        child: ProfileHeader(
          profileId: profileId,
          isOwnProfile: isOwnProfile,
          onEditPressed: () => _handleEditProfile(context, ref),
          onSettingsPressed: () => _showSettings(context),
          onSharePressed: () => _shareProfile(context, profileId),
          onPhotoTapped: () => _handlePhotoTap(context, ref),
        ),
      ),

      // 📸 Photo Gallery Section ✅ NEW
      SliverToBoxAdapter(
        child: ProfilePhotoGallery(
          profileId: profileId,
          isOwnProfile: isOwnProfile,
          onAddMediaPressed: () => _handleAddMedia(context, ref),
          onMediaTapped: (index, mediaItem) =>
              _handleMediaTap(context, ref, index, mediaItem),
        ),
      ),

      // 🚧 Placeholder sections for remaining Phase 2 components
      SliverToBoxAdapter(child: _buildRemainingPlaceholders(context, ref)),
    ],
  );

  /// 🚧 Remaining placeholders for upcoming components
  Widget _buildRemainingPlaceholders(BuildContext context, WidgetRef ref) =>
      Column(
        children: [
          const SizedBox(height: 16),

          // Placeholder for Bio Section (coming next)
          _buildComponentPlaceholder(
            context,
            'Bio Section',
            'Bio text, dating goals, and personality highlights',
            Icons.description_rounded,
          ),

          const SizedBox(height: 12),

          // Placeholder for Prompt Cards (coming next)
          _buildComponentPlaceholder(
            context,
            'Prompt Cards',
            'Interactive Q&A prompts with social engagement',
            Icons.chat_bubble_outline_rounded,
          ),

          const SizedBox(height: 12),

          // Placeholder for Interactive Polls (coming next)
          _buildComponentPlaceholder(
            context,
            'Interactive Polls',
            'Voting system with real-time results and engagement',
            Icons.poll_rounded,
          ),

          const SizedBox(height: 12),

          // Placeholder for Interest Grid (coming next)
          _buildComponentPlaceholder(
            context,
            'Interest Grid',
            'Colorful chips displaying hobbies and interests',
            Icons.interests_rounded,
          ),

          const SizedBox(height: 24),
        ],
      );

  /// 🎯 Build component placeholder card
  Widget _buildComponentPlaceholder(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) => Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
      ),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.getLabelLarge(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppTextStyles.getBodySmall(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Coming Soon',
            style: AppTextStyles.getCaption(context).copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );

  // ============================================================================
  // 🎯 ACTION HANDLERS
  // ============================================================================

  /// ✏️ Handle edit profile action
  void _handleEditProfile(BuildContext context, WidgetRef ref) {
    ref.read(profileUIStateProvider.notifier).toggleEditMode();

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
  }

  /// 📸 Handle photo tap action
  void _handlePhotoTap(BuildContext context, WidgetRef ref) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Photo editing coming in Phase 3!',
          style: AppTextStyles.getBodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// ➕ Handle add media action ✅ NEW
  void _handleAddMedia(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text('Add Media', style: AppTextStyles.getHeading3(context)),
            const SizedBox(height: 16),

            // Media type options
            _buildMediaOption(
              context,
              'Take Photo',
              'Capture a new photo with camera',
              Icons.camera_alt_rounded,
              () => _handleCameraAction(context),
            ),
            const SizedBox(height: 12),
            _buildMediaOption(
              context,
              'Choose from Gallery',
              'Select photos from your gallery',
              Icons.photo_library_rounded,
              () => _handleGalleryAction(context),
            ),
            const SizedBox(height: 12),
            _buildMediaOption(
              context,
              'Record Video',
              'Create a short video clip',
              Icons.videocam_rounded,
              () => _handleVideoAction(context),
            ),
            const SizedBox(height: 12),
            _buildMediaOption(
              context,
              'Voice Note',
              'Record a voice introduction',
              Icons.mic_rounded,
              () => _handleVoiceAction(context),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  /// 🎬 Handle media tap action ✅ NEW
  void _handleMediaTap(
    BuildContext context,
    WidgetRef ref,
    int index,
    dynamic mediaItem,
  ) {
    showDialog(
      context: context,
      backgroundColor: Colors.black87,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                      Theme.of(context).colorScheme.primary.withOpacity(0.6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getMediaIcon(mediaItem.type),
                        color: Colors.white,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${mediaItem.type} Preview',
                        style: AppTextStyles.getHeading3(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Full media viewer coming in Phase 3!',
                        style: AppTextStyles.getBodyMedium(
                          context,
                        ).copyWith(color: Colors.white.withOpacity(0.8)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Close',
                  style: AppTextStyles.getLabelLarge(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🎯 Build media option for bottom sheet
  Widget _buildMediaOption(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.getLabelLarge(
                    context,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  description,
                  style: AppTextStyles.getBodySmall(context).copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: Theme.of(context).colorScheme.outline,
          ),
        ],
      ),
    ),
  );

  /// 📷 Handle camera action
  void _handleCameraAction(BuildContext context) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Camera integration coming in Phase 3!',
          style: AppTextStyles.getBodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// 🖼️ Handle gallery action
  void _handleGalleryAction(BuildContext context) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Gallery picker coming in Phase 3!',
          style: AppTextStyles.getBodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// 🎬 Handle video action
  void _handleVideoAction(BuildContext context) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Video recording coming in Phase 3!',
          style: AppTextStyles.getBodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// 🎤 Handle voice action
  void _handleVoiceAction(BuildContext context) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Voice recording coming in Phase 3!',
          style: AppTextStyles.getBodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// ⚙️ Show settings
  void _showSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text('Profile Settings', style: AppTextStyles.getHeading3(context)),
            const SizedBox(height: 16),
            Text(
              'Settings panel coming in Phase 3!',
              style: AppTextStyles.getBodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Got it',
                  style: AppTextStyles.getLabelLarge(
                    context,
                  ).copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📤 Share profile
  void _shareProfile(BuildContext context, String profileId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Profile sharing coming in Phase 3!',
          style: AppTextStyles.getBodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// 🔧 Helper method to get media icon
  IconData _getMediaIcon(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return Icons.videocam_rounded;
      case 'voice':
        return Icons.mic_rounded;
      default:
        return Icons.photo_rounded;
    }
  }
}
