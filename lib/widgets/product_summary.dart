import 'package:segari_app/models/product.dart';
import 'package:segari_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductSummary extends StatelessWidget {
  const ProductSummary({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
              ),
              Text(
                product.unit,
                style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
