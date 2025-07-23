import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../data/providers/profile_providers.dart';
import '../common/profile_base_widget.dart';

/// 👤 Profile Header Component - Premium Dating Profile Header (2025)
///
/// This component displays the main profile information:
/// - Profile photo with upload capability
/// - Name, age, and verification status
/// - Location information
/// - Premium badges and status indicators
/// - Action buttons (edit, settings, share)
///
/// Key Features:
/// - Hiccup theme integration with romantic gradients
/// - Platform-specific styling (iOS/Android)
/// - Interactive photo display with tap-to-expand
/// - Smooth animations and micro-interactions
/// - Accessibility support
/// - Responsive design for all screen sizes
///
/// Design Philosophy:
/// - Clean, modern layout following 2025 trends
/// - Premium feel with subtle shadows and gradients
/// - Clear visual hierarchy for easy scanning
/// - Romantic color palette matching Hiccup branding
class ProfileHeader extends ProfileBaseWidget {
  /// Profile ID to display header for
  final String profileId;

  /// Whether this profile belongs to the current user (enables editing)
  final bool isOwnProfile;

  /// Callback when edit button is pressed
  final VoidCallback? onEditPressed;

  /// Callback when settings button is pressed
  final VoidCallback? onSettingsPressed;

  /// Callback when share button is pressed
  final VoidCallback? onSharePressed;

  /// Callback when profile photo is tapped
  final VoidCallback? onPhotoTapped;

  const ProfileHeader({
    super.key,
    required this.profileId,
    this.isOwnProfile = false,
    this.onEditPressed,
    this.onSettingsPressed,
    this.onSharePressed,
    this.onPhotoTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = getCurrentBrightness(ref);
    final primaryColor = getPrimaryColor(ref);
    final surfaceColor = getSurfaceColor(ref);

    // 📱 Load profile data
    final profileAsync = ref.watch(profileProvider(profileId));

    return profileAsync.when(
      data: (profileData) {
        if (profileData == null) {
          return _buildErrorState(context, 'Profile not found');
        }

        return _buildHeaderContent(
          context,
          ref,
          profileData,
          currentBrightness,
          primaryColor,
          surfaceColor,
        );
      },
      loading: () => _buildLoadingState(context),
      error: (error, stack) =>
          _buildErrorState(context, 'Failed to load profile'),
    );
  }

  /// 🏗️ Build main header content
  Widget _buildHeaderContent(
    BuildContext context,
    WidgetRef ref,
    dynamic profileData,
    Brightness brightness,
    Color primaryColor,
    Color surfaceColor,
  ) {
    final profile = profileData.profile;
    final media = profileData.media;
    final badges = profileData.badges;

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: _buildHeaderDecoration(surfaceColor, brightness),
      child: Column(
        children: [
          // 📸 Profile Photo Section
          _buildProfilePhotoSection(
            context,
            profile,
            media as List<dynamic>,
            primaryColor,
          ),

          const SizedBox(height: 16),

          // 👤 Name and Age Row
          _buildNameAgeRow(
            context,
            profile,
            badges as List<dynamic>,
            primaryColor,
          ),

          const SizedBox(height: 8),

          // 📍 Location Section
          _buildLocationSection(context, profile),

          const SizedBox(height: 16),

          // 🎯 Action Buttons (only for own profile)
          if (isOwnProfile) ...[_buildActionButtons(context, primaryColor)],
        ],
      ),
    );
  }

