import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../../../shared/services/theme_provider.dart';

/// 📱 Profile App Bar - Platform-Specific Navigation (2025)
///
/// This widget provides platform-optimized app bar implementations:
/// - iOS: Uses CupertinoNavigationBar with native feel
/// - Android: Uses Material AppBar with theme integration
///
/// Features:
/// - Platform-specific styling and behavior
/// - Theme-aware colors and typography
/// - Context-sensitive actions (edit, settings, share)
/// - Smooth animations for mode transitions
/// - Accessibility support
///
/// Design follows 2025 best practices:
/// - Clean separation of platform concerns
/// - Consistent Hiccup branding across platforms
/// - Modern interaction patterns
/// - Performance-optimized rendering
class ProfileAppBar extends ConsumerWidget implements PreferredSizeWidget {
  /// Whether this profile belongs to the current user
  final bool isOwnProfile;

  /// Whether the profile is in edit mode
  final bool isEditMode;

  /// Callback when edit button is tapped
  final VoidCallback? onEditToggle;

  /// Callback when settings button is tapped
  final VoidCallback? onSettingsTap;

  /// Callback when share button is tapped
  final VoidCallback? onShareTap;

  /// Custom title override
  final String? customTitle;

  const ProfileAppBar({
    super.key,
    required this.isOwnProfile,
    required this.isEditMode,
    this.onEditToggle,
    this.onSettingsTap,
    this.onShareTap,
    this.customTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);

    // 📱 Platform-specific implementation
    if (Platform.isIOS) {
      return _buildIOSAppBar(context, currentBrightness);
    } else {
      return _buildAndroidAppBar(context, currentBrightness);
    }
  }

