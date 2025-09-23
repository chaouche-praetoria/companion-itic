import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_texts.dart';
import '../constants/app_sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

    final horizontalPadding = screenWidth * 0.08;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientLight,
              AppColors.gradientDark,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.08),
                Text(
                  AppTexts.loginTitle,
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontSize: AppSizes.titleFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  AppTexts.loginSubtitle,
                  style: GoogleFonts.inter(
                    color: AppColors.white.withValues(alpha: 0.8),
                    fontSize: AppSizes.subtitleFontSize,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                _buildTextField(
                  controller: _identifiantController,
                  hint: AppTexts.hintIdentifiant,
                  obscure: false,
                ),
                SizedBox(height: screenHeight * 0.025),
                _buildTextField(
                  controller: _motDePasseController,
                  hint: AppTexts.hintMotDePasse,
                  obscure: true,
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: TextButton(
                    onPressed: () {
                      debugPrint("Mot de passe oublié cliqué");
                    },
                    child: Text(
                      AppTexts.forgotPassword,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: AppColors.white.withValues(alpha: 0.8),
                        fontSize: AppSizes.forgotPasswordFontSize,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: AppSizes.buttonHeight,
                  margin: EdgeInsets.only(bottom: screenHeight * 0.05),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Identifiant: ${_identifiantController.text}');
                      debugPrint('Mot de passe: ${_motDePasseController.text}');

                      Navigator.of(context).pushNamedAndRemoveUntil('/setup-profile', (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.gradientDark,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizes.buttonRadius),
                      ),
                    ),
                    child: Text(
                      AppTexts.nextButton,
                      style: GoogleFonts.inter(
                        fontSize: AppSizes.buttonFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.3),
          width: AppSizes.borderWidth,
        ),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: GoogleFonts.inter(
          color: AppColors.white,
          fontSize: AppSizes.subtitleFontSize,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(
            color: AppColors.white.withValues(alpha: 0.6),
            fontSize: AppSizes.subtitleFontSize,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSizes.inputHorizontalPadding,
            vertical: AppSizes.inputVerticalPadding,
          ),
        ),
      ),
    );
  }
}