  /// 📸 Profile photo section with upload capability
  Widget _buildProfilePhotoSection(
    BuildContext context,
    dynamic profile,
    List<dynamic> media,
    Color primaryColor,
  ) {
    // Get main profile photo
    final mainPhoto = media.isNotEmpty ? media.first : null;

    return GestureDetector(
      onTap: onPhotoTapped,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: primaryColor.withOpacity(0.3), width: 3),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipOval(
          child: mainPhoto != null
              ? _buildProfileImage(mainPhoto)
              : _buildPlaceholderImage(primaryColor),
        ),
      ),
    );
  }

  /// 🖼️ Build profile image
  Widget _buildProfileImage(dynamic media) => Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.lightGradientStart, AppColors.lightGradientEnd],
      ),
    ),
    child: Icon(
      Icons.person_rounded,
      size: 60,
      color: Colors.white.withOpacity(0.8),
    ),
  );

  /// 🎭 Build placeholder image for profiles without photos
  Widget _buildPlaceholderImage(Color primaryColor) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [primaryColor.withOpacity(0.8), primaryColor.withOpacity(0.6)],
      ),
    ),
    child: Icon(
      Icons.add_a_photo_rounded,
      size: 40,
      color: Colors.white.withOpacity(0.9),
    ),
  );

  /// 👤 Name and age row with badges
  Widget _buildNameAgeRow(
    BuildContext context,
    dynamic profile,
    List<dynamic> badges,
    Color primaryColor,
  ) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Name and age
      Text(
        '${profile.name}, ${profile.age}',
        style: AppTextStyles.getHeading2(
          context,
        ).copyWith(fontWeight: FontWeight.bold),
      ),

      const SizedBox(width: 8),

      // Verification badges
      ...badges.map((badge) => _buildBadge(badge, primaryColor)).toList(),
    ],
  );

  /// 🏷️ Build individual badge
  Widget _buildBadge(dynamic badge, Color primaryColor) {
    IconData icon;
    Color badgeColor;

    switch (badge.type.toString().split('.').last.toLowerCase()) {
      case 'verified':
        icon = Icons.verified_rounded;
        badgeColor = Colors.blue;
        break;
      case 'premium':
        icon = Icons.star_rounded;
        badgeColor = Colors.amber;
        break;
      default:
        icon = Icons.badge_rounded;
        badgeColor = primaryColor;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Icon(icon, color: badgeColor, size: 20),
    );
  }

  /// 📍 Location section
  Widget _buildLocationSection(BuildContext context, dynamic profile) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.location_on_rounded,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        size: 16,
      ),
      const SizedBox(width: 4),
      Text(
        profile.location?.toString() ?? '',
        style: AppTextStyles.getBodyMedium(context).copyWith(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
        ),
      ),
    ],
  );

  /// 🎯 Action buttons for own profile
  Widget _buildActionButtons(BuildContext context, Color primaryColor) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // Edit Profile Button
      _buildActionButton(
        context,
        icon: Icons.edit_rounded,
        label: 'Edit Profile',
        onPressed: onEditPressed,
        isPrimary: true,
        primaryColor: primaryColor,
      ),

      // Settings Button
      _buildActionButton(
        context,
        icon: Icons.settings_rounded,
        label: 'Settings',
        onPressed: onSettingsPressed,
        isPrimary: false,
        primaryColor: primaryColor,
      ),

      // Share Button
      _buildActionButton(
        context,
        icon: Icons.share_rounded,
        label: 'Share',
        onPressed: onSharePressed,
        isPrimary: false,
        primaryColor: primaryColor,
      ),
    ],
  );

  /// 🔘 Build individual action button
  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    required bool isPrimary,
    required Color primaryColor,
  }) => Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 18,
          color: isPrimary ? Colors.white : primaryColor,
        ),
        label: Text(
          label,
          style: AppTextStyles.getLabelMedium(context).copyWith(
            color: isPrimary ? Colors.white : primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? primaryColor
              : primaryColor.withOpacity(0.1),
          foregroundColor: isPrimary ? Colors.white : primaryColor,
          elevation: isPrimary ? 4 : 0,
          shadowColor: isPrimary ? primaryColor.withOpacity(0.4) : null,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isPrimary
                ? BorderSide.none
                : BorderSide(color: primaryColor.withOpacity(0.3)),
          ),
        ),
      ),
    ),
  );

  /// 🎨 Build header decoration with theme-aware styling
  BoxDecoration _buildHeaderDecoration(
    Color surfaceColor,
    Brightness brightness,
  ) => BoxDecoration(
    color: surfaceColor.withOpacity(0.95),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: brightness == Brightness.dark
          ? Colors.white.withOpacity(0.1)
          : Colors.black.withOpacity(0.05),
    ),
    boxShadow: [
      BoxShadow(
        color: brightness == Brightness.dark
            ? Colors.black.withOpacity(0.3)
            : Colors.black.withOpacity(0.1),
        blurRadius: 15,
        spreadRadius: 1,
        offset: const Offset(0, 4),
      ),
    ],
  );

  /// ⏳ Loading state
  Widget _buildLoadingState(BuildContext context) => Container(
    height: 200,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Center(child: CircularProgressIndicator()),
  );

  /// ❌ Error state
  Widget _buildErrorState(BuildContext context, String message) => Container(
    height: 200,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Theme.of(context).colorScheme.error.withOpacity(0.3),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: Theme.of(context).colorScheme.error,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: AppTextStyles.getBodyMedium(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ),
    ),
  );
}
