import 'package:flutter/material.dart';

class StayItem {
  final String id;
  final String title;
  final String location;
  final double rating;
  final int reviewsCount;
  final int price;
  final String emoji;
  final Color cardBgColor;
  final bool isLiveDeal;
  final String category;

  const StayItem({
    required this.id,
    required this.title,
    required this.location,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    required this.emoji,
    required this.cardBgColor,
    this.isLiveDeal = true,
    required this.category,
  });

  String get formattedPrice {
    final str = price.toString();
    if (str.length <= 3) return '₹$str';
    // Indian number format: e.g. 25,000 or 1,400
    final lastThree = str.substring(str.length - 3);
    final otherNumbers = str.substring(0, str.length - 3);
    final formattedOther = otherNumbers.replaceAllMapped(
      RegExp(r'\B(?=(\d{2})+(?!\d))'),
      (Match m) => '${m[0]},',
    );
    return '₹$formattedOther,$lastThree';
  }
}
