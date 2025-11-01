// lib/screens/login_screen.dart
import 'package:companion/mixins/auto_scroll_ixin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_texts.dart';
import '../utils/theme/brand_gradients.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/smart_scrollable_screen.dart';
import '../widgets/animated_footer_button.dart';
import '../mixins/responsive_mixin.dart';
import '../utils/content_height_calculator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with ResponsiveMixin, AutoScrollMixin {
  final TextEditingController _identifiantController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    registerField('identifiant', focusNode: FocusNode());
    registerField('motdepasse', focusNode: FocusNode());
  }

  @override
  void dispose() {
    _identifiantController.dispose();
    _motDePasseController.dispose();
    super.dispose();
  }

  BrandGradients _brand(BuildContext context) {
    final ext = Theme.of(context).extension<BrandGradients>();
    if (ext != null) return ext;

    // Fallback simple si l’extension n’est pas présente sur ce thème
    final cs = Theme.of(context).colorScheme;
    return BrandGradients(
      g1: cs.primary,
      g2: cs.primaryContainer,
      g3: cs.secondary,
      g4: cs.tertiary,
      text: cs.onSurface,
      textShadow: Colors.white24,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;
    final isSmall = isSmallScreen(screenHeight);
    final isMedium = isMediumScreen(screenHeight);
    final buttonHeight = getResponsiveButtonHeight(screenHeight);
    final buttonContainerHeight = buttonHeight + 32 + 16;

    final estimatedContentHeight =
    ContentHeightCalculator.calculateLoginContentHeight(
      screenHeight,
      isSmall,
      isMedium,
      isKeyboardVisible,
      this,
    );

    final brand = _brand(context);

    // ⚠️ Si BaseScreen applique déjà un fond dégradé issu du thème,
    // garde tel quel. Sinon, encapsule BaseScreen dans ThemedBackground (voir plus bas).
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
              child: _buildContent(brand),
            ),
          ),
          AnimatedFooterButton(
            child: CustomButton(
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
              height: buttonHeight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BrandGradients brand) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    final isSmall = isSmallScreen(screenHeight);
    final isMedium = isMediumScreen(screenHeight);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getTopSpacing(screenHeight, isSmall, isMedium)),

        // Titre
        Text(
          AppTexts.loginTitle,
          style: GoogleFonts.inter(
            color: brand.text,
            fontWeight: FontWeight.w600,
            fontSize: getResponsiveTitleSize(screenWidth),
            shadows: [
              Shadow(
                blurRadius: 8,
                color: brand.textShadow,
              ),
            ],
          ),
        ),

        SizedBox(height: screenHeight * (isSmall ? 0.01 : 0.015)),

        // Sous-titre
        Text(
          AppTexts.loginSubtitle,
          style: GoogleFonts.inter(
            color: brand.text.withOpacity(0.8),
            fontWeight: FontWeight.w400,
            fontSize: getResponsiveSubtitleSize(screenWidth),
            height: 1.4,
          ),
        ),

        SizedBox(
          height: screenHeight * (isSmall ? 0.04 : (isMedium ? 0.05 : 0.06)),
        ),

        // Champs
        buildFieldWithKey(
          'identifiant',
          CustomTextField(
            controller: _identifiantController,
            focusNode: focusNodes['identifiant'],
            hint: AppTexts.hintIdentifiant,
          ),
        ),

        SizedBox(height: screenHeight * (isSmall ? 0.02 : 0.025)),

        buildFieldWithKey(
          'motdepasse',
          CustomTextField(
            controller: _motDePasseController,
            focusNode: focusNodes['motdepasse'],
            hint: AppTexts.hintMotDePasse,
            obscureText: true,
          ),
        ),

        SizedBox(height: screenHeight * (isSmall ? 0.015 : 0.02)),

        // Lien "mot de passe oublié"
        Center(
          child: TextButton(
            onPressed: () => debugPrint("Mot de passe oublié cliqué"),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: isSmall ? 8 : 12,
                horizontal: 16,
              ),
              foregroundColor: brand.text.withOpacity(0.85),
            ),
            child: Text(
              AppTexts.forgotPassword,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: brand.text.withOpacity(0.85),
                fontWeight: FontWeight.w400,
                fontSize: getResponsiveDescriptionSize(screenWidth),
                height: 1.3,
              ),
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
}
