import 'package:segari_app/data/dummy_data.dart';
import 'package:segari_app/models/product.dart';
import 'package:segari_app/screen/detail_screen.dart';
import 'package:segari_app/state/favorites_controller.dart';
import 'package:segari_app/theme/app_theme.dart';
import 'package:segari_app/widgets/empty_favorite_state.dart';
import 'package:segari_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Favorite',
                        style: AppTheme.display(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.tertiary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Your saved products',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),

                ValueListenableBuilder<Set<String>>(
                  valueListenable: FavoritesController.instance,
                  builder: (context, favoriteIds, _) {
                    return Text(
                      '${favoriteIds.length} items',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondary,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: ValueListenableBuilder<Set<String>>(
              valueListenable: FavoritesController.instance,
              builder: (context, favoriteIds, _) {
                final favoriteProducts = dummyProducts
                    .where((Product) => favoriteIds.contains(Product.id))
                    .toList();

                if (favoriteProducts.isEmpty) {
                  return const EmptyFavoriteState();
                }

                return GridView.builder(
                  padding: EdgeInsets.fromLTRB(20, 0, 10, 100),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // ini untuk manggil kira2 konten apa yg akan dipanggil
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.60,
                  ),
                  itemCount: favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final product = favoriteProducts[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(product: product),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
