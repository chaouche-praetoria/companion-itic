import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'brand_gradients.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.gradientDark,
      extensions: [
        BrandGradients(
          g1: AppColors.splashGradient1, // 0xFF4A90E2
          g2: AppColors.splashGradient2, // 0xFF7B68EE
          g3: AppColors.splashGradient3, // 0xFF9932CC
          g4: AppColors.splashGradient4, // 0xFF8B008B
          text: AppColors.white,
          textShadow: AppColors.whiteShadow,
        ),
      ],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: AppColors.hightDark, // votre violet profond
      extensions: const [
        // Nuances plus denses pour un rendu dark propre
        BrandGradients(
          g1: Color(0xFF5B48D6),
          g2: Color(0xFF5536C9),
          g3: Color(0xFF3E1E88),
          g4: Color(0xFF2C145E),
          text: Colors.white,
          textShadow: Colors.white24,
        ),
      ],
    );
  }
}