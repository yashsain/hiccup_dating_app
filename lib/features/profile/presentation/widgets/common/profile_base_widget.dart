import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_constants.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../../../shared/services/theme_provider.dart';

/// 🏗️ Profile Base Widget - Foundation for All Profile Components (2025)
///
/// ✅ FIXED CONTEXT ISSUES:
/// - Removed context usage from property getters
/// - All methods now properly accept BuildContext parameters
/// - Clean separation of concerns
/// - Type-safe theme access
///
/// This abstract base class provides common functionality for all profile widgets:
/// - Consistent theme integration
/// - Common styling methods
/// - Responsive design helpers
/// - Animation utilities
/// - Platform-specific adjustments
abstract class ProfileBaseWidget extends ConsumerWidget {
  const ProfileBaseWidget({super.key});

  /// 🎨 Get current theme brightness
  Brightness getCurrentBrightness(WidgetRef ref) {
    return ref.watch(currentBrightnessProvider);
  }

  /// 🎨 Get primary color for current theme
  Color getPrimaryColor(WidgetRef ref) {
    final brightness = getCurrentBrightness(ref);
    return AppColors.getPrimaryColor(brightness);
  }

  /// 🎨 Get secondary color for current theme
  Color getSecondaryColor(WidgetRef ref) {
    final brightness = getCurrentBrightness(ref);
    return AppColors.getSecondaryColor(brightness);
  }

  /// 🎨 Get surface color for current theme
  Color getSurfaceColor(WidgetRef ref) {
    final brightness = getCurrentBrightness(ref);
    return AppColors.getSurfaceColor(brightness);
  }

  /// 🎨 Get background color for current theme
  Color getBackgroundColor(WidgetRef ref) {
    final brightness = getCurrentBrightness(ref);
    return AppColors.getBackgroundColor(brightness);
  }

  /// 🎨 Get primary text color for current theme
  Color getPrimaryTextColor(WidgetRef ref) {
    final brightness = getCurrentBrightness(ref);
    return AppColors.getPrimaryTextColor(brightness);
  }

  /// 🎨 Get secondary text color for current theme
  Color getSecondaryTextColor(WidgetRef ref) {
    final brightness = getCurrentBrightness(ref);
    return AppColors.getSecondaryTextColor(brightness);
  }

  /// 🎨 Get theme gradient
  LinearGradient getThemeGradient(WidgetRef ref) {
    final brightness = getCurrentBrightness(ref);
    return AppColors.getThemeGradient(brightness);
  }

  /// ✍️ Get heading text styles with theme colors
  TextStyle getHeading1Style(BuildContext context) =>
      AppTextStyles.getHeading1(context);

  TextStyle getHeading2Style(BuildContext context) =>
      AppTextStyles.getHeading2(context);

  TextStyle getHeading3Style(BuildContext context) =>
      AppTextStyles.getHeading3(context);

  TextStyle getHeading4Style(BuildContext context) =>
      AppTextStyles.getHeading4(context);

  /// ✍️ Get body text styles with theme colors
  TextStyle getBodyLargeStyle(BuildContext context) =>
      AppTextStyles.getBodyLarge(context);

  TextStyle getBodyMediumStyle(BuildContext context) =>
      AppTextStyles.getBodyMedium(context);

  TextStyle getBodySmallStyle(BuildContext context) =>
      AppTextStyles.getBodySmall(context);

  /// ✍️ Get label text styles with theme colors
  TextStyle getLabelLargeStyle(BuildContext context) =>
      AppTextStyles.getLabelLarge(context);

  TextStyle getLabelMediumStyle(BuildContext context) =>
      AppTextStyles.getLabelMedium(context);

  TextStyle getLabelSmallStyle(BuildContext context) =>
      AppTextStyles.getLabelSmall(context);

  /// ✍️ Get caption text style with theme colors
  TextStyle getCaptionStyle(BuildContext context) =>
      AppTextStyles.getCaption(context);

