import 'package:flutter/material.dart';

class BadgeHomeScreen extends StatelessWidget {
  const BadgeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.qr_code_scanner, size: 72, color: Colors.white),
    );
  }
}