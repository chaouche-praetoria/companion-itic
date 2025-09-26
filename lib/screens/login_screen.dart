import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_texts.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../mixins/responsive_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ResponsiveMixin {
  final TextEditingController _identifiantController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();

  @override
  void dispose() {
    _identifiantController.dispose();
    _motDePasseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    final isSmall = isSmallScreen(screenHeight);
    final isMedium = isMediumScreen(screenHeight);

    return BaseScreen(
      footer: CustomButton(
        text: AppTexts.nextButton,
        onPressed: () {
          debugPrint('Identifiant: ${_identifiantController.text}');
          debugPrint('Mot de passe: ${_motDePasseController.text}');
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/setup-profile',
            (route) => false,
          );
        },
        width: double.infinity,
        height: getResponsiveButtonHeight(screenHeight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: getTopSpacing(screenHeight, isSmall, isMedium)),
          Text(
            AppTexts.loginTitle,
            style: GoogleFonts.inter(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: getResponsiveTitleSize(screenWidth),
            ),
          ),
          SizedBox(height: screenHeight * (isSmall ? 0.01 : 0.015)),
          Text(
            AppTexts.loginSubtitle,
            style: GoogleFonts.inter(
              color: AppColors.white.withOpacity(0.8),
              fontWeight: FontWeight.w400,
              fontSize: getResponsiveSubtitleSize(screenWidth),
              height: 1.4,
            ),
          ),
          SizedBox(height: screenHeight * (isSmall ? 0.04 : (isMedium ? 0.05 : 0.06))),
          CustomTextField(
            controller: _identifiantController,
            hint: AppTexts.hintIdentifiant,
          ),
          SizedBox(height: screenHeight * (isSmall ? 0.02 : 0.025)),
          CustomTextField(
            controller: _motDePasseController,
            hint: AppTexts.hintMotDePasse,
            obscureText: true,
          ),
          SizedBox(height: screenHeight * (isSmall ? 0.015 : 0.02)),
          Center(
            child: TextButton(
              onPressed: () => debugPrint("Mot de passe oublié cliqué"),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: isSmall ? 8 : 12,
                  horizontal: 16,
                ),
              ),
              child: Text(
                AppTexts.forgotPassword,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                  fontSize: getResponsiveDescriptionSize(screenWidth),
                  height: 1.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
