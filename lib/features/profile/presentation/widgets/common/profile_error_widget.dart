import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../../../shared/services/theme_provider.dart';

/// ❌ Profile Error Widget - User-Friendly Error Handling (2025)
///
/// ✅ FIXED IMPORT ISSUES:
/// - Removed incorrect Context import (path package)
/// - Using proper BuildContext throughout
/// - Clean type safety and error handling
///
/// A beautiful, theme-aware error widget specifically designed for profile errors.
/// Features:
/// - User-friendly error messaging
/// - Actionable retry functionality
/// - Theme-aware styling
/// - Different error types with appropriate icons
/// - Helpful suggestions for resolution
class ProfileErrorWidget extends ConsumerWidget {
  /// Primary error message to display
  final String message;

  /// Technical error details (optional, for debugging)
  final String? error;

  /// Retry callback function
  final VoidCallback? onRetry;

  /// Error type for specific styling and actions
  final ProfileErrorType type;

  /// Whether to show technical details (debug mode)
  final bool showTechnicalDetails;

  /// Custom icon override
  final IconData? customIcon;

  /// Custom color override
  final Color? customColor;

  const ProfileErrorWidget({
    super.key,
    required this.message,
    this.error,
    this.onRetry,
    this.type = ProfileErrorType.general,
    this.showTechnicalDetails = false,
    this.customIcon,
    this.customColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);
    final gradient = AppColors.getThemeGradient(currentBrightness);

    // 🎨 Theme-aware colors
    final backgroundColor = AppColors.getBackgroundColor(currentBrightness);
    final surfaceColor = AppColors.getSurfaceColor(currentBrightness);
    final textColor = AppColors.getPrimaryTextColor(currentBrightness);
    final errorColor = customColor ?? _getErrorColor();

    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: surfaceColor.withOpacity(0.95),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: errorColor.withOpacity(0.2), width: 1),
              boxShadow: [
                BoxShadow(
                  color: errorColor.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🎨 Error icon with animation
                _buildErrorIcon(errorColor),
                const SizedBox(height: 24),

                // 📝 Error title
                _buildErrorTitle(context, textColor),
                const SizedBox(height: 12),

                // 📝 Error message
                _buildErrorMessage(context, textColor),
                const SizedBox(height: 8),

                // 💡 Helpful suggestion
                _buildSuggestion(context, textColor),
                const SizedBox(height: 32),

                // 🎯 Action buttons
                _buildActionButtons(context, ref, errorColor),

                // 🔧 Technical details (if enabled)
                if (showTechnicalDetails && error != null) ...[
                  const SizedBox(height: 24),
                  _buildTechnicalDetails(context, textColor),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🎨 Build animated error icon
  Widget _buildErrorIcon(Color errorColor) => Container(
    width: 80,
    height: 80,
    decoration: BoxDecoration(
      color: errorColor.withOpacity(0.1),
      shape: BoxShape.circle,
    ),
    child: Icon(customIcon ?? _getErrorIcon(), size: 40, color: errorColor),
  );

  /// 📝 Build error title
  Widget _buildErrorTitle(BuildContext context, Color textColor) => Text(
    _getErrorTitle(),
    style: AppTextStyles.getHeading3(
      context,
    ).copyWith(color: textColor, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );

  /// 📝 Build error message
  Widget _buildErrorMessage(BuildContext context, Color textColor) => Text(
    message,
    style: AppTextStyles.getBodyMedium(
      context,
    ).copyWith(color: textColor.withOpacity(0.8)),
    textAlign: TextAlign.center,
  );

  /// 💡 Build helpful suggestion
  Widget _buildSuggestion(BuildContext context, Color textColor) => Text(
    _getSuggestion(),
    style: AppTextStyles.getBodySmall(
      context,
    ).copyWith(color: textColor.withOpacity(0.6), fontStyle: FontStyle.italic),
    textAlign: TextAlign.center,
  );

  /// 🎯 Build action buttons
  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    Color errorColor,
  ) => Column(
    children: [
      // Primary retry button
      if (onRetry != null)
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh_rounded),
            label: Text(
              _getRetryButtonText(),
              style: AppTextStyles.getButton(context),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: errorColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

      // Secondary actions
      if (_hasSecondaryActions()) ...[
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_rounded),
                label: Text('Go Back', style: AppTextStyles.getButton(context)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextButton.icon(
                onPressed: () => _contactSupport(context),
                icon: const Icon(Icons.help_outline_rounded),
                label: Text(
                  'Get Help',
                  style: AppTextStyles.getButton(context),
                ),
              ),
            ),
          ],
        ),
      ],
    ],
  );

