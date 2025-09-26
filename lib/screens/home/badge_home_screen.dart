import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

class BadgeHomeScreen extends StatelessWidget {
  const BadgeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox( ),
        Text('Votre badge d’accès à l’établissement', textAlign: TextAlign.center,
          style: GoogleFonts.inter(
          color: AppColors.white,
          fontSize: AppSizes.titleFontSize,
          fontWeight: FontWeight.bold,
        ),),
        Image(image: AssetImage('assets/images/apple_wallet.png')),
        Center(child: Text('Pourquoi un badge numérique?', style: GoogleFonts.inter(
          color: AppColors.white,
          fontSize: AppSizes.subtitleFontSize,
        ),)),
      ],
    );
  }
}