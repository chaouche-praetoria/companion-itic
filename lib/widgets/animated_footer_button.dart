import 'package:flutter/material.dart';

class AnimatedFooterButton extends StatelessWidget {
  const AnimatedFooterButton({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedContainer(
      duration: duration,
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(0, -keyboardHeight, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