  /// 🍎 Build iOS-style app bar using Cupertino design
  Widget _buildIOSAppBar(BuildContext context, Brightness brightness) =>
      CupertinoNavigationBar(
        // 🎨 Theme-aware styling
        backgroundColor: AppColors.getSurfaceColor(
          brightness,
        ).withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: AppColors.getPrimaryColor(brightness).withOpacity(0.1),
            width: 0.5,
          ),
        ),

        // 🏷️ Title
        middle: Text(
          _getTitle(),
          style: AppTextStyles.getHeading4(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.getPrimaryTextColor(brightness),
          ),
        ),

        // ← Back navigation (if not root)
        leading: Navigator.canPop(context)
            ? CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  CupertinoIcons.back,
                  color: AppColors.getPrimaryColor(brightness),
                  size: 24,
                ),
              )
            : null,

        // → Action buttons
        trailing: _buildIOSActions(context, brightness),
      );

  /// 🤖 Build Android-style app bar using Material design
  Widget _buildAndroidAppBar(BuildContext context, Brightness brightness) =>
      AppBar(
        // 🎨 Theme-aware styling
        backgroundColor: AppColors.getSurfaceColor(
          brightness,
        ).withOpacity(0.95),
        elevation: 0,
        scrolledUnderElevation: 2,
        surfaceTintColor: AppColors.getPrimaryColor(brightness),

        // 🏷️ Title
        title: Text(
          _getTitle(),
          style: AppTextStyles.getHeading4(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.getPrimaryTextColor(brightness),
          ),
        ),

        // ← Back navigation icon
        leading: Navigator.canPop(context)
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.getPrimaryColor(brightness),
                ),
              )
            : null,

        // → Action buttons
        actions: _buildAndroidActions(context, brightness),
      );

  /// 🍎 Build iOS-style action buttons
  Widget _buildIOSActions(BuildContext context, Brightness brightness) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Edit/Done button (own profile only)
      if (isOwnProfile)
        CupertinoButton(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          onPressed: onEditToggle,
          child: Text(
            isEditMode ? 'Done' : 'Edit',
            style: AppTextStyles.getLabelLarge(context).copyWith(
              color: AppColors.getPrimaryColor(brightness),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

      // Settings button (own profile only)
      if (isOwnProfile && !isEditMode)
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onSettingsTap,
          child: Icon(
            CupertinoIcons.settings,
            color: AppColors.getPrimaryColor(brightness),
            size: 22,
          ),
        ),

      // Share button
      if (!isEditMode)
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onShareTap,
          child: Icon(
            CupertinoIcons.share,
            color: AppColors.getPrimaryColor(brightness),
            size: 22,
          ),
        ),
    ],
  );

  /// 🤖 Build Android-style action buttons
  List<Widget> _buildAndroidActions(
    BuildContext context,
    Brightness brightness,
  ) {
    final actions = <Widget>[];

    // Edit/Save button (own profile only)
    if (isOwnProfile) {
      actions.add(
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: IconButton(
            key: ValueKey(isEditMode),
            onPressed: onEditToggle,
            icon: Icon(
              isEditMode ? Icons.check_rounded : Icons.edit_rounded,
              color: AppColors.getPrimaryColor(brightness),
            ),
            tooltip: isEditMode ? 'Save Changes' : 'Edit Profile',
          ),
        ),
      );
    }

    // More options menu
    if (!isEditMode) {
      actions.add(
        PopupMenuButton<String>(
          icon: Icon(
            Icons.more_vert_rounded,
            color: AppColors.getPrimaryColor(brightness),
          ),
          onSelected: _handleMenuAction,
          itemBuilder: (context) => [
            // Settings (own profile only)
            if (isOwnProfile)
              PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_rounded,
                      color: AppColors.getPrimaryTextColor(brightness),
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Settings',
                      style: AppTextStyles.getBodyMedium(context),
                    ),
                  ],
                ),
              ),

            // Share
            PopupMenuItem(
              value: 'share',
              child: Row(
                children: [
                  Icon(
                    Icons.share_rounded,
                    color: AppColors.getPrimaryTextColor(brightness),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Share Profile',
                    style: AppTextStyles.getBodyMedium(context),
                  ),
                ],
              ),
            ),

            // Report (other's profile only)
            if (!isOwnProfile)
              PopupMenuItem(
                value: 'report',
                child: Row(
                  children: [
                    Icon(
                      Icons.flag_rounded,
                      color: Colors.red.shade600,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Report',
                      style: AppTextStyles.getBodyMedium(
                        context,
                      ).copyWith(color: Colors.red.shade600),
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    }

    return actions;
  }

  /// 🎯 Handle menu action selection
  void _handleMenuAction(String action) {
    switch (action) {
      case 'settings':
        onSettingsTap?.call();
        break;
      case 'share':
        onShareTap?.call();
        break;
      case 'report':
        // TODO: Implement report functionality
        break;
    }
  }

  /// 🏷️ Get appropriate title text
  String _getTitle() {
    if (customTitle != null) return customTitle!;

    if (isEditMode) {
      return 'Edit Profile';
    } else if (isOwnProfile) {
      return 'My Profile';
    } else {
      return 'Profile';
    }
  }

  @override
  Size get preferredSize {
    // 📱 Platform-specific heights
    if (Platform.isIOS) {
      return const Size.fromHeight(44.0); // CupertinoNavigationBar height
    } else {
      return const Size.fromHeight(56.0); // Material AppBar height
    }
  }
}

/// 🎨 App Bar Theme Extensions
///
/// Helper extensions for consistent theming across platforms
extension ProfileAppBarTheme on ProfileAppBar {
  /// Get platform-appropriate text color
  static Color getTextColor(Brightness brightness) =>
      AppColors.getPrimaryTextColor(brightness);

  /// Get platform-appropriate accent color
  static Color getAccentColor(Brightness brightness) =>
      AppColors.getPrimaryColor(brightness);

  /// Get platform-appropriate background color
  static Color getBackgroundColor(Brightness brightness) =>
      AppColors.getSurfaceColor(brightness).withOpacity(0.95);
}
