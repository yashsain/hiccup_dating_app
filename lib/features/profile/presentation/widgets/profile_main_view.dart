import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../../../shared/services/theme_provider.dart';
import '../../data/providers/profile_providers.dart';
import 'common/profile_error_widget.dart';
import 'common/profile_loading_widget.dart';

/// 🎨 Profile Main View - Completely Transparent Content (2025)
///
/// **✅ UPDATED: Added Proper Edit Symbol on Profile Circle**
///
/// This widget is now completely transparent and focuses purely on content:
/// - ✅ NO background decorations (gradient shows through from ProfileScreen)
/// - ✅ Large circular profile photo as focal point
/// - ✅ Professional edit symbol for own profiles
/// - ✅ Name, age, and verification badges
/// - ✅ Location information
/// - ✅ "Get more" premium section
/// - ✅ Clean spacing with generous whitespace
/// - ✅ Content floats on continuous gradient
///
/// **🔄 Key Changes:**
/// - ✅ ADDED: Professional edit icon on profile circle
/// - ✅ IMPROVED: Better edit symbol positioning and styling
/// - ✅ ENHANCED: Glass effect for edit button
class ProfileMainView extends ConsumerWidget {
  /// Profile ID to display
  final String profileId;

  /// Whether this profile belongs to the current user
  final bool isOwnProfile;

  /// Callback when edit button is pressed (only for own profile)
  final VoidCallback? onEditPressed;

