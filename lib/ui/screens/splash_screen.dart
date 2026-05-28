import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinish;

  const SplashScreen({super.key, required this.onFinish});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) widget.onFinish();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.satellite_alt,
              color: Color(0xFF00D4FF),
              size: 80,
            ),
            const SizedBox(height: 24),
            const Text(
              'AETHER',
              style: TextStyle(
                color: Color(0xFF00D4FF),
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 6,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Monitoramento Ambiental via Satélite',
              style: TextStyle(
                color: Color(0xFF8B9EC7),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
