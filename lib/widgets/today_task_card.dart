import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import 'avatar_group.dart';

class TodayTaskCard extends StatelessWidget {
  final String title;
  final String category;
  final String dateText;
  final bool isCompleted;
  final List<String> avatars;
  final String extraCount;
  final VoidCallback onToggleCompleted;

  const TodayTaskCard({
    super.key,
    required this.title,
    required this.category,
    required this.dateText,
    required this.isCompleted,
    required this.avatars,
    required this.extraCount,
    required this.onToggleCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row (Title + Category + Checkbox)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: AppColors.textPrimary,
                        decorationThickness: 1.8,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      category,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onToggleCompleted,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted ? AppColors.primary : Colors.transparent,
                    border: Border.all(
                      color: isCompleted ? AppColors.primary : AppColors.border,
                      width: 1.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: isCompleted
                      ? SvgPicture.asset(
                          'assets/images/icon_check.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Divider line
          const Divider(
            color: AppColors.divider,
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 16),
          // Bottom row (Date + Avatars)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icon_calendar.svg',
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                      AppColors.textSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    dateText,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              AvatarGroup(
                avatarAssets: avatars,
                extraCount: extraCount,
                size: 28,
                overlap: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
