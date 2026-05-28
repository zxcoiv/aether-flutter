import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aether_app/navigation/app_navigation.dart';
import 'package:aether_app/navigation/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AETHER',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MouseScrollBehavior(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF00D4FF),
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}

class MouseScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
