import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AvatarGroup extends StatelessWidget {
  final List<String> avatarAssets;
  final String? extraCount;
  final double size;
  final double overlap;

  const AvatarGroup({
    super.key,
    required this.avatarAssets,
    this.extraCount,
    this.size = 36.8,
    this.overlap = 23.0,
  });

  @override
  Widget build(BuildContext context) {
    final totalItems = avatarAssets.length + (extraCount != null ? 1 : 0);
    final totalWidth = size + (totalItems - 1) * overlap;

    return SizedBox(
      width: totalWidth,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < avatarAssets.length; i++)
            Positioned(
              left: i * overlap,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5),
                  image: DecorationImage(
                    image: AssetImage(avatarAssets[i]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          if (extraCount != null)
            Positioned(
              left: avatarAssets.length * overlap,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.badgeOrange,
                  border: Border.all(color: Colors.white, width: 2.5),
                ),
                alignment: Alignment.center,
                child: Text(
                  extraCount!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: size * 0.35,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