  /// 📱 Get responsive padding based on screen size
  EdgeInsets getResponsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > AppConstants.tabletBreakpoint) {
      return const EdgeInsets.all(32.0); // Tablet/Desktop
    } else if (screenWidth > AppConstants.mobileBreakpoint) {
      return const EdgeInsets.all(24.0); // Large mobile
    } else {
      return const EdgeInsets.all(16.0); // Mobile
    }
  }

  /// 📱 Get responsive spacing based on screen size
  double getResponsiveSpacing(BuildContext context, {double factor = 1.0}) {
    final screenWidth = MediaQuery.of(context).size.width;

    double baseSpacing;
    if (screenWidth > AppConstants.tabletBreakpoint) {
      baseSpacing = 24.0; // Tablet/Desktop
    } else if (screenWidth > AppConstants.mobileBreakpoint) {
      baseSpacing = 20.0; // Large mobile
    } else {
      baseSpacing = 16.0; // Mobile
    }

    return baseSpacing * factor;
  }

  /// 🎨 Get card decoration with theme-aware styling
  BoxDecoration getCardDecoration(
    WidgetRef ref, {
    double? borderRadius,
    Color? borderColor,
    List<BoxShadow>? customShadows,
  }) {
    final surfaceColor = getSurfaceColor(ref);
    final primaryColor = getPrimaryColor(ref);

    return BoxDecoration(
      color: surfaceColor,
      borderRadius: BorderRadius.circular(
        borderRadius ?? AppConstants.borderRadius,
      ),
      border: Border.all(
        color: borderColor ?? primaryColor.withOpacity(0.1),
        width: 1,
      ),
      boxShadow:
          customShadows ??
          [
            BoxShadow(
              color: primaryColor.withOpacity(0.05),
              blurRadius: AppConstants.elevationLow * 2,
              offset: const Offset(0, 2),
            ),
          ],
    );
  }

  /// 🎨 Get elevated card decoration
  BoxDecoration getElevatedCardDecoration(
    WidgetRef ref, {
    double? borderRadius,
    double elevation = AppConstants.elevationMedium,
  }) {
    final surfaceColor = getSurfaceColor(ref);
    final primaryColor = getPrimaryColor(ref);

    return BoxDecoration(
      color: surfaceColor,
      borderRadius: BorderRadius.circular(
        borderRadius ?? AppConstants.borderRadius,
      ),
      boxShadow: [
        BoxShadow(
          color: primaryColor.withOpacity(0.1),
          blurRadius: elevation * 2,
          offset: Offset(0, elevation / 2),
        ),
      ],
    );
  }

  /// 🎯 Get primary button style
  ButtonStyle getPrimaryButtonStyle(
    WidgetRef ref, {
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
  }) {
    final primaryColor = getPrimaryColor(ref);

    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? primaryColor,
      foregroundColor: foregroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppConstants.borderRadius,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      elevation: AppConstants.elevationLow,
    );
  }

  /// 🎯 Get secondary button style
  ButtonStyle getSecondaryButtonStyle(
    WidgetRef ref, {
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
  }) {
    final surfaceColor = getSurfaceColor(ref);
    final primaryColor = getPrimaryColor(ref);

    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? surfaceColor,
      foregroundColor: foregroundColor ?? primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppConstants.borderRadius,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      elevation: AppConstants.elevationLow / 2,
    );
  }

  /// 🎯 Get outlined button style
  ButtonStyle getOutlinedButtonStyle(
    WidgetRef ref, {
    Color? borderColor,
    Color? foregroundColor,
    double? borderRadius,
  }) {
    final primaryColor = getPrimaryColor(ref);

    return OutlinedButton.styleFrom(
      foregroundColor: foregroundColor ?? primaryColor,
      side: BorderSide(
        color: borderColor ?? primaryColor.withOpacity(0.5),
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppConstants.borderRadius,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    );
  }

  /// 🎬 Get default animation duration
  Duration get defaultAnimationDuration => AppConstants.animationDuration;

  /// 🎬 Get slide transition
  Widget buildSlideTransition({
    required Animation<double> animation,
    required Widget child,
    Offset begin = const Offset(1.0, 0.0),
    Offset end = Offset.zero,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: begin,
        end: end,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
      child: child,
    );
  }

  /// 🎬 Get fade transition
  Widget buildFadeTransition({
    required Animation<double> animation,
    required Widget child,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: begin,
        end: end,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
      child: child,
    );
  }

  /// 🎬 Get scale transition
  Widget buildScaleTransition({
    required Animation<double> animation,
    required Widget child,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: begin,
        end: end,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.elasticOut)),
      child: child,
    );
  }

  /// 📱 Check if current platform needs special handling - FIXED: Accept BuildContext parameter
  bool isIOS(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.iOS;

  bool isAndroid(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.android;

  /// 📱 Get platform-specific padding - FIXED: Accept BuildContext parameter
  EdgeInsets getPlatformPadding(
    BuildContext context, {
    double? horizontal,
    double? vertical,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal ?? (isIOS(context) ? 20.0 : 16.0),
      vertical: vertical ?? (isIOS(context) ? 16.0 : 12.0),
    );
  }
}
