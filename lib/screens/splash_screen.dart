import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import '../constants/app_durations.dart';
import '../constants/app_texts.dart';
import '../constants/app_sizes.dart';
import '../constants/app_assets.dart';
import '../utils/theme/brand_gradients.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _gradientController;
  late final AnimationController _textController;

  late final Animation<double> _gradientAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _gradientController = AnimationController(
      duration: AppDurations.splashGradient,
      vsync: this,
    )..repeat(reverse: true);

    _textController = AnimationController(
      duration: AppDurations.splashText,
      vsync: this,
    )..forward();

    _gradientAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _gradientController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );

    Future.delayed(AppDurations.splashTimer, () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _textController.dispose();
    super.dispose();
  }

  BrandGradients _brand(BuildContext context) {
    final ext = Theme.of(context).extension<BrandGradients>();
    if (ext != null) return ext;

    // Fallback si l’extension n’est pas attachée au thème
    final cs = Theme.of(context).colorScheme;
    return BrandGradients(
      g1: cs.primary.withOpacity(0.90),
      g2: cs.primaryContainer.withOpacity(0.90),
      g3: cs.secondary.withOpacity(0.95),
      g4: cs.tertiary.withOpacity(0.95),
      text: cs.onPrimary,
      textShadow: Colors.white24,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final screenWidth = mq.width;
    final screenHeight = mq.height;

    final logoWidth = screenWidth * 0.6;
    final logoHeight = screenHeight * 0.15;
    final companionFontSize = screenWidth * 0.055;

    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge(
          [_gradientAnimation, _fadeAnimation, _slideAnimation],
        ),
        builder: (context, _) {
          final t = _gradientAnimation.value;
          final brand = _brand(context);

          // Dégradé animé en s’appuyant sur g1..g4
          final c1 = Color.lerp(brand.g1, brand.g2, t * 0.8)!;
          final c2 = Color.lerp(brand.g2, brand.g3, t * 0.9)!;
          final c3 = Color.lerp(brand.g3, brand.g4, t * 0.7)!;

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [c1, c2, c3],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: logoWidth.clamp(
                          AppSizes.splashLogoMinWidth,
                          AppSizes.splashLogoMaxWidth,
                        ),
                        maxHeight: logoHeight.clamp(
                          AppSizes.splashLogoMinHeight,
                          AppSizes.splashLogoMaxHeight,
                        ),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.logo,
                        width: logoWidth.clamp(
                          AppSizes.splashLogoMinWidth,
                          AppSizes.splashLogoMaxWidth,
                        ),
                        height: logoHeight.clamp(
                          AppSizes.splashLogoMinHeight,
                          AppSizes.splashLogoMaxHeight,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    AnimatedBuilder(
                      animation: _fadeAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _slideAnimation.value),
                          child: Opacity(
                            opacity: _fadeAnimation.value,
                            child: Text(
                              AppTexts.splashTitle,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: brand.text,
                                fontSize: companionFontSize.clamp(
                                  AppSizes.splashTextMinFont,
                                  AppSizes.splashTextMaxFont,
                                ),
                                fontWeight: FontWeight.w400,
                                letterSpacing: screenWidth * 0.015,
                                shadows: [
                                  Shadow(
                                    blurRadius: AppSizes.splashTextShadowBlur,
                                    color: brand.textShadow,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
