import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import 'avatar_group.dart';

class WeeklyTaskCard extends StatelessWidget {
  final String tagTitle;
  final Color tagTextColor;
  final Color tagBgColor;
  final String priorityTitle;
  final Color priorityTextColor;
  final Color priorityBgColor;
  final String taskTitle;
  final List<String> avatars;
  final String extraCount;
  final String dateText;
  final VoidCallback? onTap;

  const WeeklyTaskCard({
    super.key,
    required this.tagTitle,
    required this.tagTextColor,
    required this.tagBgColor,
    required this.priorityTitle,
    required this.priorityTextColor,
    required this.priorityBgColor,
    required this.taskTitle,
    required this.avatars,
    required this.extraCount,
    required this.dateText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 215,
        height: 230,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(18),
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
            // Chips row (Tag + Priority)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: tagBgColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    tagTitle,
                    style: TextStyle(
                      color: tagTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: priorityBgColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    priorityTitle,
                    style: TextStyle(
                      color: priorityTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Title
            Expanded(
              child: Text(
                taskTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Avatars
            AvatarGroup(
              avatarAssets: avatars,
              extraCount: extraCount,
              size: 34,
              overlap: 22,
            ),
            const SizedBox(height: 14),
            // Date row
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
          ],
        ),
      ),
    );
  }
}
