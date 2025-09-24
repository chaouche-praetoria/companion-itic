import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.child,
    this.footer,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.resizeToAvoidBottomInset = true,
    this.footerHeightHint = 72,
  });

  final Widget child;
  final Widget? footer;
  final EdgeInsetsGeometry padding;
  final CrossAxisAlignment crossAxisAlignment;
  final bool resizeToAvoidBottomInset;
  final double footerHeightHint;

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    final bottomInset = viewInsets.bottom;

    final double reservedBottom = bottomInset > 0
        ? (bottomInset + 16.0)
        : (footer != null ? footerHeightHint + 16.0 : 16.0);

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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: padding.add(EdgeInsets.only(bottom: reservedBottom)),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      crossAxisAlignment: crossAxisAlignment,
                      children: [child],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: (footer == null)
            ? null
            : SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: footer!,
          ),
        ),
      ),
    );
  }
}
