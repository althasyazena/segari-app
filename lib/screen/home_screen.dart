import 'package:segari_app/data/dummy_data.dart';
import 'package:segari_app/models/product.dart';
import 'package:segari_app/screen/detail_screen.dart';
import 'package:segari_app/widgets/product_card.dart';
import 'package:segari_app/widgets/home_content_header.dart';
import 'package:segari_app/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';
  String _selectedCategory = 'Semua';

  // method getter, untuk mendapatkan data dari private atribut/method
  List<String> get _categories {
    final unique = <String>{'Semua', ...dummyProducts.map((f) => f.category)};
    return unique.toList();
  }

  List<Product> get _filteredProducts {
    return dummyProducts.where((product) {
      final matchesQuery = product.name.toLowerCase().contains(
        _query.toLowerCase(),
      );
      final matchesCategory =
          _selectedCategory == 'Semua' || product.category == _selectedCategory;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  void _openDetail(Product product) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => DetailScreen(product: product)));
  }

  @override
  Widget build(BuildContext context) {
    final product = _filteredProducts;
    return SafeArea(
      child: CustomScrollView(
        // syaratnya panggil sliver
        slivers: [
          SliverToBoxAdapter(
            // sebagai perantara widget
            child: HomeContentHeader(
              selectedCategory: _selectedCategory,
              categories: _categories,
              onQueryChanged: (value) => setState(() => _query = value),
              onCategorySelected: (value) => setState(
                () => _selectedCategory = value,
              ), // selected category akan mengikuti value
            ),
          ),
          if (product.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: Text('Bunga Tidak Ditemukan')),
            )
          else
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 0, 10, 100),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.60,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductCard(
                    product: product[index],
                    onTap: () => _openDetail(product[index]),
                  ),
                  childCount: product.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
