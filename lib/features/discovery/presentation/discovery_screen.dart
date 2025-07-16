import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/services/theme_provider.dart';

/// 🔍 Discovery Screen - Main swiping/landing page (Coming Soon)
///
/// This will be the primary screen where users discover new connections
/// through swiping and matching functionality.
class DiscoveryScreen extends ConsumerWidget {
  const DiscoveryScreen({super.key});

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
                // 🔍 Discovery icon
                Icon(Icons.explore, size: 80, color: textColor),

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
