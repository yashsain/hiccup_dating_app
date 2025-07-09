import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// ✍️ Hiccup App Typography - Premium Dating Experience (2025)
/// Primary Font: Manrope Variable - Modern, readable sans-serif
/// Display Font: Playfair Display - Elegant serif for romantic moments
class AppTextStyles {
  // 🚫 Private constructor
  AppTextStyles._();

  // 🎯 Heading Styles - Major sections and romantic moments
  static TextStyle heading1 = GoogleFonts.manrope(
    fontSize: 32,
    fontWeight: FontWeight.w800, // Extra Bold
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle heading2 = GoogleFonts.manrope(
    fontSize: 28,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: -0.25,
  );

  static TextStyle heading3 = GoogleFonts.manrope(
    fontSize: 24,
    fontWeight: FontWeight.w600, // Semi-bold
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle heading4 = GoogleFonts.manrope(
    fontSize: 20,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // 📝 Body Text Styles - Main content
  static TextStyle bodyLarge = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle bodyMedium = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle bodySmall = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // 🏷️ Label Styles - Buttons, chips, and UI elements
  static TextStyle labelLarge = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: 0.1,
  );

  static TextStyle labelSmall = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.25,
    letterSpacing: 0.15,
  );

  // 🎯 Special Styles - Specific use cases
  static TextStyle button = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.25,
    letterSpacing: 0.5,
  );

  static TextStyle caption = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static TextStyle overline = GoogleFonts.manrope(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.6,
    letterSpacing: 1.5,
  );

  // 💕 Romantic Styles - Special moments using Playfair Display
  static TextStyle brandTitle = GoogleFonts.playfairDisplay(
    fontSize: 36,
    fontWeight: FontWeight.w800, // Extra bold
    color: AppColors.hiccupRose,
    height: 1.1,
    letterSpacing: -1.0,
  );

  static TextStyle brandSubtitle = GoogleFonts.playfairDisplay(
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.textSecondary,
    height: 1.4,
    letterSpacing: 0.5,
    fontStyle: FontStyle.italic,
  );

  // 🎁 Special notification styles for romantic moments
  static TextStyle giftDelivered = GoogleFonts.playfairDisplay(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.gold24k,
    height: 1.2,
    letterSpacing: 0.5,
  );

  static TextStyle matchMadeInHeaven = GoogleFonts.playfairDisplay(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.hiccupRose,
    height: 1.3,
    letterSpacing: 0.3,
    fontStyle: FontStyle.italic,
  );

  // ✨ Premium styles for special features
  static TextStyle premiumLabel = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.gold24k,
    height: 1.25,
    letterSpacing: 1.0,
  );

  static TextStyle hiccupAction = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.hiccupRose,
    height: 1.2,
    letterSpacing: 0.5,
  );
}
