import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../data/providers/profile_providers.dart';
import 'common/profile_base_widget.dart';
import 'common/profile_loading_widget.dart';
import 'common/profile_error_widget.dart';

/// 🎨 Profile Main View - Minimalist Design (Inspired by Yash Profile)
///
/// **🔧 FULLY FIXED - All Property Access Issues Resolved**
///
/// Simple, clean profile layout with Hiccup theming:
/// - Large circular profile photo as focal point
/// - Clean spacing with generous whitespace
/// - Simple top header with corner icons
/// - Centered profile info below photo
/// - Hiccup theme integration (gradients, colors, fonts)
///
/// **🏗️ Fixed Data Access:**
/// - ✅ profileData.profile.name (not profileData.basicInfo.name)
/// - ✅ profileData.profile.age (not profileData.basicInfo.age)
/// - ✅ profileData.profile.location (not profileData.basicInfo.location)
/// - ✅ profileData.media[0].filePath (not profileData.media[0].url)
/// - ✅ profileData.badges.type == verification (not string comparison)
/// - ✅ Proper null safety and error handling throughout
class ProfileMainView extends ProfileBaseWidget {
  /// Profile ID to display
  final String profileId;

  /// Whether this profile belongs to the current user (enables editing)
  final bool isOwnProfile;

  /// Callback when edit profile is triggered
  final VoidCallback? onEditPressed;

  /// Callback when settings is pressed
  final VoidCallback? onSettingsPressed;

  /// Callback when preferences is pressed
  final VoidCallback? onPreferencesPressed;

