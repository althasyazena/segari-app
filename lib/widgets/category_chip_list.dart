import 'package:segari_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CategoryChipList extends StatelessWidget {
  const CategoryChipList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 20),
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return InkWell(
            onTap: () => onSelected(category),
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.20,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primary : const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(14),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppTheme.primary.withValues(alpha: 0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getCategoryIcon(category),
                      color: isSelected
                          ? AppTheme.primary
                          : AppTheme.textSecondary,
                      size: 32,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppTheme.textPrimary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'semua':
        return Icons.grid_view_rounded;
      case 'buah':
        return Icons.apple_rounded;
      case 'sayur':
        return Icons.eco_rounded;
      case 'daging':
        return Icons.restaurant_rounded;
      case 'seafood':
        return Icons.set_meal_rounded;
      case 'bahan pokok':
        return Icons.rice_bowl_rounded;
      default:
        return Icons.shopping_bag_rounded;
    }
  }
}
