import 'package:flutter/material.dart';
import '../models/stay_item.dart';
import '../theme/app_colors.dart';

class StayCard extends StatelessWidget {
  final StayItem item;
  final VoidCallback? onTap;

  const StayCard({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 178,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image / Illustration Container
            Container(
              height: 122,
              width: double.infinity,
              decoration: BoxDecoration(
                color: item.cardBgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  // Center Emoji / Icon Graphic
                  Center(
                    child: Text(
                      item.emoji,
                      style: const TextStyle(
                        fontSize: 42,
                        height: 1.1,
                      ),
                    ),
                  ),

                  // "Live Deal" Badge
                  if (item.isLiveDeal)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.liveDealRed,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.liveDealRed.withValues(alpha: 0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Live Deal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // 2. Title
            SizedBox(
              height: 36,
              child: Text(
                item.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  height: 1.25,
                ),
              ),
            ),

            const SizedBox(height: 4),

            // 3. Location & Rating Row
            Row(
              children: [
                // Location
                const Icon(
                  Icons.location_on_outlined,
                  size: 13,
                  color: AppColors.textMuted,
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    item.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),

                const SizedBox(width: 4),

                // Rating pill
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                  decoration: BoxDecoration(
                    color: AppColors.ratingBg,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 10,
                        color: AppColors.ratingStar,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${item.rating.toStringAsFixed(1)} (${item.reviewsCount})',
                        style: const TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.ratingText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            // 4. Price
            Text(
              item.formattedPrice,
              style: const TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
