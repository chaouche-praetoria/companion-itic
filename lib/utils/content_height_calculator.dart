import '../mixins/responsive_mixin.dart';

class ContentHeightCalculator {
  static double calculateLoginContentHeight(
    double screenHeight,
    bool isSmall,
    bool isMedium,
    bool isKeyboardVisible,
    ResponsiveMixin responsive,
  ) {
    return responsive.getTopSpacing(screenHeight, isSmall, isMedium) +
        50 +
        (screenHeight * (isSmall ? 0.01 : 0.015)) +
        60 +
        (screenHeight * (isSmall ? 0.04 : (isMedium ? 0.05 : 0.06))) +
        60 +
        (screenHeight * (isSmall ? 0.02 : 0.025)) +
        60 +
        (screenHeight * (isSmall ? 0.015 : 0.02)) +
        40 +
        (isKeyboardVisible ? 30 : 80);
  }

  static double calculateSetupProfileContentHeight(
    double screenHeight,
    bool isSmall,
    bool isMedium,
    bool isKeyboardVisible,
    double avatarRadius,
    ResponsiveMixin responsive,
  ) {
    return responsive.getTopSpacing(screenHeight, isSmall, isMedium) +
        50 +
        (screenHeight * 0.02) +
        60 +
        (screenHeight * (isSmall ? 0.04 : 0.06)) +
        (avatarRadius * 2) +
        (screenHeight * (isSmall ? 0.05 : 0.08)) +
        60 +
        (screenHeight * 0.03) +
        40 +
        (isKeyboardVisible ? 30 : 80);
  }
}
