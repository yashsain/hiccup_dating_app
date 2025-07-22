import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ✍️ Hiccup App Typography - Complete Theme System Integration (2025)
///
/// This typography system provides:
/// - Complete set of text styles with getter methods
/// - Theme-aware color integration
/// - Clean, scalable text styles
/// - Support for both light and dark themes
/// - Premium, romantic feel with Hiccup branding
///
/// Primary Font: Manrope Variable - Modern, readable sans-serif
/// Display Font: Playfair Display - Elegant serif for romantic moments
///
/// ✅ FIXED ISSUES:
/// - Added missing getLabelLarge(), getLabelMedium(), getLabelSmall()
/// - Added missing getCaption() method
/// - All text styles now have corresponding getter methods
/// - Complete theme integration for all styles

class AppTextStyles {
  // 🚫 Private constructor
  AppTextStyles._();

  // 🎯 Heading Styles - Major sections and romantic moments
  static TextStyle heading1 = GoogleFonts.manrope(
    fontSize: 32,
    fontWeight: FontWeight.w800, // Extra Bold
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle heading2 = GoogleFonts.manrope(
    fontSize: 28,
    fontWeight: FontWeight.w700, // Bold
    height: 1.25,
    letterSpacing: -0.25,
  );

  static TextStyle heading3 = GoogleFonts.manrope(
    fontSize: 24,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.3,
  );

  static TextStyle heading4 = GoogleFonts.manrope(
    fontSize: 20,
    fontWeight: FontWeight.w500, // Medium
    height: 1.4,
  );

  // 📝 Body Text Styles - Main content
  static TextStyle bodyLarge = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
    height: 1.5,
  );

