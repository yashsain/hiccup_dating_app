import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

import '../../../../../shared/constants/app_colors.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../../../shared/services/theme_provider.dart';

/// ❌ Profile Error Widget - User-Friendly Error Handling (2025)
///
/// A beautiful, theme-aware error widget specifically designed for profile errors.
/// Features:
/// - User-friendly error messaging
/// - Actionable retry functionality
/// - Theme-aware styling
/// - Different error types with appropriate icons
/// - Helpful suggestions for resolution
///
/// Design follows 2025 UX principles:
/// - Clear, non-technical language
/// - Actionable error states
/// - Consistent visual hierarchy
/// - Positive error recovery experience
class ProfileErrorWidget extends ConsumerWidget {
  /// Primary error message to display
  final String message;

  /// Technical error details (optional, for debugging)
  final String? error;

  /// Retry callback function
  final VoidCallback? onRetry;

  /// Error type for appropriate styling and messaging
  final ProfileErrorType type;

  /// Whether to show technical details
  final bool showTechnicalDetails;

  const ProfileErrorWidget({
    super.key,
    required this.message,
    this.error,
    this.onRetry,
    this.type = ProfileErrorType.general,
    this.showTechnicalDetails = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme
    final brightness = ref.watch(currentBrightnessProvider);
    final primaryColor = AppColors.getPrimaryColor(brightness);
    final textColor = AppColors.getPrimaryTextColor(brightness);
    final surfaceColor = AppColors.getSurfaceColor(brightness);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🎨 Error illustration
            _buildErrorIllustration(primaryColor),

            const SizedBox(height: 32),

            // 📱 Error card container
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: surfaceColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _getErrorColor().withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _getErrorColor().withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // 🏷️ Error title
                  Text(
                    _getErrorTitle(),
                    style: AppTextStyles.getHeading3(
                      context,
                    ).copyWith(color: textColor, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // 📝 Error message
                  Text(
                    message,
                    style: AppTextStyles.getBodyMedium(
                      context,
                    ).copyWith(color: textColor.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  // 💡 Helpful suggestion
                  _buildSuggestion(textColor),

                  const SizedBox(height: 24),

                  // 🔄 Action buttons
                  _buildActionButtons(context, primaryColor),

                  // 🔧 Technical details (if enabled)
                  if (showTechnicalDetails && error != null) ...[
                    const SizedBox(height: 20),
                    _buildTechnicalDetails(textColor),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🎨 Build error illustration
  Widget _buildErrorIllustration(Color primaryColor) => Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: _getErrorColor().withOpacity(0.1),
      border: Border.all(color: _getErrorColor().withOpacity(0.3), width: 2),
    ),
    child: Icon(_getErrorIcon(), size: 64, color: _getErrorColor()),
  );

  /// 💡 Build helpful suggestion
  Widget _buildSuggestion(Color textColor) {
    final suggestion = _getSuggestion();
    if (suggestion.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accentBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.accentBlue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.lightbulb_outline_rounded,
            color: AppColors.accentBlue,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              suggestion,
              style: AppTextStyles.getBodySmall(
                context,
              ).copyWith(color: textColor.withOpacity(0.9)),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔄 Build action buttons
  Widget _buildActionButtons(BuildContext context, Color primaryColor) =>
      Column(
        children: [
          // Primary action (retry)
          if (onRetry != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: Text(_getRetryButtonText()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
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
                // Go back button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Go Back'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: BorderSide(color: primaryColor.withOpacity(0.5)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Contact support button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _contactSupport(context),
                    icon: const Icon(Icons.help_outline_rounded),
                    label: const Text('Help'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: BorderSide(color: primaryColor.withOpacity(0.5)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      );

  /// 🔧 Build technical details section
  Widget _buildTechnicalDetails(Color textColor) => ExpansionTile(
    title: Text(
      'Technical Details',
      style: AppTextStyles.getCaption(context).copyWith(
        color: textColor.withOpacity(0.7),
        fontWeight: FontWeight.w600,
      ),
    ),
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
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
