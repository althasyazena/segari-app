import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/promo_banner.dart';

class DummyUser {
  static const String email = 'demo@Segari.com';
  static const String password = 'Segari123';
  static const String name = 'Demo User';
}

final List<Product> dummyProducts = [
  Product(
    id: 'f1',
    name: 'Wortel Brastagi Ekonomis',
    category: 'Sayuran',
    price: 14400,
    originalPrice: 17200,
    unit: "400 - 500 gram / pack",
    description:
        'Wortel Brastagi Ekonomis adalah wortel segar dengan tekstur renyah dan rasa manis alami. Cocok untuk berbagai masakan seperti sup, tumisan, capcay, salad, hingga jus. Pilihan ekonomis untuk kebutuhan sayur sehari-hari.',
    imageUrl:
        'https://assets-cloudflare.segari-ops.id/products/10700000040_1_04062026043338.webp',
    icon: Icons.local_florist,
    color: Colors.red.shade300,
  ),
  Product(
    id: 'f2',
    name: 'Cabai Rawit Merah',
    category: 'Sayuran',
    price: 9000,
    originalPrice: 11900,
    unit: "140 - 150 gram / pack",
    description:
        'Cabai Rawit Merah** adalah cabai segar dengan rasa pedas yang kuat dan aroma khas. Cocok digunakan sebagai sambal, bumbu masakan, tumisan, atau pelengkap berbagai hidangan sehari-hari.',
    imageUrl:
        'https://assets-cloudflare.segari-ops.id/products/10100000006_1_09092026113012.webp',
    icon: Icons.local_florist,
    color: Colors.amber.shade400,
  ),
  Product(
    id: 'f3',
    name: 'Mangga Harum Manis',
    category: 'Buah',
    price: 9900,
    originalPrice: 22500,
    unit: "0.9 - 1.1 kg / pack",
    description:
        'Anggrek ungu elegan yang tahan lama, cocok sebagai penghias meja kerja maupun ruang tamu.',
    imageUrl:
        'https://assets-cloudflare.segari-ops.id/products/20002300001_1_31122024044455.webp',
    icon: Icons.spa,
    color: Colors.deepPurple.shade300,
  ),
  Product(
    id: 'f4',
    name: 'Semangka Merah',
    category: 'Buah',
    price: 59900,
    originalPrice: 71300,
    unit: "3 - 3.5 kg / pcs",
    description:
        'Bunga matahari yang cerah dan besar, simbol kebahagiaan dan optimisme. Cocok untuk mempercantik hari-harimu.',
    imageUrl:
        'https://assets-cloudflare.segari-ops.id/products/20001900002_1_17122024051114.webp',
    icon: Icons.wb_sunny,
    color: Colors.orange.shade400,
  ),
  Product(
    id: 'f5',
    name: 'ABC Terasi Udang Bag 20 x 3.8 gr',
    category: 'Bahan Pokok',
    price: 7900,
    originalPrice: 9200,
    unit: "20 x 3.8 gram / bag",
    description:
        'Lily putih yang anggun dan wangi, sering digunakan untuk acara formal maupun ucapan belasungkawa.',
    imageUrl:
        'https://assets-cloudflare.segari-ops.id/products/71713000028_1_30052025040614.webp',
    icon: Icons.local_florist,
    color: Colors.grey.shade300,
  ),
  Product(
    id: 'f6',
    name: 'Daging Sapi Karubi Shabu',
    category: 'Daging',
    price: 55100,
    originalPrice: 67200,
    unit: "250 - 275 gram / pack",
    description:
        'Lavender dengan aroma menenangkan, cocok untuk relaksasi dan mempercantik taman kecil di rumah.',
    imageUrl:
        'https://assets-cloudflare.segari-ops.id/products/50000100091_1_05082026013550.webp',
    icon: Icons.grass,
    color: Colors.purple.shade200,
  ),
  Product(
    id: 'f7',
    name: 'Barco Minyak Kelapa Pouch 2 L',
    category: 'Bahan Pokok',
    price: 106100,
    originalPrice: 178900,
    unit: "2 liter / pcs",
    description:
        'Peony pink dengan kelopak berlapis yang mewah, favorit untuk dekorasi pernikahan dan acara spesial.',
    imageUrl:
        'https://assets-cloudflare.segari-ops.id/products/70000400003_1_05062026043114.webp',
    icon: Icons.local_florist,
    color: Colors.pink.shade200,
  ),
  Product(
    id: 'f8',
    name: 'Cakalang Suwir Rica 5 Minutes',
    category: 'Seafood',
    price: 30000,
    originalPrice: 50000,
    unit: "100 gram / pack",
    description:
        'Daisy putih yang manis dan sederhana, cocok untuk buket kasual sehari-hari.',
    imageUrl:
        'https://assets-cloudflare.segari-ops.id/products/31332000260_1_03112023064840.webp',
    icon: Icons.local_florist,
    color: Colors.teal.shade200,
  ),
];

final List<PromoBanner> dummyBanners = [
  PromoBanner(
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfuKkjVJ0WJVVairaI3HampCFdwIXEmg0MYf-y7BOADw&s=10',
  ),
  PromoBanner(
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0ViQ0gYJcw5GR4pNBNOmp3AsqxejNRhiNdBdsCpKDwQ&s=10',
  ),
  PromoBanner(
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSR7KUAZ-VslgrDeKjlumQ0qVzHrlhy1bUT6Shn3l-lg&s=10',
  ),
];
