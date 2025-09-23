import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import '../constants/app_colors.dart';
import '../constants/app_durations.dart';
import '../constants/app_texts.dart';
import '../constants/app_sizes.dart';
import '../constants/app_assets.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _gradientController;
  late AnimationController _textController;

  late Animation<double> _gradientAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _gradientController = AnimationController(
      duration: AppDurations.splashGradient,
      vsync: this,
    );

    _textController = AnimationController(
      duration: AppDurations.splashText,
      vsync: this,
    );

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

    _gradientController.repeat(reverse: true);
    _textController.forward();

    Timer.periodic(AppDurations.splashTimer, (timer) {
      timer.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    final logoWidth = screenWidth * 0.6;
    final logoHeight = screenHeight * 0.15;
    final companionFontSize = screenWidth * 0.055;

    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge(
          [_gradientAnimation, _fadeAnimation, _slideAnimation],
        ),
        builder: (context, child) {
          final gradientValue = _gradientAnimation.value;

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(
                    AppColors.splashGradient1,
                    AppColors.splashGradient2,
                    gradientValue * 0.8,
                  )!,
                  Color.lerp(
                    AppColors.splashGradient2,
                    AppColors.splashGradient3,
                    gradientValue * 0.9,
                  )!,
                  Color.lerp(
                    AppColors.splashGradient3,
                    AppColors.splashGradient4,
                    gradientValue * 0.7,
                  )!,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Container(
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
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                                fontSize: companionFontSize.clamp(
                                  AppSizes.splashTextMinFont,
                                  AppSizes.splashTextMaxFont,
                                ),
                                fontWeight: FontWeight.w400,
                                letterSpacing: screenWidth * 0.015,
                                shadows: [
                                  const Shadow(
                                    blurRadius: AppSizes.splashTextShadowBlur,
                                    color: AppColors.whiteShadow,
                                    offset: Offset(0, 0),
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
