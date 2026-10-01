import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Backgrounds
  static const Color pageBackground = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFFAFAFA);

  // Typography
  static const Color textPrimary = Color(0xFF111827); // Near black / deep charcoal
  static const Color textSecondary = Color(0xFF4B5563); // Cool grey
  static const Color textMuted = Color(0xFF9CA3AF); // Muted grey for labels / subtitles
  static const Color textPlaceholder = Color(0xFF9CA3AF);

  // Borders & Dividers
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderSubtle = Color(0xFFF3F4F6);
  static const Color divider = Color(0xFFE5E7EB);

  // Accents & Badges
  static const Color liveDealRed = Color(0xFFE11D48); // Crimson / red "Live Deal"
  static const Color ratingBg = Color(0xFFF3F4F6);
  static const Color ratingStar = Color(0xFF111827);
  static const Color ratingText = Color(0xFF1F2937);

  // Category Pills
  static const Color activeCategoryBg = Color(0xFF111827);
  static const Color activeCategoryText = Color(0xFFFFFFFF);
  static const Color inactiveCategoryBg = Color(0xFFFFFFFF);
  static const Color inactiveCategoryText = Color(0xFF374151);
  static const Color inactiveCategoryBorder = Color(0xFFE5E7EB);

  // Bottom Navigation
  static const Color navActive = Color(0xFF111827);
  static const Color navInactive = Color(0xFF9CA3AF);

  // AI Assistant Button Gradient
  static const List<Color> aiButtonGradient = [
    Color(0xFFFF80BF), // Pink
    Color(0xFFA855F7), // Purple
    Color(0xFF60A5FA), // Blue
  ];
}
