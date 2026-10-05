import 'package:segari_app/theme/app_theme.dart';

import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.onProfileTap});

  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // PROFILE
        InkWell(
          onTap: onProfileTap,

          customBorder: CircleBorder(),

          child: Container(
            width: 52,

            height: 52,

            padding: EdgeInsets.all(5),

            decoration: BoxDecoration(
              color: Colors.white,

              shape: BoxShape.circle,

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),

                  blurRadius: 10,

                  offset: Offset(0, 3),
                ),
              ],
            ),

            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.primary,

                shape: BoxShape.circle,
              ),

              child: Icon(Icons.person_rounded, color: Colors.white, size: 28),
            ),
          ),
        ),

        SizedBox(width: 10),

        // USER NAME
        Container(
          width: 130,

          height: 48,

          padding: EdgeInsets.symmetric(horizontal: 16),

          alignment: Alignment.center,

          decoration: BoxDecoration(
            color: AppTheme.secondary,

            borderRadius: BorderRadius.circular(28),
          ),

          child: Text(
            'Demo User',

            style: TextStyle(
              fontSize: 17,

              fontWeight: FontWeight.w400,

              color: Colors.white,
            ),
          ),
        ),

        Spacer(),

        SizedBox(width: 10),

        // MENU
        Stack(
          children: [
            Container(
              width: 46,

              height: 46,

              decoration: BoxDecoration(
                color: Color(0xFFF8F8F8),

                shape: BoxShape.circle,
              ),

              child: Icon(
                Icons.menu_rounded,

                color: AppTheme.primary,

                size: 24,
              ),
            ),

            Positioned(
              top: 1,

              right: 1,

              child: Container(
                width: 11,

                height: 11,

                decoration: BoxDecoration(
                  color: AppTheme.primary,

                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),

        SizedBox(width: 10),

        // SETTINGS
        Container(
          width: 46,

          height: 46,

          decoration: BoxDecoration(
            color: Color(0xFFF8F8F8),

            shape: BoxShape.circle,
          ),

          child: Icon(
            Icons.settings_outlined,

            color: AppTheme.secondary,

            size: 25,
          ),
        ),
      ],
    );
  }
}
