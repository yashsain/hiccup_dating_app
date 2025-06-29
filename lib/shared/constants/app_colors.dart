import 'package:flutter/material.dart';

/// 🎨 App Colors - Modern 2025 Design System
/// Following Material Design 3 principles with custom brand colors
class AppColors {
  // 🚫 Private constructor
  AppColors._();
  
  // 🌟 Brand Colors - Hiccup Brand Identity
  static const Color primary = Color(0xFF6C5CE7);        // Purple/Violet
  static const Color primaryDark = Color(0xFF5A4FCF);    // Darker purple
  static const Color primaryLight = Color(0xFF8B7ED8);   // Lighter purple
  
  static const Color secondary = Color(0xFFFF6B9D);      // Pink/Rose
  static const Color secondaryDark = Color(0xFFE84393);  // Darker pink
  static const Color secondaryLight = Color(0xFFFFAAC7); // Lighter pink
  
  // 🎯 Accent Colors
  static const Color accent = Color(0xFF00D2D3);         // Teal/Cyan
  static const Color warning = Color(0xFFFD79A8);        // Soft pink warning
  static const Color success = Color(0xFF00B894);        // Green
  static const Color error = Color(0xFFE84393);          // Pink error (brand-aligned)
  
  // ⚫ Neutral Colors - 2025 Modern Palette
  static const Color black = Color(0xFF1A1A1A);          // True black
  static const Color darkGrey = Color(0xFF2D3436);       // Dark grey
  static const Color mediumGrey = Color(0xFF636E72);     // Medium grey
  static const Color lightGrey = Color(0xFFDDD4DD);      // Light grey
  static const Color offWhite = Color(0xFFFDFCFF);       // Off white
  static const Color white = Color(0xFFFFFFFF);          // Pure white
  
  // 🌙 Background Colors (Dark Mode Ready)
  static const Color backgroundLight = offWhite;
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = white;
  static const Color surfaceDark = Color(0xFF1E1E1E);
  
  // 📝 Text Colors
  static const Color textPrimary = black;
  static const Color textSecondary = mediumGrey;
  static const Color textLight = white;
  static const Color textHint = lightGrey;
  
  // 🔲 Component Colors
  static const Color cardBackground = white;
  static const Color divider = lightGrey;
  static const Color shadow = Color(0x1A000000);         // 10% black
  
  // 🎨 Gradient Colors (for modern UI effects)
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [accent, primary],
  );
}