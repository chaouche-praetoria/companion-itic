import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'brand_gradients.dart';

class AppTheme {
  static ThemeData light() {
    final g1 = Color.lerp(AppColors.splashGradient1, Colors.white, 0.65)!;
    final g2 = Color.lerp(AppColors.splashGradient2, Colors.white, 0.70)!;
    final g3 = Color.lerp(AppColors.splashGradient3, Colors.white, 0.75)!;
    final g4 = Color.lerp(AppColors.splashGradient4, Colors.white, 0.80)!;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.gradientDark,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black54,
        elevation: 8,
      ),
      extensions: [
        BrandGradients(
          g1: g1,
          g2: g2,
          g3: g3,
          g4: g4,
          text: Colors.black87,
          textShadow: Colors.black12,
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