  static TextStyle bodyMedium = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle bodySmall = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  // 🏷️ Label Styles - Buttons, chips, and UI elements
  static TextStyle labelLarge = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.25,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.25,
    letterSpacing: 0.1,
  );

  static TextStyle labelSmall = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.25,
    letterSpacing: 0.15,
  );

  // 🎯 Special Styles - Specific use cases
  static TextStyle button = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0.5,
  );

  static TextStyle caption = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static TextStyle overline = GoogleFonts.manrope(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.6,
    letterSpacing: 1.5,
  );

  // 💕 Romantic Styles - Special moments using Playfair Display
  static TextStyle brandTitle = GoogleFonts.playfairDisplay(
    fontSize: 36,
    fontWeight: FontWeight.w800, // Extra bold
    height: 1.1,
    letterSpacing: -1.0,
  );

  static TextStyle brandSubtitle = GoogleFonts.playfairDisplay(
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
    height: 1.4,
    letterSpacing: 0.5,
    fontStyle: FontStyle.italic,
  );

  // 🎁 Special notification styles for romantic moments
  static TextStyle giftDelivered = GoogleFonts.playfairDisplay(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0.5,
  );

  static TextStyle matchMadeInHeaven = GoogleFonts.playfairDisplay(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0.3,
    fontStyle: FontStyle.italic,
  );

  // ✨ Premium styles for special features
  static TextStyle premiumLabel = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: 1.0,
  );

  static TextStyle hiccupAction = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.5,
  );

  // 🎨 THEME-AWARE UTILITY METHODS
  // These methods create text styles with colors based on the current theme

  /// Get heading1 style with theme-appropriate color
  static TextStyle getHeading1(BuildContext context) {
    return heading1.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  /// Get heading2 style with theme-appropriate color
  static TextStyle getHeading2(BuildContext context) {
    return heading2.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  /// Get heading3 style with theme-appropriate color
  static TextStyle getHeading3(BuildContext context) {
    return heading3.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  /// Get heading4 style with theme-appropriate color
  static TextStyle getHeading4(BuildContext context) {
    return heading4.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  /// Get bodyLarge style with theme-appropriate color
  static TextStyle getBodyLarge(BuildContext context) {
    return bodyLarge.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  /// Get bodyMedium style with theme-appropriate color
  static TextStyle getBodyMedium(BuildContext context) {
    return bodyMedium.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  /// Get bodySmall style with theme-appropriate color
  static TextStyle getBodySmall(BuildContext context) {
    return bodySmall.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
    );
  }

  // 🏷️ FIXED: Missing label getter methods

  /// Get labelLarge style with theme-appropriate color
  static TextStyle getLabelLarge(BuildContext context) {
    return labelLarge.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  /// Get labelMedium style with theme-appropriate color
  static TextStyle getLabelMedium(BuildContext context) {
    return labelMedium.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  /// Get labelSmall style with theme-appropriate color
  static TextStyle getLabelSmall(BuildContext context) {
    return labelSmall.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  // 🎯 FIXED: Missing caption getter method

  /// Get caption style with theme-appropriate color
  static TextStyle getCaption(BuildContext context) {
    return caption.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
    );
  }

  /// Get button style with theme-appropriate color
  static TextStyle getButton(BuildContext context) {
    return button.copyWith(color: Theme.of(context).colorScheme.onPrimary);
  }

  /// Get brand title style with theme-appropriate color
  static TextStyle getBrandTitle(BuildContext context) {
    return brandTitle.copyWith(color: Theme.of(context).colorScheme.primary);
  }

  /// Get brand subtitle style with theme-appropriate color
  static TextStyle getBrandSubtitle(BuildContext context) {
    return brandSubtitle.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
    );
  }

  /// Get gift delivered style with theme-appropriate color (gold)
  static TextStyle getGiftDelivered(BuildContext context) {
    return giftDelivered.copyWith(
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  /// Get match made in heaven style with theme-appropriate color
  static TextStyle getMatchMadeInHeaven(BuildContext context) {
    return matchMadeInHeaven.copyWith(
      color: Theme.of(context).colorScheme.primary,
    );
  }

  /// Get premium label style with theme-appropriate color
  static TextStyle getPremiumLabel(BuildContext context) {
    return premiumLabel.copyWith(
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  /// Get hiccup action style with theme-appropriate color
  static TextStyle getHiccupAction(BuildContext context) {
    return hiccupAction.copyWith(color: Theme.of(context).colorScheme.primary);
  }

  /// Get overline style with theme-appropriate color
  static TextStyle getOverline(BuildContext context) {
    return overline.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
    );
  }
}

/// 🎨 Text Style Extensions - Helper extensions for easy theme-aware text styling
extension TextStyleExtensions on BuildContext {
  /// Get heading1 style with current theme color
  TextStyle get heading1 => AppTextStyles.getHeading1(this);

  /// Get heading2 style with current theme color
  TextStyle get heading2 => AppTextStyles.getHeading2(this);

  /// Get heading3 style with current theme color
  TextStyle get heading3 => AppTextStyles.getHeading3(this);

  /// Get heading4 style with current theme color
  TextStyle get heading4 => AppTextStyles.getHeading4(this);

  /// Get bodyLarge style with current theme color
  TextStyle get bodyLarge => AppTextStyles.getBodyLarge(this);

  /// Get bodyMedium style with current theme color
  TextStyle get bodyMedium => AppTextStyles.getBodyMedium(this);

  /// Get bodySmall style with current theme color
  TextStyle get bodySmall => AppTextStyles.getBodySmall(this);

  /// Get labelLarge style with current theme color
  TextStyle get labelLarge => AppTextStyles.getLabelLarge(this);

  /// Get labelMedium style with current theme color
  TextStyle get labelMedium => AppTextStyles.getLabelMedium(this);

  /// Get labelSmall style with current theme color
  TextStyle get labelSmall => AppTextStyles.getLabelSmall(this);

  /// Get caption style with current theme color
  TextStyle get caption => AppTextStyles.getCaption(this);

  /// Get button style with current theme color
  TextStyle get buttonStyle => AppTextStyles.getButton(this);

  /// Get brand title style with current theme color
  TextStyle get brandTitle => AppTextStyles.getBrandTitle(this);

  /// Get brand subtitle style with current theme color
  TextStyle get brandSubtitle => AppTextStyles.getBrandSubtitle(this);
}
