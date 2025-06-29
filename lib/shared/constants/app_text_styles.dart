import 'package:flutter/material.dart';
import 'app_colors.dart';

/// ✍️ App Text Styles - Modern Typography System (2025)
/// Following Material Design 3 and modern typography best practices
class AppTextStyles {
  // 🚫 Private constructor
  AppTextStyles._();
  
  // 📱 Base Font Configuration
  static const String fontFamily = 'SF Pro Display'; // iOS-style, falls back to system
  
  // 🎯 Heading Styles - For major sections and titles
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.textPrimary,
    height: 1.2, // Line height
    letterSpacing: -0.5,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600, // Semi-bold
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: -0.25,
  );
  
  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );
  
  static const TextStyle heading4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  // 📝 Body Text Styles - For main content
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );
  
  // 🏷️ Label Styles - For buttons, chips, and UI elements
  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: 0.1,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: 0.1,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.25,
    letterSpacing: 0.15,
  );
  
  // 🎯 Special Styles - For specific use cases
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.25,
    letterSpacing: 0.5,
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.33,
    letterSpacing: 0.4,
  );
  
  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.6,
    letterSpacing: 1.5,
  );
  
  // ✨ Brand Styles - Special styling for brand elements
  static const TextStyle brandTitle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800, // Extra bold
    color: AppColors.primary,
    height: 1.1,
    letterSpacing: -1.0,
  );
  
  static const TextStyle brandSubtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300, // Light
    color: AppColors.textSecondary,
    height: 1.4,
    letterSpacing: 0.5,
  );
}