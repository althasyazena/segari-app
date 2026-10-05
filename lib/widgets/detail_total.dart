import 'package:segari_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DetailTotalBar extends StatelessWidget {
  const DetailTotalBar({super.key, required this.totalPrice});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Text(
      formatRupiah(totalPrice),
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w800,
        color: AppTheme.tertiary,
      ),
    );
  }
}
