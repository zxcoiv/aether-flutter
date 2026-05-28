import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_event.dart';
import 'package:aether_app/navigation/app_routes.dart';
import 'package:aether_app/ui/screens/splash_screen.dart';
import 'package:aether_app/ui/screens/intro_screen.dart';
import 'package:aether_app/ui/screens/home_screen.dart';
import 'package:aether_app/ui/screens/events_screen.dart';
import 'package:aether_app/ui/screens/event_detail_screen.dart';
import 'package:aether_app/ui/screens/satellites_screen.dart';
import 'package:aether_app/ui/screens/alerts_screen.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(
            onFinish: () {
              Navigator.pushReplacementNamed(context, AppRoutes.intro);
            },
          ),
        );

      case AppRoutes.intro:
        return MaterialPageRoute(
          builder: (context) => IntroScreen(
            onFinish: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
          ),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            onEventsClick: () {
              Navigator.pushNamed(context, AppRoutes.events);
            },
            onSatellitesClick: () {
              Navigator.pushNamed(context, AppRoutes.satellites);
            },
            onAlertsClick: () {
              Navigator.pushNamed(context, AppRoutes.alerts);
            },
            onEventClick: (event) {
              Navigator.pushNamed(
                context,
                AppRoutes.eventDetail,
                arguments: event,
              );
            },
          ),
        );

      case AppRoutes.events:
        return MaterialPageRoute(
          builder: (context) => EventsScreen(
            onEventClick: (event) {
              Navigator.pushNamed(
                context,
                AppRoutes.eventDetail,
                arguments: event,
              );
            },
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.eventDetail:
        final event = settings.arguments as EnvironmentalEvent?;
        return MaterialPageRoute(
          builder: (context) => EventDetailScreen(
            event: event,
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.satellites:
        return MaterialPageRoute(
          builder: (context) => SatellitesScreen(
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.alerts:
        return MaterialPageRoute(
          builder: (context) => AlertsScreen(
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Rota não encontrada')),
          ),
        );
    }
  }
}
