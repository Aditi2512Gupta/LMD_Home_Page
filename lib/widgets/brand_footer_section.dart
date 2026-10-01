import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BrandFooterSection extends StatelessWidget {
  const BrandFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 28.0, bottom: 48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Small horizontal accent bar
          Container(
            width: 44,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.borderLight,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 18),

          // Main Headline
          const Text.rich(
            TextSpan(
              text: "India's home \u2014\n",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
                height: 1.22,
                letterSpacing: -0.5,
              ),
              children: [
                TextSpan(
                  text: 'for last minute stays.',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    height: 1.22,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Subtitle
          const Text(
            'Curated stays for spontaneous travelers',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              letterSpacing: -0.1,
            ),
          ),
        ],
      ),
    );
  }
}
