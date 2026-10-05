import 'package:segari_app/models/product.dart';
import 'package:segari_app/theme/app_theme.dart';
import 'package:segari_app/widgets/detail_bottom_bar.dart';
import 'package:segari_app/widgets/detail_header.dart';
import 'package:segari_app/widgets/detail_total.dart';
import 'package:segari_app/widgets/product_summary.dart';
import 'package:segari_app/widgets/quantity_stepper.dart';
import 'package:segari_app/widgets/storage_steps.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _quantity = 1;

  void _increment() {
    setState(() => _quantity++);
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() => _quantity--);
    }
  }

  void _addToCart() {
    final product = widget.product;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_quantity x ${product.name} ditambahkan ke keranjang'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final totalPrice = product.price * _quantity;

    return Scaffold(
      backgroundColor: Colors.white,

      // =========================
      // CONTENT
      // =========================
      body: Column(
        children: [
          DetailHeader(
            product: product,
            onBack: () => Navigator.of(context).pop(),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =========================
                  // PRODUCT SUMMARY
                  // =========================
                  ProductSummary(product: product),

                  const SizedBox(height: 24),

                  // =========================
                  // QUANTITY + TOTAL PRICE
                  // =========================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      QuantityStepper(
                        quantity: _quantity,
                        onIncrement: _increment,
                        onDecrement: _decrement,
                      ),

                      DetailTotalBar(totalPrice: totalPrice),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // =========================
                  // DESCRIPTION
                  // =========================
                  Text(
                    'About the product',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    product.description,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      height: 1.6,
                      fontSize: 13.5,
                    ),
                  ),

                  const SizedBox(height: 22),

                  const StorageSteps(),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

      // =========================
      // BOTTOM ACTION BAR
      // =========================
      bottomNavigationBar: DetailBottomBar(
        product: product,
        onAddToCart: _addToCart,
      ),
    );
  }
}
