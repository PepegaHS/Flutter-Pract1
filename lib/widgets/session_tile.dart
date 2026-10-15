import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SessionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final bool isPlaying;
  final VoidCallback onTap;
  final VoidCallback? onMoreTap;

  const SessionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    this.isPlaying = false,
    required this.onTap,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: isPlaying ? const Color(0xFFF0FDFD) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Leading Play Icon SVG
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 42,
                  height: 42,
                ),
                if (isPlaying)
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.pause_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),

            // Content: Title & Subtitle (Column)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: isPlaying
                          ? const Color(0xFF039EA2)
                          : const Color(0xFF1E1E1E),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),

            // Trailing More Dots SVG
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/more_dots.svg',
                width: 22,
                height: 6,
              ),
              onPressed: onMoreTap,
              splashRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
