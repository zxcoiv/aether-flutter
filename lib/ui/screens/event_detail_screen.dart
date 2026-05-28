import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_event.dart';
import 'package:aether_app/ui/components/aether_top_app_bar.dart';

class EventDetailScreen extends StatelessWidget {
  final EnvironmentalEvent? event;
  final VoidCallback onBackClick;

  const EventDetailScreen({
    super.key,
    required this.event,
    required this.onBackClick,
  });

  Color get _severityColor {
    switch (event?.severity) {
      case Severity.critical:
        return Colors.red;
      case Severity.high:
        return Colors.orange;
      case Severity.medium:
        return Colors.blue;
      default:
        return Colors.green;
    }
  }

  Color get _statusColor {
    switch (event?.status) {
      case EventStatus.active:
        return Colors.red;
      case EventStatus.monitoring:
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (event == null) {
      return Scaffold(
        appBar: AetherTopBar(
          title: 'Detalhe',
          showBack: true,
          onBackClick: onBackClick,
        ),
        body: const Center(child: Text('Evento não encontrado')),
      );
    }

    return Scaffold(
      appBar: AetherTopBar(
        title: 'Detalhe',
        showBack: true,
        onBackClick: onBackClick,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(event!.type.icon, style: const TextStyle(fontSize: 32)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            event!.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Chip(
                          label: Text(event!.severity.label),
                          labelStyle: TextStyle(color: _severityColor),
                        ),
                        const SizedBox(width: 8),
                        Chip(
                          label: Text(event!.status.label),
                          labelStyle: TextStyle(color: _statusColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Descrição',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(event!.description),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Dados do Evento',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.tag),
                    title: const Text('ID'),
                    trailing: Text(event!.id),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Região'),
                    trailing: Text(event!.region),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.satellite_alt),
                    title: const Text('Satélite'),
                    trailing: Text(event!.satellite),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.crop_free),
                    title: const Text('Área Afetada'),
                    trailing: Text('${event!.affectedAreaKm2.toStringAsFixed(1)} km²'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Detectado em'),
                    trailing: Text(event!.detectedAt),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
