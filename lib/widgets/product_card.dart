import 'package:segari_app/models/product.dart';
import 'package:segari_app/state/favorites_controller.dart';
import 'package:segari_app/theme/app_theme.dart';
import 'package:segari_app/widgets/product_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap});

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // =========================
            // IMAGE
            // =========================
            Expanded(
              flex: 6,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Hero(
                      tag: 'product-image-${product.id}',
                      child: ProductNetworkImage(
                        imageUrl: product.imageUrl,
                        fallbackIcon: product.icon,
                        fallbackColor: product.color,
                      ),
                    ),
                  ),

                  // =========================
                  // FAVORITE BUTTON
                  // =========================
                  Positioned(
                    top: 8,
                    right: 8,
                    child: ValueListenableBuilder<Set<String>>(
                      valueListenable: FavoritesController.instance,
                      builder: (context, favorites, _) {
                        final isFav = favorites.contains(product.id);

                        return InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            FavoritesController.instance.toggle(product.id);
                          },
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.white,
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              size: 19,
                              color: isFav ? AppTheme.primary : Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // Product INFO
            // =========================
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: AppTheme.textPrimary,
                          ),
                        ),

                        const SizedBox(height: 5),

                        // Info tambahan
                        Text(
                          product.unit,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 14),

                        // Harga1
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formatRupiah(product.price),
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: AppTheme.tertiary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              formatRupiah(product.originalPrice),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey.shade500,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // =========================
                    // ADD BUTTON
                    // =========================
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Material(
                        color: Colors.green,
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: onTap,
                          customBorder: const CircleBorder(),
                          child: const SizedBox(
                            width: 42,
                            height: 42,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
