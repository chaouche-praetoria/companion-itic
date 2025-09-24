// lib/widgets/base_screen.dart
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.child,
    this.footer,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.resizeToAvoidBottomInset =
        false, // Changé par défaut pour une meilleure gestion
    this.footerHeightHint = 72,
    this.enableScroll = true,
    this.customLayout = false,
    this.animateFooterWithKeyboard = true, // Nouveau paramètre
  });

  final Widget child;
  final Widget? footer;
  final EdgeInsetsGeometry padding;
  final CrossAxisAlignment crossAxisAlignment;
  final bool resizeToAvoidBottomInset;
  final double footerHeightHint;
  final bool enableScroll;
  final bool customLayout;
  final bool
      animateFooterWithKeyboard; // Permet d'activer/désactiver l'animation

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    final bottomInset = viewInsets.bottom;
    final isKeyboardVisible = bottomInset > 0;

    // Calcul de l'espace réservé pour le contenu
    final double reservedBottom = isKeyboardVisible
        ? (bottomInset + 16.0) // Espace au-dessus du clavier
        : (footer != null
            ? footerHeightHint + 32.0
            : 16.0); // Espace pour le footer

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.gradientLight, AppColors.gradientDark],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: customLayout
                ? child
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final contentPadding = padding.add(EdgeInsets.only(
                        bottom: reservedBottom,
                      ));

                      if (enableScroll) {
                        return SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          padding: contentPadding,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight -
                                  contentPadding.vertical,
                            ),
                            child: Column(
                              crossAxisAlignment: crossAxisAlignment,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [child],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: contentPadding,
                          child: Column(
                            crossAxisAlignment: crossAxisAlignment,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [child],
                          ),
                        );
                      }
                    },
                  ),
          ),
        ),
        // Footer avec animation fluide automatique
        bottomNavigationBar: (footer == null)
            ? null
            : animateFooterWithKeyboard
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(0, -bottomInset, 0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.gradientDark.withAlpha(0),
                            AppColors.gradientDark,
                          ],
                        ),
                      ),
                      child: SafeArea(
                        top: false,
                        child: footer!,
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.gradientDark.withAlpha(0),
                          AppColors.gradientDark,
                        ],
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      child: footer!,
                    ),
                  ),
      ),
    );
  }
}
