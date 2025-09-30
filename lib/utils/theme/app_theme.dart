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
          g1: const Color(0xFFB0BEC5),
          g2: const Color(0xFFCFD8DC),
          g3: const Color(0xFFECEFF1),
          g4: const Color(0xFFFFFFFF),
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
        BrandGradients(
          g1: AppColors.splashGradient1, // 0xFF4A90E2
          g2: AppColors.splashGradient2, // 0xFF7B68EE
          g3: AppColors.splashGradient3, // 0xFF9932CC
          g4: AppColors.splashGradient4, // 0xFF8B008B
          text: Colors.white,
          textShadow: Colors.white24,
        ),
      ],
    );
  }
}
