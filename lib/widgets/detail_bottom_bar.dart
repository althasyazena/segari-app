import 'package:segari_app/models/product.dart';
import 'package:segari_app/state/favorites_controller.dart';
import 'package:segari_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DetailBottomBar extends StatelessWidget {
  const DetailBottomBar({
    super.key,
    required this.onAddToCart,
    required this.product,
  });

  final VoidCallback onAddToCart;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            // =========================
            // FAVORITE
            // =========================
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: ValueListenableBuilder<Set<String>>(
                valueListenable: FavoritesController.instance,
                builder: (context, favorites, _) {
                  final isFav = favorites.contains(product.id);

                  return IconButton(
                    onPressed: () {
                      FavoritesController.instance.toggle(product.id);
                    },
                    icon: Icon(
                      isFav
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                    ),
                    color: isFav ? AppTheme.primary : Colors.black87,
                    iconSize: 25,
                  );
                },
              ),
            ),

            const SizedBox(width: 12),

            // =========================
            // ADD TO CART
            // =========================
            Expanded(
              child: SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: onAddToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.secondary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.shopping_cart_outlined, size: 22),
                  label: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
