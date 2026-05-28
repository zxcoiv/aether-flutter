import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_event.dart';
import 'package:aether_app/model/satellite.dart';
import 'package:aether_app/repository/alert_repository.dart';
import 'package:aether_app/repository/event_repository.dart';
import 'package:aether_app/repository/satellite_repository.dart';
import 'package:aether_app/ui/components/aether_top_app_bar.dart';
import 'package:aether_app/ui/components/event_list_card.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onEventsClick;
  final VoidCallback onSatellitesClick;
  final VoidCallback onAlertsClick;
  final ValueChanged<EnvironmentalEvent> onEventClick;

  const HomeScreen({
    super.key,
    required this.onEventsClick,
    required this.onSatellitesClick,
    required this.onAlertsClick,
    required this.onEventClick,
  });

  @override
  Widget build(BuildContext context) {
    final activeEvents = getActiveEvents();
    final totalAlerts = getAllAlerts().length;
    final satellites = getAllSatellites();
    final recentEvents = getAllEvents().take(3).toList();
    final operationalSats =
        satellites.where((s) => s.status == SatelliteStatus.operational).length;

    return Scaffold(
      appBar: const AetherTopBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard Ambiental',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Monitoramento via satélite em tempo real',
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                _StatCard(label: 'Eventos Ativos', value: '${activeEvents.length}'),
                const SizedBox(width: 8),
                _StatCard(label: 'Alertas', value: '$totalAlerts'),
                const SizedBox(width: 8),
                _StatCard(
                  label: 'Satélites',
                  value: '$operationalSats/${satellites.length}',
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'Módulos',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onEventsClick,
                    icon: const Icon(Icons.public),
                    label: const Text('Eventos'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onSatellitesClick,
                    icon: const Icon(Icons.satellite_alt),
                    label: const Text('Satélites'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onAlertsClick,
                    icon: const Icon(Icons.warning_amber),
                    label: const Text('Alertas'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Eventos Recentes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: onEventsClick,
                  child: const Text('Ver todos'),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ...recentEvents.map(
              (event) => EventListCard(event: event, onClick: onEventClick),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(label, style: const TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}
