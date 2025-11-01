import 'package:flutter/material.dart';

@immutable
class BrandGradients extends ThemeExtension<BrandGradients> {
  final Color g1, g2, g3, g4;
  final Color text;
  final Color textShadow;

  const BrandGradients({
    required this.g1,
    required this.g2,
    required this.g3,
    required this.g4,
    required this.text,
    required this.textShadow,
  });

  @override
  BrandGradients copyWith({
    Color? g1, Color? g2, Color? g3, Color? g4,
    Color? text, Color? textShadow,
  }) {
    return BrandGradients(
      g1: g1 ?? this.g1,
      g2: g2 ?? this.g2,
      g3: g3 ?? this.g3,
      g4: g4 ?? this.g4,
      text: text ?? this.text,
      textShadow: textShadow ?? this.textShadow,
    );
  }

  @override
  BrandGradients lerp(ThemeExtension<BrandGradients>? other, double t) {
    if (other is! BrandGradients) return this;
    return BrandGradients(
      g1: Color.lerp(g1, other.g1, t)!,
      g2: Color.lerp(g2, other.g2, t)!,
      g3: Color.lerp(g3, other.g3, t)!,
      g4: Color.lerp(g4, other.g4, t)!,
      text: Color.lerp(text, other.text, t)!,
      textShadow: Color.lerp(textShadow, other.textShadow, t)!,
    );
  }
}
