import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BaseScreen extends StatelessWidget {
  final Widget child; // ton contenu principal (scrollable)
  final Widget? footer; // bouton ou actions en bas
  final bool resizeToAvoidBottomInset;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry padding;

  const BaseScreen({
    super.key,
    required this.child,
    this.footer,
    this.resizeToAvoidBottomInset = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    final bottomInset = viewInsets.bottom;
    final paddingBottom = bottomInset + 24;

    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientLight,
              AppColors.gradientDark,
            ],
          ),
        ),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    // contenu scrollable
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 24),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight - paddingBottom,
                          ),
                          child: Padding(
                            padding: padding,
                            child: Column(
                              crossAxisAlignment: crossAxisAlignment,
                              children: [
                                child,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // footer sticky (ex: bouton)
                    if (footer != null)
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: bottomInset > 0 ? bottomInset : 24,
                          top: 8,
                        ),
                        child: footer!,
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