  const ProfileMainView({
    super.key,
    required this.profileId,
    this.isOwnProfile = false,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get theme information (for text colors only)
    final currentBrightness = ref.watch(currentBrightnessProvider);
    final primaryColor = AppColors.getPrimaryColor(currentBrightness);
    final textColor = AppColors.getPrimaryTextColor(currentBrightness);
    final secondaryTextColor = AppColors.getSecondaryTextColor(
      currentBrightness,
    );

    // 📱 Load profile data
    final profileAsync = ref.watch(profileProvider(profileId));

    return profileAsync.when(
      data: (profileData) {
        if (profileData == null) {
          return ProfileErrorWidget(
            message: 'Profile not found',
            onRetry: () => ref.refresh(profileProvider(profileId)),
          );
        }

        return _buildMainContent(
          context,
          profileData,
          primaryColor,
          textColor,
          secondaryTextColor,
        );
      },
      loading: () => const ProfileLoadingWidget(),
      error: (error, stack) => ProfileErrorWidget(
        message: 'Failed to load profile',
        onRetry: () => ref.refresh(profileProvider(profileId)),
      ),
    );
  }

  /// 🏗️ Build main profile content (COMPLETELY TRANSPARENT)
  Widget _buildMainContent(
    BuildContext context,
    dynamic profileData,
    Color primaryColor,
    Color textColor,
    Color secondaryTextColor,
  ) => SafeArea(
    // ✅ App bar is transparent, so we need top safe area
    top: true,
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🌌 Top spacing (for app bar + some breathing room)
            const SizedBox(height: 30),
            // 🖼️ Large profile photo (main focal point)
            _buildProfilePhotoSection(
              context,
              profileData,
              primaryColor,
              textColor,
            ),

            const SizedBox(height: 24),

            // 👤 Name, age, and verification badges
            _buildNameAgeSection(context, profileData, textColor, primaryColor),

            const SizedBox(height: 12),

            // 📍 Location information
            _buildLocationSection(context, profileData, secondaryTextColor),

            const SizedBox(height: 32),

            // 💎 Premium/Get more section
            _buildPremiumSection(context, textColor, primaryColor),

            // 🌌 Generous bottom whitespace
            const SizedBox(height: 120),
          ],
        ),
      ),
    ),
  );

  /// 🖼️ Build large profile photo section (main focal point)
  ///
  /// 📐 PROFILE CIRCLE PARAMETERS (to adjust size/radius):
  /// - Container width: 180 (change this to adjust overall size)
  /// - Container height: 180 (change this to adjust overall size)
  /// - Border width: 4 (change this to adjust border thickness)
  /// - Border color opacity: 0.3 (change this to adjust border visibility)
  /// - Shadow blur radius: 24 (change this to adjust shadow blur)
  /// - Shadow spread radius: 4 (change this to adjust shadow spread)
  /// - Shadow offset: Offset(0, 8) (change this to adjust shadow position)
  Widget _buildProfilePhotoSection(
    BuildContext context,
    dynamic profileData,
    Color primaryColor,
    Color textColor,
  ) {
    // Access media array correctly
    final media = profileData.media as List<dynamic>?;
    final firstPhoto = media?.isNotEmpty == true ? media!.first : null;
    final photoPath = firstPhoto?.filePath?.toString();

    return GestureDetector(
      onTap: isOwnProfile ? onEditPressed : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🖼️ Main profile photo container
          Container(
            width: 100, // ← ADJUST THIS: Profile circle width
            height: 100, // ← ADJUST THIS: Profile circle height
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primaryColor.withOpacity(
                  1,
                ), // ← ADJUST THIS: Border opacity
                width: 3, // ← ADJUST THIS: Border thickness
              ),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  blurRadius: 24, // ← ADJUST THIS: Shadow blur
                  spreadRadius: 4, // ← ADJUST THIS: Shadow spread
                  offset: const Offset(0, 8), // ← ADJUST THIS: Shadow position
                ),
              ],
            ),
            child: ClipOval(
              child: firstPhoto != null
                  ? _buildProfileImage(firstPhoto, primaryColor)
                  : _buildPlaceholderImage(primaryColor, textColor),
            ),
          ),

          // ✏️ Edit button (NEW - Professional Edit Symbol)
          if (isOwnProfile)
            Positioned(
              bottom: 8,
              right: 8,
              child: _buildEditButton(context, primaryColor, textColor),
            ),
        ],
      ),
    );
  }

  /// ✏️ Build professional edit button (NEW)
  Widget _buildEditButton(
    BuildContext context,
    Color primaryColor,
    Color textColor,
  ) => GestureDetector(
    onTap: onEditPressed,
    child: Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: primaryColor.withOpacity(0.2), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
          // Additional soft shadow for depth
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        Icons.edit_rounded, // Professional edit icon
        size: 20,
        color: primaryColor,
      ),
    ),
  );

  /// 🖼️ Build actual profile image
  Widget _buildProfileImage(dynamic media, Color primaryColor) {
    return Container(
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
        size: 80,
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }

  /// 🎭 Build placeholder for profiles without photos
  Widget _buildPlaceholderImage(Color primaryColor, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryColor.withOpacity(0.8),
            primaryColor.withOpacity(0.6),
          ],
        ),
      ),
      child: Icon(
        Icons.person_rounded,
        size: 60,
        color: Colors.white.withOpacity(0.6),
      ),
    );
  }

  /// 👤 Build name, age, and verification badges
  Widget _buildNameAgeSection(
    BuildContext context,
    dynamic profileData,
    Color textColor,
    Color primaryColor,
  ) {
    final profile = profileData.profile;
    final badges = profileData.badges as List<dynamic>?;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Name and age
        Text(
          '${profile.name}, ${profile.age}',
          style: AppTextStyles.getHeading2(
            context,
          ).copyWith(fontWeight: FontWeight.bold, color: textColor),
        ),

        // Verification badges
        if (badges?.isNotEmpty == true) ...[
          const SizedBox(width: 8),
          ...badges!.map((badge) => _buildBadge(badge, primaryColor)).toList(),
        ],
      ],
    );
  }

  /// 🏷️ Build individual verification badge
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
      padding: const EdgeInsets.only(left: 6),
      child: Icon(icon, color: badgeColor, size: 22),
    );
  }

  /// 📍 Build location section
  Widget _buildLocationSection(
    BuildContext context,
    dynamic profileData,
    Color secondaryTextColor,
  ) {
    final profile = profileData.profile;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_on_rounded, color: secondaryTextColor, size: 18),
        const SizedBox(width: 6),
        Text(
          profile.location?.toString() ?? 'Location not specified',
          style: AppTextStyles.getBodyLarge(
            context,
          ).copyWith(color: secondaryTextColor),
        ),
      ],
    );
  }

  /// 💎 Build premium/get more section (TRANSPARENT BACKGROUND)
  Widget _buildPremiumSection(
    BuildContext context,
    Color textColor,
    Color primaryColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        // ✅ UPDATED: Very subtle background that doesn't interfere with gradient
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        // ✅ Subtle backdrop blur for glass effect
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star_rounded, color: primaryColor, size: 20),
          const SizedBox(width: 8),
          Text(
            'Get more',
            style: AppTextStyles.getLabelLarge(
              context,
            ).copyWith(color: primaryColor, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// 📋 PROFILE CIRCLE CUSTOMIZATION GUIDE
// ============================================================================

/// **🎯 TO ADJUST PROFILE CIRCLE SIZE & APPEARANCE:**
/// 
/// **📐 Size Parameters (in _buildProfilePhotoSection):**
/// - `width: 180` ← Change this to make circle larger/smaller
/// - `height: 180` ← Keep same as width for perfect circle
/// 
/// **🖼️ Border Parameters:**
/// - `width: 4` ← Border thickness (1-8 recommended)
/// - `color: primaryColor.withOpacity(0.3)` ← Border visibility (0.1-0.5)
/// 
/// **🌟 Shadow Parameters:**
/// - `blurRadius: 24` ← Shadow softness (8-40 recommended)
/// - `spreadRadius: 4` ← Shadow size (0-8 recommended)
/// - `offset: Offset(0, 8)` ← Shadow position (x, y)
/// 
/// **✏️ Edit Button Position:**
/// - `bottom: 8` ← Distance from bottom of circle
/// - `right: 8` ← Distance from right of circle
/// - Edit button size: 44x44 (professional standard)
/// 
/// **🎨 EXAMPLE ADJUSTMENTS:**
/// ```dart
/// // Larger circle (200px):
/// width: 200, height: 200
/// 
/// // Thicker border:
/// width: 6
/// 
/// // More subtle shadow:
/// blurRadius: 16, spreadRadius: 2
/// 
/// // Edit button closer to edge:
/// bottom: 4, right: 4
/// ```