  /// 🔧 Build technical details section
  Widget _buildTechnicalDetails(BuildContext context, Color textColor) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Details:',
            style: AppTextStyles.getLabelSmall(context).copyWith(
              color: textColor.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: textColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: textColor.withOpacity(0.1), width: 1),
            ),
            child: Text(
              error ?? 'No technical details available',
              style: AppTextStyles.getCaption(context).copyWith(
                color: textColor.withOpacity(0.6),
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      );

  /// 🎯 Get error-specific title
  String _getErrorTitle() {
    switch (type) {
      case ProfileErrorType.network:
        return 'Connection Problem';
      case ProfileErrorType.notFound:
        return 'Profile Not Found';
      case ProfileErrorType.permission:
        return 'Access Denied';
      case ProfileErrorType.validation:
        return 'Invalid Data';
      case ProfileErrorType.server:
        return 'Server Error';
      case ProfileErrorType.general:
        return 'Something Went Wrong';
    }
  }

  /// 🎨 Get error-specific icon
  IconData _getErrorIcon() {
    switch (type) {
      case ProfileErrorType.network:
        return Icons.wifi_off_rounded;
      case ProfileErrorType.notFound:
        return Icons.person_search_rounded;
      case ProfileErrorType.permission:
        return Icons.lock_outline_rounded;
      case ProfileErrorType.validation:
        return Icons.warning_rounded;
      case ProfileErrorType.server:
        return Icons.cloud_off_rounded;
      case ProfileErrorType.general:
        return Icons.error_outline_rounded;
    }
  }

  /// 🎨 Get error-specific color
  Color _getErrorColor() {
    switch (type) {
      case ProfileErrorType.network:
        return AppColors.accentBlue;
      case ProfileErrorType.notFound:
        return AppColors.neutralGray600;
      case ProfileErrorType.permission:
        return Colors.orange;
      case ProfileErrorType.validation:
        return Colors.amber;
      case ProfileErrorType.server:
        return AppColors.semanticError;
      case ProfileErrorType.general:
        return AppColors.semanticError;
    }
  }

  /// 💡 Get helpful suggestion
  String _getSuggestion() {
    switch (type) {
      case ProfileErrorType.network:
        return 'Check your internet connection and try again.';
      case ProfileErrorType.notFound:
        return 'This profile may have been deleted or is temporarily unavailable.';
      case ProfileErrorType.permission:
        return 'You may not have permission to view this profile.';
      case ProfileErrorType.validation:
        return 'Please check your input and try again.';
      case ProfileErrorType.server:
        return 'Our servers are experiencing issues. Please try again in a few minutes.';
      case ProfileErrorType.general:
        return 'This is usually temporary. Try refreshing the page.';
    }
  }

  /// 🔄 Get retry button text
  String _getRetryButtonText() {
    switch (type) {
      case ProfileErrorType.network:
        return 'Check Connection';
      case ProfileErrorType.notFound:
        return 'Search Again';
      case ProfileErrorType.permission:
        return 'Try Again';
      case ProfileErrorType.validation:
        return 'Fix & Retry';
      case ProfileErrorType.server:
        return 'Retry';
      case ProfileErrorType.general:
        return 'Try Again';
    }
  }

  /// 🔧 Check if secondary actions should be shown
  bool _hasSecondaryActions() {
    return type !=
        ProfileErrorType.validation; // Validation errors only need retry
  }

  /// 📞 Contact support
  void _contactSupport(BuildContext context) {
    // TODO: Implement support contact in future phase
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Support contact feature coming soon!'),
        backgroundColor: AppColors.accentBlue,
      ),
    );
  }
}

/// 🎯 Profile Error Types
///
/// Different error scenarios for appropriate handling
enum ProfileErrorType {
  /// Network connectivity issues
  network,

  /// Profile not found or deleted
  notFound,

  /// Permission or access denied
  permission,

  /// Data validation errors
  validation,

  /// Server-side errors
  server,

  /// General/unknown errors
  general,
}
