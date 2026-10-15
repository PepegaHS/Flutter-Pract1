import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onFilterTap;
  final VoidCallback? onPlusTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onFilterTap,
    this.onPlusTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/icon_filter.svg',
                width: 24,
                height: 24,
              ),
              onPressed: onFilterTap,
              visualDensity: VisualDensity.compact,
            ),
            Container(
              height: 24,
              width: 1,
              color: AppColors.border,
              margin: const EdgeInsets.symmetric(horizontal: 4),
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/icon_plus.svg',
                width: 24,
                height: 24,
              ),
              onPressed: onPlusTap,
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
      ],
    );
  }
}
