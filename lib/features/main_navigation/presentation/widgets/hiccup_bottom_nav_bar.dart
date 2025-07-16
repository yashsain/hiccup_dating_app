import 'package:flutter/material.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_constants.dart';

/// 🏠 Hiccup Bottom Navigation Bar - Custom themed navigation (2025)
///
/// Features:
/// - Theme-aware styling using centralized color system
/// - Industry-standard Material icons
/// - Smooth animations and interactions
/// - Platform-consistent appearance
/// - Hiccup brand integration
class HiccupBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Brightness brightness;

  const HiccupBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    // 🎨 Get theme-appropriate colors
    final backgroundColor = AppColors.getSurfaceColor(brightness);
    final selectedColor = AppColors.getPrimaryColor(brightness);
    final unselectedColor = AppColors.getSecondaryTextColor(brightness);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.systemShadow,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          selectedItemColor: selectedColor,
          unselectedItemColor: unselectedColor,
          elevation: 0,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 24,

          // 🎯 Navigation items with industry-standard icons
          items: const [
            // 🔍 Discovery Tab
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Discovery',
              tooltip: 'Discover new connections',
            ),

            // 💬 Chats Tab
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat_bubble),
              label: 'Chats',
              tooltip: 'Your conversations',
            ),

            // 🎁 Gifts Tab
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_outlined),
              activeIcon: Icon(Icons.card_giftcard),
              label: 'Gifts',
              tooltip: 'Send thoughtful gifts',
            ),

            // 👤 Profile Tab
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
              tooltip: 'Your profile',
            ),
          ],
        ),
      ),
    );
  }
}
