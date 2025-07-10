import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_constants.dart';

/// 🎨 Theme Service - Centralized Theme Management (2025)
///
/// This service provides:
/// - Single source of truth for all theme configuration
/// - Automatic light/dark theme generation
/// - Platform-specific system UI styling
/// - Consistent theming across the entire app
///
/// Usage:
/// ```dart
/// theme: ThemeService.getLightTheme(),
/// darkTheme: ThemeService.getDarkTheme(),
/// ```
class ThemeService {
  // 🚫 Private constructor - This class should not be instantiated
  ThemeService._();

  /// 🌞 Get Light Theme Configuration
  static ThemeData getLightTheme() {
    return ThemeData(
      // 🎨 Use Material 3 design system
      useMaterial3: true,

      // 🌈 Color Scheme - Based on light gradient
      colorScheme: _getLightColorScheme(),

      // ✍️ Typography - Clean, modern text styles
      textTheme: _getTextTheme(Brightness.light),

      // 📱 App Bar Theme
      appBarTheme: _getAppBarTheme(Brightness.light),

      // 🎯 Button Themes
      elevatedButtonTheme: _getElevatedButtonTheme(Brightness.light),
      textButtonTheme: _getTextButtonTheme(Brightness.light),
      outlinedButtonTheme: _getOutlinedButtonTheme(Brightness.light),

      // 🔲 Card Theme
      cardTheme: _getCardTheme(Brightness.light),

      // 📝 Input Decoration Theme
      inputDecorationTheme: _getInputDecorationTheme(Brightness.light),

      // 🎭 Other Component Themes
      dialogTheme: _getDialogTheme(Brightness.light),
      snackBarTheme: _getSnackBarTheme(Brightness.light),
      dividerTheme: _getDividerTheme(Brightness.light),

      // 📱 Visual Density - Adaptive for different platforms
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // 🎯 Splash Factory - Modern ripple effects
      splashFactory: InkRipple.splashFactory,
    );
  }

  /// 🌙 Get Dark Theme Configuration
  static ThemeData getDarkTheme() {
    return ThemeData(
      // 🎨 Use Material 3 design system
      useMaterial3: true,

      // 🌈 Color Scheme - Based on dark gradient
      colorScheme: _getDarkColorScheme(),

      // ✍️ Typography - Clean, modern text styles
      textTheme: _getTextTheme(Brightness.dark),

      // 📱 App Bar Theme
      appBarTheme: _getAppBarTheme(Brightness.dark),

      // 🎯 Button Themes
      elevatedButtonTheme: _getElevatedButtonTheme(Brightness.dark),
      textButtonTheme: _getTextButtonTheme(Brightness.dark),
      outlinedButtonTheme: _getOutlinedButtonTheme(Brightness.dark),

      // 🔲 Card Theme
      cardTheme: _getCardTheme(Brightness.dark),

      // 📝 Input Decoration Theme
      inputDecorationTheme: _getInputDecorationTheme(Brightness.dark),

      // 🎭 Other Component Themes
      dialogTheme: _getDialogTheme(Brightness.dark),
      snackBarTheme: _getSnackBarTheme(Brightness.dark),
      dividerTheme: _getDividerTheme(Brightness.dark),

      // 📱 Visual Density - Adaptive for different platforms
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // 🎯 Splash Factory - Modern ripple effects
      splashFactory: InkRipple.splashFactory,
    );
  }

