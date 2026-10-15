import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class UserHeader extends StatelessWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;

  const UserHeader({
    super.key,
    this.onSearchTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/avatar_user.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 14),
        // Greetings
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Evening!',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Dan Smith',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        // Search Action
        _buildCircleActionButton(
          iconPath: 'assets/images/icon_search.svg',
          onTap: onSearchTap,
        ),
        const SizedBox(width: 10),
        // Notification Action
        _buildCircleActionButton(
          iconPath: 'assets/images/icon_bell.svg',
          onTap: onNotificationTap,
        ),
      ],
    );
  }

  Widget _buildCircleActionButton({
    required String iconPath,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: AppColors.border, width: 1),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          iconPath,
          width: 22,
          height: 22,
        ),
      ),
    );
  }
}
