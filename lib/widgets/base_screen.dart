import 'package:flutter/material.dart';
import '../utils/theme/brand_gradients.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.child,
    this.footer,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.resizeToAvoidBottomInset = false,
    this.footerHeightHint = 72,
    this.enableScroll = true,
    this.customLayout = false,
    this.animateFooterWithKeyboard = true,
  });

  final Widget child;
  final Widget? footer;
  final EdgeInsetsGeometry padding;
  final CrossAxisAlignment crossAxisAlignment;
  final bool resizeToAvoidBottomInset;
  final double footerHeightHint;
  final bool enableScroll;
  final bool customLayout;
  final bool animateFooterWithKeyboard;

  BrandGradients _brand(BuildContext context) {
    final ext = Theme.of(context).extension<BrandGradients>();
    if (ext != null) return ext;

    // Fallback si l’extension n’est pas attachée
    final cs = Theme.of(context).colorScheme;
    return BrandGradients(
      g1: cs.primary,
      g2: cs.primaryContainer,
      g3: cs.secondary,
      g4: cs.tertiary,
      text: cs.onBackground,
      textShadow: Colors.white24,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    final bottomInset = viewInsets.bottom;
    final isKeyboardVisible = bottomInset > 0;
    final brand = _brand(context);

    // Espace réservé contenu (footer/clavier)
    final double reservedBottom = isKeyboardVisible
        ? (bottomInset + 16.0)
        : (footer != null ? footerHeightHint + 32.0 : 16.0);

    return Container(
      // 🎨 Fond dégradé lié au thème (g1→g3)
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [brand.g1, brand.g2, brand.g3],
          stops: const [0.0, 0.5, 1.0],
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
                      final contentPadding = padding.add(
                        EdgeInsets.only(bottom: reservedBottom),
                      );

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
        bottomNavigationBar: (footer == null)
            ? null
            : animateFooterWithKeyboard
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(0, -bottomInset, 0),
                    child: _FooterShell(brand: brand, child: footer!),
                  )
                : _FooterShell(brand: brand, child: footer!),
      ),
    );
  }
}

class _FooterShell extends StatelessWidget {
  const _FooterShell({required this.brand, required this.child});

  final BrandGradients brand;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [brand.g4.withOpacity(0), brand.g4],
        ),
      ),
      child: SafeArea(top: false, child: child),
    );
  }
}
