import 'package:flutter/material.dart';
import '../models/category_item.dart';
import '../theme/app_colors.dart';

class CategoryTabs extends StatelessWidget {
  final List<CategoryItem> categories;
  final String selectedCategoryId;
  final ValueChanged<String> onCategorySelected;

  const CategoryTabs({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category.id == selectedCategoryId;

          return InkWell(
            onTap: () => onCategorySelected(category.id),
            borderRadius: BorderRadius.circular(22),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.activeCategoryBg
                    : AppColors.inactiveCategoryBg,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: isSelected
                      ? AppColors.activeCategoryBg
                      : AppColors.inactiveCategoryBorder,
                  width: 1.2,
                ),
              ),
              child: Center(
                child: Text(
                  category.label,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? AppColors.activeCategoryText
                        : AppColors.inactiveCategoryText,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
