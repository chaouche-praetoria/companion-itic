import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: AppColors.black,
                      fontSize: AppSizes.forgotPasswordFontSize,
                      fontWeight: FontWeight.w800,
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      color: AppColors.black,
                      fontSize: AppSizes.splashTextShadowBlur,
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: screenSize.height * 0.05,
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.gradientDark,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}