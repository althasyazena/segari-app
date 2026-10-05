import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String unit;
  final double originalPrice;
  final String description;
  final String imageUrl;
  final IconData icon;
  final Color color;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.originalPrice,
    required this.unit,
    required this.description,
    required this.imageUrl,
    required this.icon,
    required this.color,
  });
}
