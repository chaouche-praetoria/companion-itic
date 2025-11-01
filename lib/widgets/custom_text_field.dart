import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_sizes.dart';
import '../utils/theme/brand_gradients.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final VoidCallback? onSubmitted;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;
    final fontSize = isSmallScreen ? 14.0 : 16.0;

    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final brand = theme.extension<BrandGradients>();
    final isDark = theme.brightness == Brightness.dark;

    final bgColor   = isDark ? Colors.black : Colors.white;
    final textColor = brand?.text ?? (isDark ? Colors.white : Colors.black87);
    final hintColor = cs.onSurfaceVariant;
    final borderColor =
    cs.outlineVariant.withOpacity(isDark ? 0.35 : 0.25);
    final focusedBorderColor = cs.primary;

    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onSubmitted: (_) => onSubmitted?.call(),
      cursorColor: cs.primary,
      style: GoogleFonts.inter(
        color: textColor,
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: bgColor,
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: hintColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.inputHorizontalPadding,
          vertical: isSmallScreen
              ? AppSizes.inputVerticalPadding * 0.8
              : AppSizes.inputVerticalPadding,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: BorderSide(color: borderColor, width: AppSizes.borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: BorderSide(color: focusedBorderColor, width: AppSizes.borderWidth),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: BorderSide(color: cs.error.withOpacity(0.9), width: AppSizes.borderWidth),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: BorderSide(color: cs.error, width: AppSizes.borderWidth),
        ),
      ),
    );
  }
}
