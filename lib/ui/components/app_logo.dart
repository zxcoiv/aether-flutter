import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'AETHER',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
      ),
    );
  }
}
