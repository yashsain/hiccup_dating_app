import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/services/theme_provider.dart';

/// 👤 Profile Screen - User profile view (Coming Soon)
///
/// This will display user profile information and settings.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🎨 Get current theme information
    final currentBrightness = ref.watch(currentBrightnessProvider);
    final gradient = AppColors.getThemeGradient(currentBrightness);
    final textColor = AppColors.getPrimaryTextColor(currentBrightness);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 👤 Profile icon
                Icon(Icons.person, size: 80, color: textColor),

                const SizedBox(height: 24),

                // Coming soon text
                Text(
                  'Coming Soon',
                  style: AppTextStyles.heading2.copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
