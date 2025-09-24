mixin ResponsiveMixin {
  // Breakpoints
  bool isSmallScreen(double height) => height < 700;
  bool isMediumScreen(double height) => height >= 700 && height < 900;
  bool isLargeScreen(double height) => height >= 900;
  
  double getResponsiveTitleSize(double screenWidth) => 
    (screenWidth * 0.07).clamp(24.0, 32.0);
  
  double getResponsiveSubtitleSize(double screenWidth) => 
    (screenWidth * 0.04).clamp(14.0, 18.0);
  
  double getResponsiveButtonSize(double screenWidth) => 
    (screenWidth * 0.045).clamp(16.0, 22.0);
  
  double getResponsiveDescriptionSize(double screenWidth) => 
    (screenWidth * 0.035).clamp(12.0, 16.0);
  
  double getResponsiveButtonHeight(double screenHeight) => 
    (screenHeight * 0.07).clamp(50.0, 70.0);
  
  double getTopSpacing(double screenHeight, bool isSmall, bool isMedium) =>
    screenHeight * (isSmall ? 0.05 : (isMedium ? 0.07 : 0.08));
  
  double getBottomSpacing(double screenHeight, bool isSmall) =>
    screenHeight * (isSmall ? 0.03 : 0.05);
  
  double getHorizontalPadding(double screenWidth) => screenWidth * 0.08;
}
