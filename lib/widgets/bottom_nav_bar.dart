import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.borderLight.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 1. Home
              _buildNavItem(
                index: 0,
                icon: Icons.home_filled,
                label: 'Home',
                showDot: true,
              ),

              // 2. Bookings
              _buildNavItem(
                index: 1,
                icon: Icons.calendar_today_outlined,
                label: 'Bookings',
                showDot: false,
              ),

              // 3. Saved
              _buildNavItem(
                index: 2,
                icon: Icons.favorite_border,
                label: 'Saved',
                showDot: false,
              ),

              // 4. Profile
              _buildNavItem(
                index: 3,
                icon: Icons.person_outline,
                label: 'Profile',
                showDot: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required bool showDot,
  }) {
    final isSelected = selectedIndex == index;
    final color = isSelected ? AppColors.navActive : AppColors.navInactive;

    return InkWell(
      onTap: () => onItemSelected(index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: color,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: color,
                letterSpacing: -0.1,
              ),
            ),
            const SizedBox(height: 2),
            // Indicator Dot when active
            Container(
              width: 3.5,
              height: 3.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected && showDot ? AppColors.navActive : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
