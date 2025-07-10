import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/constants/app_colors.dart';

/// 🤖 Android Theme Configuration - Platform-Specific Theming (2025)
///
/// This configuration handles:
/// - Android-specific system UI overlay styles
/// - Navigation bar styling
/// - Status bar behavior
/// - Android Material 3 adaptations
///
/// Note: Since app should look mostly the same on both platforms,
/// this only handles system-level UI differences, not app content styling.
class AndroidThemeConfig {
  // 🚫 Private constructor - This class should not be instantiated
  AndroidThemeConfig._();

  /// 🎨 Get Android-specific system UI overlay style
  static SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness brightness) {
    return brightness == Brightness.dark
        ? _getDarkSystemUiOverlayStyle()
        : _getLightSystemUiOverlayStyle();
  }

  /// 🌙 Dark theme system UI overlay style for Android
  static SystemUiOverlayStyle _getDarkSystemUiOverlayStyle() {
    return SystemUiOverlayStyle.light.copyWith(
      // Status bar (top)
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,

      // Navigation bar (bottom) - Android specific
      systemNavigationBarColor: AppColors.darkBackground,
      systemNavigationBarDividerColor: AppColors.darkSurface,
      systemNavigationBarIconBrightness: Brightness.light,

      // Android-specific: Enable edge-to-edge
      systemNavigationBarContrastEnforced: false,
    );
  }

  /// ☀️ Light theme system UI overlay style for Android
  static SystemUiOverlayStyle _getLightSystemUiOverlayStyle() {
    return SystemUiOverlayStyle.dark.copyWith(
      // Status bar (top)
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,

      // Navigation bar (bottom) - Android specific
      systemNavigationBarColor: AppColors.lightBackground,
      systemNavigationBarDividerColor: AppColors.lightSurface,
      systemNavigationBarIconBrightness: Brightness.dark,

      // Android-specific: Enable edge-to-edge
      systemNavigationBarContrastEnforced: false,
    );
  }

  /// 🔧 Configure Android-specific system UI settings
  static Future<void> configureSystemUi() async {
    // Enable edge-to-edge display
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // Set preferred orientations (portrait only for dating app)
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// 🎯 Android Material 3 specific theme adaptations
  static ThemeData adaptThemeForAndroid(ThemeData theme) {
    // Since app should look the same on both platforms,
    // we only make minimal Android-specific adjustments
    return theme.copyWith(
      // Android-specific: Use Material 3 dynamic colors if available
      // This will be expanded in future phases
      platform: TargetPlatform.android,

      // Android-specific: Navigation bar theme
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: theme.colorScheme.surface,
        indicatorColor: theme.colorScheme.secondary,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
            );
          }
          return theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface,
          );
        }),
      ),

      // Android-specific: Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: theme.colorScheme.surface,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.onSurface.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  /// 🎭 Android-specific splash screen configuration
  static Map<String, dynamic> getSplashScreenConfig() {
    return {
      'android_12': {
        'image': 'assets/images/hiccup_logo.png',
        'color': '#A2000B', // Dark theme primary color
        'color_dark': '#380014', // Dark theme end color
      },
    };
  }

  /// 🔄 Handle Android-specific theme changes
  static void handleThemeChange(Brightness brightness) {
    // Update system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(getSystemUiOverlayStyle(brightness));

    // Android-specific: Update navigation bar color
    // This ensures smooth transitions between themes
    final overlayStyle = getSystemUiOverlayStyle(brightness);
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
  }
}

/// 🎨 Android Theme Extensions - Helper extensions for Android theming
extension AndroidThemeExtensions on ThemeData {
  /// Get Android-adapted theme
  ThemeData get androidAdapted => AndroidThemeConfig.adaptThemeForAndroid(this);

  /// Check if current theme is suitable for Android
  bool get isAndroidCompatible => platform == TargetPlatform.android;
}
