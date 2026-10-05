import 'package:segari_app/models/product.dart';
import 'package:segari_app/theme/app_theme.dart';
import 'package:segari_app/widgets/circle_icon_button.dart';
import 'package:segari_app/widgets/product_image.dart';
import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.product, required this.onBack});

  final Product product;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'product-image-${product.id}',
              child: ProductNetworkImage(
                imageUrl: product.imageUrl,
                fallbackIcon: product.icon,
                fallbackColor: product.color,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // BACK BUTTON
                  InkWell(
                    onTap: onBack,
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            color: AppTheme.tertiary,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // CART BUTTON
                  CircleIconButton(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: AppTheme.secondary,
                    onTap: () {
                      // TODO: buka cart
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
