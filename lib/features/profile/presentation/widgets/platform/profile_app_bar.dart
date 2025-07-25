import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../../../shared/services/theme_provider.dart';

/// 📱 Profile App Bar - Transparent Header with Brand + Glass Icons (2025)
///
/// **🎨 UPDATED: Added Hiccup Brand Logo**
///
/// Features:
/// - ✅ Completely transparent background (gradient shows through)
/// - ✅ "hiccup" brand logo (top-left)
/// - ✅ Top-right icons: Preferences → Settings
/// - ✅ iOS 26 liquid glass effect on icon backgrounds
/// - ✅ Platform-consistent appearance
/// - ✅ Perfect integration with ProfileMainView gradient
///
/// **🔄 Latest Changes:**
/// - ✅ Added leading "hiccup" brand text
/// - ✅ Maintained glass icon design
/// - ✅ Perfect spacing and alignment
class ProfileAppBar extends ConsumerWidget implements PreferredSizeWidget {
  /// Whether this profile belongs to the current user
  final bool isOwnProfile;

  /// Whether the profile is in edit mode
  final bool isEditMode;

  /// Callback when preferences button is tapped
  final VoidCallback? onPreferencesTap;

  /// Callback when settings button is tapped
  final VoidCallback? onSettingsTap;

  /// Custom height override
  final double? customHeight;

  const ProfileAppBar({
    super.key,
    required this.isOwnProfile,
    required this.isEditMode,
    this.onPreferencesTap,
    this.onSettingsTap,
    this.customHeight,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);

    // 📱 Platform-specific implementation with transparency
    if (Platform.isIOS) {
      return _buildIOSAppBar(context, currentBrightness);
    } else {
      return _buildAndroidAppBar(context, currentBrightness);
    }
  }

  /// 🍎 Build iOS-style transparent app bar
  Widget _buildIOSAppBar(BuildContext context, Brightness brightness) {
    return CupertinoNavigationBar(
      // 🎨 Completely transparent background
      backgroundColor: Colors.transparent,
      border: null, // Remove any borders
      padding: EdgeInsetsDirectional.zero,

      // 🚫 No title/middle widget
      middle: null,

      // ← Hiccup Brand Logo (leading)
      leading: _buildBrandLogo(context, brightness),
      automaticallyImplyLeading: false,

      // → Trailing actions with glass icons
      trailing: _buildTrailingActions(context, brightness),
    );
  }

  /// 🤖 Build Android-style transparent app bar
  Widget _buildAndroidAppBar(BuildContext context, Brightness brightness) {
    return AppBar(
      // 🎨 Completely transparent background
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,

      // 🚫 No title
      title: null,
      centerTitle: false,
      titleSpacing: 0,

      // ← Hiccup Brand Logo (leading)
      leading: _buildBrandLogo(context, brightness),
      automaticallyImplyLeading: false,

      // → Actions with glass icons
      actions: [_buildTrailingActions(context, brightness)],
    );
  }

  /// 🏷️ Build Hiccup brand logo (NEW)
  Widget _buildBrandLogo(BuildContext context, Brightness brightness) {
    final textColor = AppColors.getPrimaryTextColor(brightness);

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'hiccup',
          style: AppTextStyles.getHeading4(context).copyWith(
            fontWeight: FontWeight.bold,
            color: textColor.withOpacity(0.9),
            letterSpacing: -0.5, // Tight letter spacing for modern look
          ),
        ),
      ),
    );
  }

  /// 🎯 Build trailing actions (preferences + settings icons)
  Widget _buildTrailingActions(BuildContext context, Brightness brightness) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🎛️ Preferences Icon (first)
          _buildGlassIcon(
            context: context,
            icon: Icons.tune_rounded,
            onPressed: onPreferencesTap,
            brightness: brightness,
          ),

          const SizedBox(width: 12), // Spacing between icons
          // ⚙️ Settings Icon (second)
          _buildGlassIcon(
            context: context,
            icon: Icons.settings_rounded,
            onPressed: onSettingsTap,
            brightness: brightness,
          ),
        ],
      ),
    );
  }

  /// 🌟 Build glass morphism icon button (iOS 26 style)
  Widget _buildGlassIcon({
    required BuildContext context,
    required IconData icon,
    required VoidCallback? onPressed,
    required Brightness brightness,
  }) {
    // 🎨 Get theme colors
    final primaryColor = AppColors.getPrimaryColor(brightness);
    final textColor = AppColors.getPrimaryTextColor(brightness);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // 🌟 iOS 26 Liquid Glass Effect
          color: textColor.withOpacity(0.08), // Very subtle base
          border: Border.all(
            color: textColor.withOpacity(0.12), // Subtle border
            width: 0.5,
          ),
          boxShadow: [
            // Subtle shadow for depth
            BoxShadow(
              color: primaryColor.withOpacity(0.06),
              blurRadius: 8,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Glass blur
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // Additional glass layer
                color: Colors.white.withOpacity(
                  brightness == Brightness.light ? 0.15 : 0.05,
                ),
              ),
              child: Icon(icon, size: 20, color: textColor.withOpacity(0.85)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    // 📱 Platform-specific heights (or custom height)
    if (customHeight != null) {
      return Size.fromHeight(customHeight!);
    }

    if (Platform.isIOS) {
      return const Size.fromHeight(44.0); // CupertinoNavigationBar height
    } else {
      return const Size.fromHeight(56.0); // Material AppBar height
    }
  }
}

/// 🎨 Glass Icon Theme Extensions
extension GlassIconTheme on ProfileAppBar {
  /// Get glass effect opacity based on theme
  static double getGlassOpacity(Brightness brightness) {
    return brightness == Brightness.light ? 0.15 : 0.08;
  }

  /// Get border opacity for glass effect
  static double getBorderOpacity(Brightness brightness) {
    return brightness == Brightness.light ? 0.2 : 0.12;
  }

  /// Get icon color with proper opacity
  static Color getIconColor(Brightness brightness) {
    final baseColor = AppColors.getPrimaryTextColor(brightness);
    return baseColor.withOpacity(0.85);
  }
}
