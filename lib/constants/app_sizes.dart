class AppSizes {
  static const double bigTitleFontSize = 38;
  static const double titleFontSize = 28;
  static const double subtitleFontSize = 16;
  static const double forgotPasswordFontSize = 14;
  static const double buttonFontSize = 18;

  static const double borderRadius = 12;
  static const double buttonRadius = 28;
  static const double borderWidth = 1.5;

  static const double inputHorizontalPadding = 20;
  static const double inputVerticalPadding = 18;
  static const double buttonHeight = 56;

  static const double splashLogoMinWidth = 200.0;
  static const double splashLogoMaxWidth = 350.0;
  static const double splashLogoMinHeight = 60.0;
  static const double splashLogoMaxHeight = 120.0;

  static const double splashTextMinFont = 18.0;
  static const double splashTextMaxFont = 28.0;

  static const double splashTextShadowBlur = 10.0;

  static double getResponsiveSize(double screenWidth, double baseRatio) {
    return screenWidth * baseRatio;
  }
  
  static double getResponsiveHeight(double screenHeight, double baseRatio) {
    return screenHeight * baseRatio;
  }
  
  static bool isSmallScreen(double height) => height < 700;
  static bool isMediumScreen(double height) => height >= 700 && height < 900;
  static bool isLargeScreen(double height) => height >= 900;
  
  static const double minTitleSize = 24.0;
  static const double maxTitleSize = 32.0;
  static const double minSubtitleSize = 14.0;
  static const double maxSubtitleSize = 18.0;
  static const double minButtonSize = 16.0;
  static const double maxButtonSize = 22.0;
  
  static const double titleRatio = 0.07; 
  static const double subtitleRatio = 0.04;
  static const double buttonRatio = 0.045; 
}