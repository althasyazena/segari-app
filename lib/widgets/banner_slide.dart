import 'package:segari_app/models/promo_banner.dart';

import 'package:flutter/material.dart';

class BannerSlide extends StatelessWidget {
  const BannerSlide({super.key, required this.banner});

  final PromoBanner banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),

        child: Image.network(
          banner.imageUrl,

          width: double.infinity,

          fit: BoxFit.cover,

          errorBuilder: (context, error, stackTrace) {
            return Container(color: Colors.grey.shade200);
          },

          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;

            return Container(
              color: Colors.grey.shade100,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