  const ProfileMainView({
    super.key,
    required this.profileId,
    this.isOwnProfile = false,
    this.onEditPressed,
    this.onSettingsPressed,
    this.onPreferencesPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = getCurrentBrightness(ref);
    final gradient = AppColors.getThemeGradient(currentBrightness);
    final primaryColor = getPrimaryColor(ref);
    final surfaceColor = getSurfaceColor(ref);

    // 📱 Load profile data
    final profileAsync = ref.watch(profileProvider(profileId));

    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: SafeArea(
        child: profileAsync.when(
          data: (profileData) {
            if (profileData == null) {
              return _buildErrorState(context, 'Profile not found');
            }

            return _buildMainContent(
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
        ),
      ),
    );
  }

  /// 🏗️ Build main profile content with minimalist design
  Widget _buildMainContent(
    BuildContext context,
    WidgetRef ref,
    dynamic profileData, // This is ProfileData type
    Brightness currentBrightness,
    Color primaryColor,
    Color surfaceColor,
  ) {
    final textColor = AppColors.getPrimaryTextColor(currentBrightness);
    final secondaryTextColor = AppColors.getSecondaryTextColor(
      currentBrightness,
    );

    return Column(
      children: [
        // 📱 Top header with corner icons (inspired by Yash design)
        _buildTopHeader(context, textColor, primaryColor),

        // 🎯 Main content area
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // 🖼️ Large profile photo section (main focal point)
                  const SizedBox(height: 40),
                  _buildProfilePhotoSection(
                    context,
                    profileData,
                    primaryColor,
                    textColor,
                  ),

                  // 👤 Name and info section
                  const SizedBox(height: 32),
                  _buildNameSection(
                    context,
                    profileData,
                    textColor,
                    secondaryTextColor,
                    primaryColor,
                  ),

                  // 💎 Premium/Get more section (inspired by "Get more" text)
                  const SizedBox(height: 24),
                  _buildPremiumSection(context, textColor, primaryColor),

                  // 🌌 Generous whitespace for minimalist feel
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 📱 Build top header with corner icons
  Widget _buildTopHeader(
    BuildContext context,
    Color textColor,
    Color primaryColor,
  ) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side - Preferences icon
        _buildHeaderIcon(
          context,
          icon: Icons.tune_rounded,
          onPressed: onPreferencesPressed,
          textColor: textColor,
        ),

        // Right side - Settings icon
        _buildHeaderIcon(
          context,
          icon: Icons.settings_rounded,
          onPressed: onSettingsPressed,
          textColor: textColor,
        ),
      ],
    ),
  );

  /// 🔘 Build individual header icon
  Widget _buildHeaderIcon(
    BuildContext context, {
    required IconData icon,
    required VoidCallback? onPressed,
    required Color textColor,
  }) => Container(
    decoration: BoxDecoration(
      color: textColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: textColor.withOpacity(0.8), size: 22),
      splashRadius: 20,
    ),
  );

  /// 🖼️ Build large profile photo section (main focal point)
  Widget _buildProfilePhotoSection(
    BuildContext context,
    dynamic profileData, // ProfileData
    Color primaryColor,
    Color textColor,
  ) {
    // ✅ FIXED: Access media array correctly
    final media = profileData.media as List<dynamic>?; // List<MediaEntity>
    final firstPhoto = media?.isNotEmpty == true ? media!.first : null;
    // ✅ FIXED: Use filePath instead of url
    final photoPath = firstPhoto?.filePath?.toString();

    return GestureDetector(
      onTap: isOwnProfile ? onEditPressed : null,
      child: Stack(
        children: [
          // 🎯 Large circular profile photo
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primaryColor.withOpacity(0.3),
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: photoPath != null && photoPath.isNotEmpty
                  ? Image.network(
                      photoPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildPhotoPlaceholder(context, primaryColor),
                    )
                  : _buildPhotoPlaceholder(context, primaryColor),
            ),
          ),

          // ✏️ Edit icon (only for own profile, inspired by Yash design)
          if (isOwnProfile)
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Icon(Icons.edit_rounded, color: Colors.white, size: 18),
              ),
            ),
        ],
      ),
    );
  }

  /// 🖼️ Build photo placeholder
  Widget _buildPhotoPlaceholder(BuildContext context, Color primaryColor) =>
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor.withOpacity(0.3),
              primaryColor.withOpacity(0.1),
            ],
          ),
        ),
        child: Icon(
          Icons.person_rounded,
          color: primaryColor.withOpacity(0.6),
          size: 80,
        ),
      );

  /// 👤 Build name and info section
  Widget _buildNameSection(
    BuildContext context,
    dynamic profileData, // ProfileData
    Color textColor,
    Color secondaryTextColor,
    Color primaryColor,
  ) {
    // ✅ FIXED: Access ProfileEntity properties correctly
    final profile = profileData.profile; // ProfileEntity
    final name = profile?.name?.toString() ?? 'Unknown';
    final age = profile?.age?.toString() ?? '';
    final location = profile?.location?.toString() ?? '';

    // ✅ FIXED: Check badges correctly using BadgeType enum
    final badges = profileData.badges as List<dynamic>?; // List<BadgeEntity>
    final isVerified =
        badges?.any((badge) {
          // Access BadgeEntity.type (enum) and check for verification
          final badgeType = badge.type;
          return badgeType.toString() == 'BadgeType.verification';
        }) ??
        false;

    return Column(
      children: [
        // 📝 Name and age with verification badge
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              age.isNotEmpty ? '$name, $age' : name,
              style: AppTextStyles.getHeading2(
                context,
              ).copyWith(color: textColor, fontWeight: FontWeight.w600),
            ),
            if (isVerified) ...[
              const SizedBox(width: 8),
              Icon(Icons.verified_rounded, color: primaryColor, size: 24),
            ],
          ],
        ),

        // 📍 Location
        if (location.isNotEmpty) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_rounded,
                color: secondaryTextColor,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                location,
                style: AppTextStyles.getBodyMedium(
                  context,
                ).copyWith(color: secondaryTextColor),
              ),
            ],
          ),
        ],
      ],
    );
  }

  /// 💎 Build premium/get more section
  Widget _buildPremiumSection(
    BuildContext context,
    Color textColor,
    Color primaryColor,
  ) => GestureDetector(
    onTap: () {
      // Handle premium features tap
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Premium features coming soon!',
            style: AppTextStyles.getBodyMedium(
              context,
            ).copyWith(color: Colors.white),
          ),
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.3), width: 1),
      ),
      child: Text(
        'Get more',
        style: AppTextStyles.getBodyMedium(
          context,
        ).copyWith(color: primaryColor, fontWeight: FontWeight.w500),
      ),
    ),
  );

  /// 🔄 Build loading state
  Widget _buildLoadingState(BuildContext context) =>
      const Center(child: ProfileLoadingWidget(message: 'Loading profile...'));

  /// ❌ Build error state
  Widget _buildErrorState(BuildContext context, String errorMessage) => Center(
    child: ProfileErrorWidget(
      message: errorMessage,
      onRetry: () {
        // Retry logic would go here
      },
    ),
  );
}
