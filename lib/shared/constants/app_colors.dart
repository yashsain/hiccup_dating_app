import 'package:flutter/material.dart';

/// 🎨 Hiccup App Colors - Rose-Gold Luxury Aesthetic (2025)
/// Following the design requirements for a premium dating experience
/// that combines romance with sophistication.
class AppColors {
  // 🚫 Private constructor
  AppColors._();

  // 🌹 Primary Brand Colors (60% of UI) - Rose-Gold Palette
  static const Color hiccupRose = Color(
    0xFFE11D48,
  ); // Deep romantic red with pink undertones
  static const Color blushPink = Color(
    0xFFFFC0CB,
  ); // Soft, approachable romance
  static const Color crimsonPassion = Color(
    0xFFBE123C,
  ); // Deep love, premium feel

  // Legacy naming (keeping for backwards compatibility during transition)
  static const Color primary = hiccupRose;
  static const Color primaryDark = crimsonPassion;
  static const Color primaryLight = blushPink;

  // 🥂 Neutral Colors (30% of UI) - Elegant Sophistication
  static const Color champagneWhite = Color(
    0xFFFFF8F3,
  ); // Warm, luxurious backgrounds
  static const Color silkGray = Color(0xFFF5F5F4); // Elegant secondary surfaces
  static const Color midnightBlack = Color(
    0xFF0A0A0A,
  ); // Premium text, high contrast
  static const Color nudeBeige = Color(
    0xFFE7D7CE,
  ); // Soft warmth for content areas

  // ✨ Accent Colors (10% of UI) - Premium Features
  static const Color gold24k = Color(
    0xFFFFD700,
  ); // Gift indicators, premium features
  static const Color emeraldGreen = Color(
    0xFF10B981,
  ); // Success states, gift accepted
  static const Color diamondBlue = Color(
    0xFF60A5FA,
  ); // Trust, security, verification
  static const Color velvetPurple = Color(
    0xFF9333EA,
  ); // Luxury gifts, exclusive features

  // Legacy accent colors (for compatibility)
  static const Color secondary = gold24k;
  static const Color secondaryDark = Color(0xFFDAA520); // Darker gold
  static const Color secondaryLight = Color(0xFFFFF59D); // Lighter gold
  static const Color accent = emeraldGreen;
  static const Color warning = Color(0xFFF59E0B); // Amber warning
  static const Color success = emeraldGreen;
  static const Color error = hiccupRose;

  // ⚫ System Colors
  static const Color black = midnightBlack;
  static const Color darkGrey = Color(0xFF374151);
  static const Color mediumGrey = Color(0xFF6B7280);
  static const Color lightGrey = Color(0xFFE5E7EB);
  static const Color offWhite = champagneWhite;
  static const Color white = Color(0xFFFFFFFF);

  // 🌙 Background Colors (Dark Mode Ready)
  static const Color backgroundLight = champagneWhite;
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = white;
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // 📝 Text Colors
  static const Color textPrimary = midnightBlack;
  static const Color textSecondary = mediumGrey;
  static const Color textLight = white;
  static const Color textHint = lightGrey;

  // 🔲 Component Colors
  static const Color cardBackground = white;
  static const Color divider = Color(0xFFE5E7EB);
  static const Color shadow = Color(0x1A000000); // 10% black

  // 🎨 Premium Gradients - Signature Hiccup Effects
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [hiccupRose, blushPink, gold24k],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient roseGoldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [hiccupRose, gold24k],
  );

  static const LinearGradient champagneGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [champagneWhite, blushPink],
  );

  static const LinearGradient luxuryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gold24k, velvetPurple],
  );
}
