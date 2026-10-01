import 'package:flutter/material.dart';
import '../models/category_item.dart';
import '../models/stay_item.dart';

class MockData {
  MockData._();

  static const List<CategoryItem> categories = [
    CategoryItem(id: 'all', label: 'All'),
    CategoryItem(id: 'hotels', label: 'Hotels'),
    CategoryItem(id: 'resorts', label: 'Resorts'),
    CategoryItem(id: 'camping', label: 'Camping'),
    CategoryItem(id: 'villas', label: 'Villas'),
    CategoryItem(id: 'luxury_villas', label: 'Luxury Villas'),
  ];

  static const List<StayItem> hotels = [
    StayItem(
      id: 'hotel_1',
      title: 'Hotel Horizon Lonavala',
      location: 'Lonavala',
      rating: 4.8,
      reviewsCount: 23,
      price: 2680,
      emoji: '🏨',
      cardBgColor: Color(0xFFD6E2FB),
      category: 'hotels',
    ),
    StayItem(
      id: 'hotel_2',
      title: 'Hotel O Metro View Pune',
      location: 'Pune',
      rating: 4.6,
      reviewsCount: 18,
      price: 1400,
      emoji: '🏢',
      cardBgColor: Color(0xFFE2C9F8),
      category: 'hotels',
    ),
    StayItem(
      id: 'hotel_3',
      title: 'Hotel O Peaceful Pune',
      location: 'Pune',
      rating: 4.5,
      reviewsCount: 31,
      price: 1800,
      emoji: '🏩',
      cardBgColor: Color(0xFFFED7AA),
      category: 'hotels',
    ),
  ];

  static const List<StayItem> resorts = [
    StayItem(
      id: 'resort_1',
      title: 'Serene Lake Resort',
      location: 'Pawna Lake',
      rating: 4.9,
      reviewsCount: 21,
      price: 5800,
      emoji: '🏝️',
      cardBgColor: Color(0xFFCFFAFE),
      category: 'resorts',
    ),
    StayItem(
      id: 'resort_2',
      title: 'Mystic Mountain Resort',
      location: 'Lonavala',
      rating: 4.8,
      reviewsCount: 18,
      price: 6200,
      emoji: '🏔️',
      cardBgColor: Color(0xFFDCFCE7),
      category: 'resorts',
    ),
    StayItem(
      id: 'resort_3',
      title: 'Palm Grove Resort',
      location: 'Alibaug',
      rating: 4.7,
      reviewsCount: 24,
      price: 5100,
      emoji: '🌴',
      cardBgColor: Color(0xFFFED7AA),
      category: 'resorts',
    ),
  ];

  static const List<StayItem> camping = [
    StayItem(
      id: 'camp_1',
      title: 'Pawna Lakeside Camping',
      location: 'Pawna',
      rating: 4.6,
      reviewsCount: 15,
      price: 1200,
      emoji: '⛺',
      cardBgColor: Color(0xFFFEF08A),
      category: 'camping',
    ),
    StayItem(
      id: 'camp_2',
      title: 'Forest Trails Camping',
      location: 'Matheran',
      rating: 4.7,
      reviewsCount: 12,
      price: 1500,
      emoji: '🌲',
      cardBgColor: Color(0xFFBBF7D0),
      category: 'camping',
    ),
    StayItem(
      id: 'camp_3',
      title: 'Desert Stars Camping',
      location: 'Jaisalmer',
      rating: 4.8,
      reviewsCount: 14,
      price: 1800,
      emoji: '🏜️',
      cardBgColor: Color(0xFFFECDD3),
      category: 'camping',
    ),
  ];

  static const List<StayItem> villas = [
    StayItem(
      id: 'villa_1',
      title: 'White Oak Villa',
      location: 'Lonavala',
      rating: 4.9,
      reviewsCount: 16,
      price: 8500,
      emoji: '🏡',
      cardBgColor: Color(0xFFE2E8F0),
      category: 'villas',
    ),
    StayItem(
      id: 'villa_2',
      title: 'Green Valley Villa',
      location: 'Khandala',
      rating: 4.8,
      reviewsCount: 14,
      price: 9200,
      emoji: '🏠',
      cardBgColor: Color(0xFFA7F3D0),
      category: 'villas',
    ),
    StayItem(
      id: 'villa_3',
      title: 'Sunset Cliff Villa',
      location: 'Goa',
      rating: 4.9,
      reviewsCount: 19,
      price: 12400,
      emoji: '🏖️',
      cardBgColor: Color(0xFFFED7AA),
      category: 'villas',
    ),
  ];

  static const List<StayItem> luxuryVillas = [
    StayItem(
      id: 'luxury_1',
      title: 'Amara Luxury Estate',
      location: 'Alibaug',
      rating: 5.0,
      reviewsCount: 9,
      price: 25000,
      emoji: '💎',
      cardBgColor: Color(0xFFDDD6FE),
      category: 'luxury_villas',
    ),
    StayItem(
      id: 'luxury_2',
      title: 'Estate De Royale',
      location: 'Lonavala',
      rating: 4.9,
      reviewsCount: 8,
      price: 32000,
      emoji: '👑',
      cardBgColor: Color(0xFFC7D2FE),
      category: 'luxury_villas',
    ),
    StayItem(
      id: 'luxury_3',
      title: 'Infinity Pool Villa',
      location: 'Goa',
      rating: 4.9,
      reviewsCount: 11,
      price: 28500,
      emoji: '🏊',
      cardBgColor: Color(0xFFBAE6FD),
      category: 'luxury_villas',
    ),
  ];

  static Map<String, List<StayItem>> get categorySections => {
    'Last Minute Hotels': hotels,
    'Last Minute Resorts': resorts,
    'Last Minute Camping': camping,
    'Last Minute Villas': villas,
    'Last Minute Luxury Villas': luxuryVillas,
  };
}
