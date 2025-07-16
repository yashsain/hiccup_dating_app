import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/services/theme_provider.dart';

/// 🎁 Gifts Screen - Gift marketplace and menu (Coming Soon)
///
/// This will display available gifts and gift-sending functionality.
class GiftsScreen extends ConsumerWidget {
  const GiftsScreen({super.key});

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
                // 🎁 Gift icon
                Icon(Icons.card_giftcard, size: 80, color: textColor),

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
