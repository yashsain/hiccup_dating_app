import 'package:flutter/material.dart';

/// 🎨 Hiccup App Colors - New Gradient System (2025)
/// Following the new requirements:
/// - Dark Theme: Deep Chatak Red (#A2000B) → Burnt Maroon (#380014)
/// - Light Theme: Soft Rosé (#FFB4BE) → Pale Blush Pink (#FFE6EB)
/// - Single source of truth for all colors
/// - Centralized theme management
class AppColors {
  // 🚫 Private constructor - This class should not be instantiated
  AppColors._();

  // 🌙 DARK THEME COLORS - "Lustful & Mysterious"
  static const Color darkGradientStart = Color(0xFFA2000B); // Deep Chatak Red
  static const Color darkGradientEnd = Color(0xFF380014); // Burnt Maroon

  // ☀️ LIGHT THEME COLORS - "Warm & Premium"
  static const Color lightGradientStart = Color(0xFFFFB4BE); // Soft Rosé
  static const Color lightGradientEnd = Color(0xFFFFE6EB); // Pale Blush Pink

  // 🎯 DERIVED COLORS - Automatically calculated from gradients

  // Dark Theme Derived Colors
  static const Color darkPrimary = darkGradientStart; // #A2000B
  static const Color darkSecondary = Color(0xFF6B0508); // Midpoint of gradient
  static const Color darkSurface = Color(
    0xFF1A0A0C,
  ); // Lighter version for surfaces
  static const Color darkBackground = Color(0xFF0F0A0B); // Darker background

  // Light Theme Derived Colors
  static const Color lightPrimary = Color(
    0xFFFF8A9B,
  ); // Slightly darker than start
  static const Color lightSecondary = Color(0xFFFFCDD4); // Midpoint of gradient
  static const Color lightSurface = Color(
    0xFFFFF8F9,
  ); // Almost white with hint of pink
  static const Color lightBackground = Color(0xFFFFFFFF); // Pure white

  // 🎨 GRADIENTS - Primary theme gradients
  static const LinearGradient darkThemeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [darkGradientStart, darkGradientEnd],
    stops: [0.0, 0.71], // 71% as specified in requirements
  );

  static const LinearGradient lightThemeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [lightGradientStart, lightGradientEnd],
    stops: [0.0, 0.71], // 71% as specified in requirements
  );

  // 🎯 ACCENT COLORS - For buttons, highlights, success/error states
  static const Color accentGold = Color(0xFFFFD700); // Premium gold
  static const Color accentGreen = Color(0xFF10B981); // Success green
  static const Color accentRed = Color(0xFFEF4444); // Error red
  static const Color accentBlue = Color(0xFF3B82F6); // Info blue

  // ⚫ NEUTRAL COLORS - For text, borders, dividers
  static const Color neutralWhite = Color(0xFFFFFFFF);
  static const Color neutralGray100 = Color(0xFFF3F4F6);
  static const Color neutralGray200 = Color(0xFFE5E7EB);
  static const Color neutralGray300 = Color(0xFFD1D5DB);
  static const Color neutralGray400 = Color(0xFF9CA3AF);
  static const Color neutralGray500 = Color(0xFF6B7280);
  static const Color neutralGray600 = Color(0xFF4B5563);
  static const Color neutralGray700 = Color(0xFF374151);
  static const Color neutralGray800 = Color(0xFF1F2937);
  static const Color neutralGray900 = Color(0xFF111827);
  static const Color neutralBlack = Color(0xFF000000);

  // 📱 TEXT COLORS - Theme-specific text colors

  // Dark Theme Text Colors
  static const Color darkTextPrimary = neutralWhite;
  static const Color darkTextSecondary = neutralGray300;
  static const Color darkTextTertiary = neutralGray400;
  static const Color darkTextDisabled = neutralGray600;

  // Light Theme Text Colors
  static const Color lightTextPrimary = neutralGray900;
  static const Color lightTextSecondary = neutralGray700;
  static const Color lightTextTertiary = neutralGray500;
  static const Color lightTextDisabled = neutralGray400;

  // 🔧 SYSTEM COLORS - For system UI elements
  static const Color systemDivider = neutralGray200;
  static const Color systemBorder = neutralGray300;
  static const Color systemShadow = Color(0x1A000000); // 10% black

  // 🎭 SEMANTIC COLORS - For different app states
  static const Color semanticSuccess = accentGreen;
  static const Color semanticWarning = Color(0xFFF59E0B);
  static const Color semanticError = accentRed;
  static const Color semanticInfo = accentBlue;

  // 🎨 UTILITY METHODS - For getting theme-specific colors

  /// Get primary color based on theme brightness
  static Color getPrimaryColor(Brightness brightness) {
    return brightness == Brightness.dark ? darkPrimary : lightPrimary;
  }

  /// Get secondary color based on theme brightness
  static Color getSecondaryColor(Brightness brightness) {
    return brightness == Brightness.dark ? darkSecondary : lightSecondary;
  }

  /// Get surface color based on theme brightness
  static Color getSurfaceColor(Brightness brightness) {
    return brightness == Brightness.dark ? darkSurface : lightSurface;
  }

  /// Get background color based on theme brightness
  static Color getBackgroundColor(Brightness brightness) {
    return brightness == Brightness.dark ? darkBackground : lightBackground;
  }

  /// Get primary text color based on theme brightness
  static Color getPrimaryTextColor(Brightness brightness) {
    return brightness == Brightness.dark ? darkTextPrimary : lightTextPrimary;
  }

  /// Get secondary text color based on theme brightness
  static Color getSecondaryTextColor(Brightness brightness) {
    return brightness == Brightness.dark
        ? darkTextSecondary
        : lightTextSecondary;
  }

  /// Get theme-specific gradient
  static LinearGradient getThemeGradient(Brightness brightness) {
    return brightness == Brightness.dark
        ? darkThemeGradient
        : lightThemeGradient;
  }

  // 🔮 LEGACY SUPPORT - For backward compatibility during transition
  // These will be removed in Phase 2
  @deprecated
  static const Color primary = lightPrimary;
  @deprecated
  static const Color secondary = accentGold;
  @deprecated
  static const Color accent = accentGreen;
  @deprecated
  static const Color error = semanticError;
  @deprecated
  static const Color success = semanticSuccess;
  @deprecated
  static const Color warning = semanticWarning;
  @deprecated
  static const Color white = neutralWhite;
  @deprecated
  static const Color black = neutralBlack;
}
