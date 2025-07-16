import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/constants/app_colors.dart';

/// 🍎 iOS Theme Configuration - Platform-Specific Theming (2025)
///
/// This configuration handles:
/// - iOS-specific system UI overlay styles
/// - Status bar behavior
/// - iOS navigation adaptations
/// - iOS Human Interface Guidelines compliance
///
/// Note: Since app should look mostly the same on both platforms,
/// this only handles system-level UI differences, not app content styling.
class IOSThemeConfig {
  // 🚫 Private constructor - This class should not be instantiated
  IOSThemeConfig._();

  /// 🎨 Get iOS-specific system UI overlay style
  static SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness brightness) {
    return brightness == Brightness.dark
        ? _getDarkSystemUiOverlayStyle()
        : _getLightSystemUiOverlayStyle();
  }

  /// 🌙 Dark theme system UI overlay style for iOS
  static SystemUiOverlayStyle _getDarkSystemUiOverlayStyle() {
    return SystemUiOverlayStyle.light.copyWith(
      // Status bar (top)
      statusBarColor: Colors.transparent, // Always transparent on iOS
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,

      // iOS doesn't have navigation bar like Android
      // But we set it for consistency
      systemNavigationBarColor: AppColors.darkBackground,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }

  /// ☀️ Light theme system UI overlay style for iOS
  static SystemUiOverlayStyle _getLightSystemUiOverlayStyle() {
    return SystemUiOverlayStyle.dark.copyWith(
      // Status bar (top)
      statusBarColor: Colors.transparent, // Always transparent on iOS
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,

      // iOS doesn't have navigation bar like Android
      // But we set it for consistency
      systemNavigationBarColor: AppColors.lightBackground,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }

  /// 🔧 Configure iOS-specific system UI settings
  static Future<void> configureSystemUi() async {
    // iOS: Enable edge-to-edge display (similar to Android)
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // Set preferred orientations (portrait only for dating app)
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// 🎯 iOS Cupertino specific theme adaptations
  static ThemeData adaptThemeForIOS(ThemeData theme) {
    // Since app should look the same on both platforms,
    // we only make minimal iOS-specific adjustments
    return theme.copyWith(
      // iOS-specific: Set platform
      platform: TargetPlatform.iOS,

      // iOS-specific: Tab bar theme (similar to bottom navigation)
      tabBarTheme: TabBarThemeData(
        labelColor: theme.colorScheme.primary,
        unselectedLabelColor: theme.colorScheme.onSurface.withOpacity(0.6),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
      ),

      // iOS-specific: Navigation bar theme
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

      // iOS-specific: Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: theme.colorScheme.surface,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.onSurface.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  /// 🎭 iOS-specific splash screen configuration
  static Map<String, dynamic> getSplashScreenConfig() {
    return {
      'ios': {
        'image': 'assets/images/hiccup_logo.png',
        'color': '#A2000B', // Dark theme primary color
        'color_dark': '#380014', // Dark theme end color
      },
    };
  }

  /// 🔄 Handle iOS-specific theme changes
  static void handleThemeChange(Brightness brightness) {
    // Update system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(getSystemUiOverlayStyle(brightness));

    // iOS-specific: Ensure status bar is properly updated
    // iOS handles this automatically, but we ensure consistency
    final overlayStyle = getSystemUiOverlayStyle(brightness);
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
  }

  /// 🎨 iOS-specific color adaptations
  static Color adaptColorForIOS(Color color, Brightness brightness) {
    // iOS automatically handles color adaptations
    // This method is for future iOS-specific color adjustments
    return color;
  }

  /// 🔧 iOS Human Interface Guidelines compliance checks
  static bool isHIGCompliant(ThemeData theme) {
    // Basic checks for iOS Human Interface Guidelines compliance
    // This will be expanded in future phases

    // Check if contrast ratios are appropriate
    final contrast = _calculateContrastRatio(
      theme.colorScheme.primary,
      theme.colorScheme.onPrimary,
    );

    // iOS requires minimum 3:1 contrast ratio
    return contrast >= 3.0;
  }

  /// Calculate contrast ratio between two colors
  static double _calculateContrastRatio(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();

    final brightest = luminance1 > luminance2 ? luminance1 : luminance2;
    final darkest = luminance1 > luminance2 ? luminance2 : luminance1;

    return (brightest + 0.05) / (darkest + 0.05);
  }
}

/// 🎨 iOS Theme Extensions - Helper extensions for iOS theming
extension IOSThemeExtensions on ThemeData {
  /// Get iOS-adapted theme
  ThemeData get iosAdapted => IOSThemeConfig.adaptThemeForIOS(this);

  /// Check if current theme is suitable for iOS
  bool get isIOSCompatible => platform == TargetPlatform.iOS;

  /// Check if theme is HIG compliant
  bool get isHIGCompliant => IOSThemeConfig.isHIGCompliant(this);
}
