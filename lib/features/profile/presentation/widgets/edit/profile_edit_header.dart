import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../../../shared/services/theme_provider.dart';
import '../../../data/providers/profile_providers.dart';

/// 📱 Profile Edit Header - Clean Header with Cancel/Name/Done (2025)
///
/// This header component matches the reference design exactly:
/// - Cancel button on the left (discards changes)
/// - User's first name in the center
/// - Done button on the right (saves changes)
/// - Transparent background floating on gradient
/// - Proper typography and spacing
///
/// Key Features:
/// - Glass morphism effect with subtle background
/// - Automatic user name extraction from profile data
/// - Theme-aware text colors
/// - Proper touch targets for accessibility
/// - Smooth animations and interactions
///
/// Design Philosophy:
/// - Matches reference images exactly
/// - Clean, minimal design
/// - Professional typography
/// - Consistent with Hiccup branding
class ProfileEditHeader extends ConsumerWidget implements PreferredSizeWidget {
  /// Profile ID being edited
  final String profileId;

  /// Callback when cancel button is pressed
  final VoidCallback onCancel;

  /// Callback when done button is pressed
  final VoidCallback onDone;

  const ProfileEditHeader({
    super.key,
    required this.profileId,
    required this.onCancel,
    required this.onDone,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);
    final textColor = AppColors.getPrimaryTextColor(currentBrightness);
    final primaryColor = AppColors.getPrimaryColor(currentBrightness);

    // 📱 Load profile data to get user's name
    final profileAsync = ref.watch(profileProvider(profileId));

    return Container(
      // 🌟 Glass morphism background
      decoration: BoxDecoration(
        // Subtle background for header separation
        color: Colors.white.withOpacity(0.05),
        // Bottom border for subtle separation
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.2), width: 0.5),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Container(
          height: kToolbarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: profileAsync.when(
            data: (profileData) {
              // Extract user's first name
              final fullName = profileData?.profile?.name?.toString() ?? 'User';
              final firstName = _extractFirstName(fullName);

              return _buildHeaderContent(
                context,
                firstName,
                textColor,
                primaryColor,
              );
            },
            loading: () => _buildHeaderContent(
              context,
              'User', // Fallback during loading
              textColor,
              primaryColor,
            ),
            error: (error, stack) => _buildHeaderContent(
              context,
              'User', // Fallback on error
              textColor,
              primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  /// 🏗️ Build main header content
  Widget _buildHeaderContent(
    BuildContext context,
    String firstName,
    Color textColor,
    Color primaryColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 🚫 Cancel Button (Left)
        _buildCancelButton(context, textColor, primaryColor),

        // 👤 User Name (Center)
        _buildUserName(context, firstName, textColor),

        // ✅ Done Button (Right)
        _buildDoneButton(context, textColor, primaryColor),
      ],
    );
  }

  /// 🚫 Build Cancel button
  Widget _buildCancelButton(
    BuildContext context,
    Color textColor,
    Color primaryColor,
  ) {
    return TextButton(
      onPressed: onCancel,
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minimumSize: const Size(64, 36),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Cancel',
        style: AppTextStyles.getLabelLarge(
          context,
        ).copyWith(color: primaryColor, fontWeight: FontWeight.w500),
      ),
    );
  }

  /// 👤 Build User name in center
  Widget _buildUserName(
    BuildContext context,
    String firstName,
    Color textColor,
  ) {
    return Expanded(
      child: Text(
        firstName,
        style: AppTextStyles.getBodySmall(
          context,
        ).copyWith(color: textColor, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// ✅ Build Done button
  Widget _buildDoneButton(
    BuildContext context,
    Color textColor,
    Color primaryColor,
  ) {
    return TextButton(
      onPressed: onDone,
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minimumSize: const Size(64, 36),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Done',
        style: AppTextStyles.getLabelLarge(context).copyWith(
          color: primaryColor,
          fontWeight: FontWeight.w600, // Slightly bolder for primary action
        ),
      ),
    );
  }

  /// 🔤 Extract first name from full name
  String _extractFirstName(String fullName) {
    if (fullName.isEmpty) return 'User';

    // Split by space and take first part
    final parts = fullName.trim().split(' ');
    return parts.isNotEmpty ? parts.first : 'User';
  }
}
