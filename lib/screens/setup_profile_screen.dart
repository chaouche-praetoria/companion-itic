import 'package:companion/mixins/auto_scroll_ixin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_texts.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/smart_scrollable_screen.dart';
import '../widgets/animated_footer_button.dart';
import '../mixins/responsive_mixin.dart';
import '../utils/content_height_calculator.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile>
    with ResponsiveMixin, AutoScrollMixin {
  final TextEditingController _pseudonymeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    registerField('pseudonyme');
  }

  @override
  void dispose() {
    _pseudonymeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;
    final isSmall = isSmallScreen(screenHeight);
    final isMedium = isMediumScreen(screenHeight);
    final avatarRadius = isSmall ? 80.0 : (isMedium ? 90.0 : 100.0);
    final buttonHeight = getResponsiveButtonHeight(screenHeight);
    final buttonContainerHeight = buttonHeight + 32 + 16;

    final estimatedContentHeight =
        ContentHeightCalculator.calculateSetupProfileContentHeight(
      screenHeight,
      isSmall,
      isMedium,
      isKeyboardVisible,
      avatarRadius,
      this,
    );

    // Auto-scroll si clavier visible
    if (isKeyboardVisible) {
      scrollToField('pseudonyme');
    }

    return BaseScreen(
      customLayout: true,
      resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          Expanded(
            child: SmartScrollableScreen(
              scrollController: scrollController,
              estimatedContentHeight: estimatedContentHeight,
              buttonContainerHeight: buttonContainerHeight,
              child: _buildContent(),
            ),
          ),
          AnimatedFooterButton(
            child: CustomButton(
              text: AppTexts.finishSetupButton,
              onPressed: () {
                debugPrint('Pseudonyme: ${_pseudonymeController.text}');
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home', (route) => false);
              },
              width: double.infinity,
              height: buttonHeight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    final isSmall = isSmallScreen(screenHeight);
    final isMedium = isMediumScreen(screenHeight);
    final avatarRadius = isSmall ? 80.0 : (isMedium ? 90.0 : 100.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: getTopSpacing(screenHeight, isSmall, isMedium)),
        Text(
          AppTexts.finishSetupTitle,
          style: GoogleFonts.inter(
            color: AppColors.white,
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
            style: GoogleFonts.inter(
              color: AppColors.white.withAlpha(204),
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
        buildFieldWithKey(
          'pseudonyme',
          CustomTextField(
            controller: _pseudonymeController,
            hint: AppTexts.hintPseudo,
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            AppTexts.finishPseudoDescription,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: AppColors.white.withAlpha(179),
              fontWeight: FontWeight.w400,
              fontSize: getResponsiveDescriptionSize(screenWidth),
              height: 1.3,
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isKeyboardVisible ? 30 : 80,
        ),
      ],
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
              color: Colors.black.withAlpha(51),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: AppColors.white.withAlpha(51),
          child: const Icon(Icons.person, color: AppColors.white, size: 50),
        ),
      ),
    );
  }
}
