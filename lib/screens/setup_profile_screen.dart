import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_texts.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../mixins/responsive_mixin.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> with ResponsiveMixin {
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

    final isSmall = isSmallScreen(screenHeight);
    final isMedium = isMediumScreen(screenHeight);
    final avatarRadius = isSmall ? 80.0 : (isMedium ? 90.0 : 100.0);

    return BaseScreen(
      footer: CustomButton(
        text: AppTexts.finishSetupButton,
        onPressed: () {
          debugPrint('Pseudonyme: ${_pseudonymeController.text}');

          Navigator.of(context).pushNamedAndRemoveUntil(
            '/home',
                (route) => false,
          );
        },
        width: double.infinity,
        height: getResponsiveButtonHeight(screenHeight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: getTopSpacing(screenHeight, isSmall, isMedium)),
          Text(
            AppTexts.finishSetupTitle,
            style: TextStyle(
              color: AppColors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: getResponsiveTitleSize(screenWidth),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              AppTexts.finishSetupSubtitle,
              style: TextStyle(
                color: AppColors.white.withOpacity(0.8),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: getResponsiveSubtitleSize(screenWidth),
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: screenHeight * (isSmall ? 0.04 : 0.06)),
          _buildProfileAvatar(avatarRadius),
          SizedBox(height: screenHeight * (isSmall ? 0.05 : 0.08)),
          CustomTextField(
            controller: _pseudonymeController,
            hint: AppTexts.hintPseudo,
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              AppTexts.finishPseudoDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white.withOpacity(0.7),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: getResponsiveDescriptionSize(screenWidth),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileAvatar(double radius) {
    return GestureDetector(
      onTap: () => debugPrint('Sélectionner une photo de profil'),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: AppColors.white.withOpacity(0.2),
          child: const Icon(
            Icons.person,
            color: AppColors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
