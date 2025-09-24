import 'package:flutter/material.dart';

class SmartScrollableScreen extends StatelessWidget {
  const SmartScrollableScreen({
    super.key,
    required this.child,
    required this.scrollController,
    required this.estimatedContentHeight,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.bottomPadding = 20,
    this.keyboardExtraPadding = 40,
    this.buttonContainerHeight = 0,
  });

  final Widget child;
  final ScrollController scrollController;
  final double estimatedContentHeight;
  final EdgeInsetsGeometry padding;
  final double bottomPadding;
  final double keyboardExtraPadding;
  final double buttonContainerHeight;

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        final needsScroll =
            isKeyboardVisible || estimatedContentHeight > availableHeight;

        if (needsScroll) {
          return SingleChildScrollView(
            controller: scrollController,
            padding: padding,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: isKeyboardVisible
                    ? keyboardHeight +
                        buttonContainerHeight +
                        keyboardExtraPadding
                    : bottomPadding,
              ),
              child: child,
            ),
          );
        } else {
          return Padding(
            padding: padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Flexible(child: child)],
            ),
          );
        }
      },
    );
  }
}
