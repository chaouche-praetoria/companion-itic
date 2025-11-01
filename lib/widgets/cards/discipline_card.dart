import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_sizes.dart';
import '../../utils/theme/brand_gradients.dart';

class CurrentDisciplineCard extends StatelessWidget {
  final Size screenSize;
  final String startTime;
  final String teacherName;
  final String subject;
  final String room;
  /// Couleur du liseré vertical gauche ; par défaut la primaire du thème.
  final Color? color;

  const CurrentDisciplineCard({
    super.key,
    required this.screenSize,
    required this.startTime,
    required this.teacherName,
    required this.subject,
    required this.room,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final brand = theme.extension<BrandGradients>();
    final isDark = theme.brightness == Brightness.dark;

    // ✅ Fond strict : blanc (light) / noir (dark)
    final bgColor = isDark ? Colors.black : Colors.white;

    // Texte contrasté (privilégie BrandGradients.text si présent)
    final textColor = brand?.text ??
        (isDark ? Colors.white : Colors.black87);

    final subTextColor = textColor.withOpacity(isDark ? 0.9 : 0.85);
    final borderColor = cs.outlineVariant.withOpacity(isDark ? 0.3 : 0.2);
    final accent = color ?? cs.primary;

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.10,
      margin: EdgeInsets.only(top: screenSize.height * 0.01),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Liseré + heure/prof
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: screenSize.height * 0.075,
                margin: EdgeInsets.only(left: screenSize.width * 0.03),
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
              SizedBox(width: screenSize.width * 0.03),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    startTime,
                    style: GoogleFonts.inter(
                      color: subTextColor,
                      fontSize: AppSizes.forgotPasswordFontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.005),
                  Text(
                    teacherName,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      color: textColor,
                      fontSize: AppSizes.forgotPasswordFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Matière (centre)
          SizedBox(width: screenSize.width * 0.03),
          Expanded(
            child: Text(
              subject,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: textColor,
                fontSize: AppSizes.subtitleFontSize,
                fontWeight: FontWeight.w800,
                shadows: [
                  if (brand != null)
                    Shadow(blurRadius: 4, color: brand.textShadow),
                ],
              ),
            ),
          ),

          // Salle (droite)
          SizedBox(width: screenSize.width * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  room,
                  style: GoogleFonts.inter(
                    color: textColor,
                    fontSize: AppSizes.subtitleFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}