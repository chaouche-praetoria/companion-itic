import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_texts.dart';
import '../constants/app_sizes.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  final TextEditingController _pseudonymeController = TextEditingController();

  @override
  void dispose() {
    _pseudonymeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.gradientLight, AppColors.gradientDark],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bottomInset =
                  MediaQuery.viewInsetsOf(context).bottom; // hauteur clavier
              return GestureDetector(
                onTap: () =>
                    FocusScope.of(context).unfocus(), // ferme le clavier au tap
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: bottomInset + 24), // laisse la place au clavier
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * 0.10),
                            Text(
                              AppTexts.finishSetupTitle,
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                                fontSize: AppSizes.titleFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                              child: Text(
                                AppTexts.finishSetupSubtitle,
                                style: GoogleFonts.inter(
                                  color: AppColors.white.withValues(alpha: 0.8),
                                  fontSize: AppSizes.subtitleFontSize,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            CircleAvatar(
                              radius: 90,
                              backgroundImage: const NetworkImage(
                                  "https://picsum.photos/250?image=9"),
                              onBackgroundImageError: (_, __) {},
                            ),
                            SizedBox(height: screenHeight * 0.08),
                            _buildTextField(
                              controller: _pseudonymeController,
                              hint: AppTexts.hintPseudo,
                              obscure: false,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Center(
                              child: TextButton(
                                onPressed: () =>
                                    debugPrint("Mot de passe oublié cliqué"),
                                child: Text(
                                  AppTexts.finishPseudoDescription,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    color:
                                        AppColors.white.withValues(alpha: 0.8),
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
                              margin:
                                  EdgeInsets.only(bottom: screenHeight * 0.05),
                              child: ElevatedButton(
                                onPressed: () => debugPrint(
                                    'Identifiant: ${_pseudonymeController.text}'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.white,
                                  foregroundColor: AppColors.gradientDark,
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppSizes.buttonRadius),
                                  ),
                                ),
                                child: Text(
                                  AppTexts.finishSetupNextButton,
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
                ),
              );
            },
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
