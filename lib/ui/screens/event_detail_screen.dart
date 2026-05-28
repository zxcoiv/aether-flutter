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
        return const Color(0xFFFF3B5C);
      case Severity.high:
        return const Color(0xFFFFB830);
      case Severity.medium:
        return const Color(0xFF4A9EFF);
      default:
        return const Color(0xFF00CC66);
    }
  }

  Color get _statusColor {
    switch (event?.status) {
      case EventStatus.active:
        return const Color(0xFFFF3B5C);
      case EventStatus.monitoring:
        return const Color(0xFFFFB830);
      default:
        return const Color(0xFF00CC66);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (event == null) {
      return Scaffold(
        appBar: AetherTopBar(
          title: 'DETALHE',
          showBack: true,
          onBackClick: onBackClick,
        ),
        body: const Center(child: Text('Evento não encontrado')),
      );
    }

    return Scaffold(
      appBar: AetherTopBar(
        title: 'DETALHE',
        showBack: true,
        onBackClick: onBackClick,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _severityColor.withValues(alpha: 0.4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: _severityColor.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        event!.type.icon,
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event!.type.label.toUpperCase(),
                              style: TextStyle(
                                color: _severityColor,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Text(
                              event!.title,
                              style: const TextStyle(
                                color: Color(0xFFE8F0FE),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _Badge(label: event!.severity.label, color: _severityColor),
                      const SizedBox(width: 8),
                      _Badge(label: event!.status.label, color: _statusColor),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const _SectionLabel(label: 'DESCRIÇÃO'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF1E2D45)),
              ),
              child: Text(
                event!.description,
                style: const TextStyle(
                  color: Color(0xFF8B9EC7),
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const _SectionLabel(label: 'DADOS DO EVENTO'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF1E2D45)),
              ),
              child: Column(
                children: [
                  _DataRow(icon: Icons.tag, label: 'ID', value: event!.id),
                  _DataRow(
                    icon: Icons.location_on,
                    label: 'Região',
                    value: event!.region,
                  ),
                  _DataRow(
                    icon: Icons.satellite_alt,
                    label: 'Satélite',
                    value: event!.satellite,
                  ),
                  _DataRow(
                    icon: Icons.crop_free,
                    label: 'Área Afetada',
                    value: '${event!.affectedAreaKm2.toStringAsFixed(1)} km²',
                  ),
                  _DataRow(
                    icon: Icons.access_time,
                    label: 'Detectado em',
                    value: event!.detectedAt,
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF8B9EC7),
        fontSize: 11,
        letterSpacing: 2,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const _DataRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Icon(icon, size: 16, color: const Color(0xFF00D4FF)),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF8B9EC7),
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFFE8F0FE),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(height: 1, color: const Color(0xFF1E2D45)),
      ],
    );
  }
}
