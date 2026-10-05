import 'package:flutter/material.dart';
import 'package:segari_app/theme/app_theme.dart';

class StorageSteps extends StatelessWidget {
  const StorageSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      _StorageStepData(
        number: '01',
        icon: Icons.ac_unit_rounded,
        title: 'Dinginkan',
        description: 'Simpan di tempat yang sejuk.',
      ),
      _StorageStepData(
        number: '02',
        icon: Icons.inventory_2_outlined,
        title: 'Simpan',
        description: 'Gunakan wadah yang bersih.',
      ),
      _StorageStepData(
        number: '03',
        icon: Icons.schedule_rounded,
        title: 'Gunakan',
        description: 'Konsumsi sebelum kualitas menurun.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cara Penyimpanan',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 155,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: steps.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return _StorageCard(step: steps[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _StorageCard extends StatelessWidget {
  const _StorageCard({required this.step});

  final _StorageStepData step;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NUMBER + ICON
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                step.number,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primary,
                ),
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.secondary,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(step.icon, color: Colors.white, size: 19),
              ),
            ],
          ),

          const Spacer(),

          Text(
            step.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.tertiary,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            step.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              height: 1.35,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StorageStepData {
  const _StorageStepData({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });

  final String number;
  final IconData icon;
  final String title;
  final String description;
}
