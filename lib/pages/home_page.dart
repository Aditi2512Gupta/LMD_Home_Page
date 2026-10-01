import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/stay_item.dart';
import '../theme/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/brand_footer_section.dart';
import '../widgets/category_tabs.dart';
import '../widgets/search_booking_section.dart';
import '../widgets/stay_section.dart';
import '../widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategoryId = 'all';
  int _selectedNavIndex = 0;
  String _searchQuery = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onCategorySelected(String categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;
    });
  }

  void _onNavItemSelected(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.trim().toLowerCase();
    });
  }

  List<StayItem> _filterItems(List<StayItem> items) {
    if (_searchQuery.isEmpty) return items;
    return items.where((item) {
      final matchesTitle = item.title.toLowerCase().contains(_searchQuery);
      final matchesLocation = item.location.toLowerCase().contains(_searchQuery);
      return matchesTitle || matchesLocation;
    }).toList();
  }

  void _showStayDetails(StayItem item) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: item.cardBgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        item.emoji,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${item.location} • ★ ${item.rating} (${item.reviewsCount} reviews)',
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price per night',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textMuted,
                        ),
                      ),
                      Text(
                        item.formattedPrice,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Booking initiated for ${item.title}!'),
                          backgroundColor: AppColors.textPrimary,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textPrimary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isDesktopOrTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SizedBox(
            width: isDesktopOrTablet ? 680 : double.infinity,
            child: ListView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              padding: EdgeInsets.zero,
              children: [
                // 1. Top Bar with LOGO and Profile
                TopBar(
                  onLogoTap: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  onProfileTap: () {
                    _onNavItemSelected(3);
                  },
                ),

                // 2. Search & Booking Section
                SearchBookingSection(
                  onSearchChanged: _onSearchChanged,
                  onNotificationTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No new notifications'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 14),

                // 3. Category Tabs
                CategoryTabs(
                  categories: MockData.categories,
                  selectedCategoryId: _selectedCategoryId,
                  onCategorySelected: _onCategorySelected,
                ),

                const SizedBox(height: 10),

                // 4. Stays Sections (Hotels, Resorts, Camping, Villas, Luxury Villas)
                ..._buildStaySections(),

                // 5. Brand Footer: "India's home — for last minute stays."
                const BrandFooterSection(),

                // Extra padding for bottom navigation bar
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Center(
        heightFactor: 1.0,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: BottomNavBar(
            selectedIndex: _selectedNavIndex,
            onItemSelected: _onNavItemSelected,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStaySections() {
    final List<Widget> sectionWidgets = [];

    final showHotels = _selectedCategoryId == 'all' || _selectedCategoryId == 'hotels';
    final showResorts = _selectedCategoryId == 'all' || _selectedCategoryId == 'resorts';
    final showCamping = _selectedCategoryId == 'all' || _selectedCategoryId == 'camping';
    final showVillas = _selectedCategoryId == 'all' || _selectedCategoryId == 'villas';
    final showLuxuryVillas = _selectedCategoryId == 'all' || _selectedCategoryId == 'luxury_villas';

    if (showHotels) {
      final items = _filterItems(MockData.hotels);
      if (items.isNotEmpty) {
        sectionWidgets.add(
          StaySection(
            title: 'Last Minute Hotels',
            items: items,
            onItemTap: _showStayDetails,
            onSeeAllTap: () => _onCategorySelected('hotels'),
          ),
        );
      }
    }

    if (showResorts) {
      final items = _filterItems(MockData.resorts);
      if (items.isNotEmpty) {
        sectionWidgets.add(
          StaySection(
            title: 'Last Minute Resorts',
            items: items,
            onItemTap: _showStayDetails,
            onSeeAllTap: () => _onCategorySelected('resorts'),
          ),
        );
      }
    }

    if (showCamping) {
      final items = _filterItems(MockData.camping);
      if (items.isNotEmpty) {
        sectionWidgets.add(
          StaySection(
            title: 'Last Minute Camping',
            items: items,
            onItemTap: _showStayDetails,
            onSeeAllTap: () => _onCategorySelected('camping'),
          ),
        );
      }
    }

    if (showVillas) {
      final items = _filterItems(MockData.villas);
      if (items.isNotEmpty) {
        sectionWidgets.add(
          StaySection(
            title: 'Last Minute Villas',
            items: items,
            onItemTap: _showStayDetails,
            onSeeAllTap: () => _onCategorySelected('villas'),
          ),
        );
      }
    }

    if (showLuxuryVillas) {
      final items = _filterItems(MockData.luxuryVillas);
      if (items.isNotEmpty) {
        sectionWidgets.add(
          StaySection(
            title: 'Last Minute Luxury Villas',
            items: items,
            onItemTap: _showStayDetails,
            onSeeAllTap: () => _onCategorySelected('luxury_villas'),
          ),
        );
      }
    }

    return sectionWidgets;
  }
}