  /// 🎨 Get System UI Overlay Style for Status Bar
  static SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness brightness) {
    return brightness == Brightness.dark
        ? SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: AppColors.darkBackground,
            systemNavigationBarIconBrightness: Brightness.light,
          )
        : SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: AppColors.lightBackground,
            systemNavigationBarIconBrightness: Brightness.dark,
          );
  }

  // 🎨 PRIVATE HELPER METHODS

  /// Light Color Scheme
  static ColorScheme _getLightColorScheme() {
    return ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimary,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      surface: AppColors.lightSurface,
      background: AppColors.lightBackground,
      onPrimary: AppColors.neutralWhite,
      onSecondary: AppColors.lightTextPrimary,
      onSurface: AppColors.lightTextPrimary,
      onBackground: AppColors.lightTextPrimary,
      error: AppColors.semanticError,
      onError: AppColors.neutralWhite,
    );
  }

  /// Dark Color Scheme
  static ColorScheme _getDarkColorScheme() {
    return ColorScheme.fromSeed(
      seedColor: AppColors.darkPrimary,
      brightness: Brightness.dark,
    ).copyWith(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      surface: AppColors.darkSurface,
      background: AppColors.darkBackground,
      onPrimary: AppColors.neutralWhite,
      onSecondary: AppColors.darkTextPrimary,
      onSurface: AppColors.darkTextPrimary,
      onBackground: AppColors.darkTextPrimary,
      error: AppColors.semanticError,
      onError: AppColors.neutralWhite,
    );
  }

  /// Text Theme Configuration
  static TextTheme _getTextTheme(Brightness brightness) {
    final primaryColor = AppColors.getPrimaryTextColor(brightness);
    final secondaryColor = AppColors.getSecondaryTextColor(brightness);

    return TextTheme(
      displayLarge: AppTextStyles.heading1.copyWith(color: primaryColor),
      displayMedium: AppTextStyles.heading2.copyWith(color: primaryColor),
      displaySmall: AppTextStyles.heading3.copyWith(color: primaryColor),
      headlineMedium: AppTextStyles.heading4.copyWith(color: primaryColor),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: primaryColor),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: primaryColor),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: secondaryColor),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: primaryColor),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: primaryColor),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: secondaryColor),
    );
  }

  /// App Bar Theme
  static AppBarTheme _getAppBarTheme(Brightness brightness) {
    return AppBarTheme(
      backgroundColor: AppColors.getSurfaceColor(brightness),
      foregroundColor: AppColors.getPrimaryTextColor(brightness),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.heading3.copyWith(
        color: AppColors.getPrimaryTextColor(brightness),
      ),
      systemOverlayStyle: getSystemUiOverlayStyle(brightness),
    );
  }

  /// Elevated Button Theme
  static ElevatedButtonThemeData _getElevatedButtonTheme(
    Brightness brightness,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.getPrimaryColor(brightness),
        foregroundColor: AppColors.neutralWhite,
        textStyle: AppTextStyles.button,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        elevation: AppConstants.elevationMedium,
      ),
    );
  }

  /// Text Button Theme
  static TextButtonThemeData _getTextButtonTheme(Brightness brightness) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.getPrimaryColor(brightness),
        textStyle: AppTextStyles.button,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      ),
    );
  }

  /// Outlined Button Theme
  static OutlinedButtonThemeData _getOutlinedButtonTheme(
    Brightness brightness,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.getPrimaryColor(brightness),
        side: BorderSide(
          color: AppColors.getPrimaryColor(brightness),
          width: 2,
        ),
        textStyle: AppTextStyles.button,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      ),
    );
  }

  /// Card Theme
  static CardTheme _getCardTheme(Brightness brightness) {
    return CardTheme(
      color: AppColors.getSurfaceColor(brightness),
      elevation: AppConstants.elevationLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
    );
  }

  /// Input Decoration Theme
  static InputDecorationTheme _getInputDecorationTheme(Brightness brightness) {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.getSurfaceColor(brightness),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: BorderSide(color: AppColors.systemBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: BorderSide(color: AppColors.systemBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: BorderSide(
          color: AppColors.getPrimaryColor(brightness),
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: BorderSide(color: AppColors.semanticError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: BorderSide(color: AppColors.semanticError, width: 2),
      ),
    );
  }

  /// Dialog Theme
  static DialogTheme _getDialogTheme(Brightness brightness) {
    return DialogTheme(
      backgroundColor: AppColors.getSurfaceColor(brightness),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      elevation: AppConstants.elevationHigh,
    );
  }

  /// SnackBar Theme
  static SnackBarThemeData _getSnackBarTheme(Brightness brightness) {
    return SnackBarThemeData(
      backgroundColor: AppColors.getPrimaryColor(brightness),
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.neutralWhite,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      behavior: SnackBarBehavior.floating,
    );
  }

  /// Divider Theme
  static DividerThemeData _getDividerTheme(Brightness brightness) {
    return DividerThemeData(
      color: AppColors.systemDivider,
      thickness: 1,
      space: 1,
    );
  }
}
