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
    final unreadAlerts = getUnreadAlerts();
    final satellites = getAllSatellites();
    final recentEvents = getAllEvents().take(3).toList();
    final operationalSats =
        satellites.where((s) => s.status == SatelliteStatus.operational).length;

    return Scaffold(
      appBar: AetherTopBar(
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFFE8F0FE),
                ),
                onPressed: onAlertsClick,
              ),
              if (unreadAlerts.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF3B5C),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${unreadAlerts.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard Ambiental',
              style: TextStyle(
                color: Color(0xFFE8F0FE),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Monitoramento via satélite em tempo real',
              style: TextStyle(color: Color(0xFF8B9EC7), fontSize: 13),
            ),
            const SizedBox(height: 20),

            // Stats
            Row(
              children: [
                _StatCard(
                  label: 'Eventos Ativos',
                  value: '${activeEvents.length}',
                  icon: Icons.warning_amber_rounded,
                  color: const Color(0xFFFF3B5C),
                ),
                const SizedBox(width: 10),
                _StatCard(
                  label: 'Alertas',
                  value: '${unreadAlerts.length}',
                  icon: Icons.notifications_active,
                  color: const Color(0xFFFFB830),
                ),
                const SizedBox(width: 10),
                _StatCard(
                  label: 'Satélites',
                  value: '$operationalSats/${satellites.length}',
                  icon: Icons.satellite_alt,
                  color: const Color(0xFF00FF88),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'MÓDULOS',
              style: TextStyle(
                color: Color(0xFF8B9EC7),
                fontSize: 11,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _MenuButton(
                  icon: Icons.public,
                  label: 'Eventos',
                  color: const Color(0xFFFF3B5C),
                  onTap: onEventsClick,
                ),
                const SizedBox(width: 10),
                _MenuButton(
                  icon: Icons.satellite_alt,
                  label: 'Satélites',
                  color: const Color(0xFF00D4FF),
                  onTap: onSatellitesClick,
                ),
                const SizedBox(width: 10),
                _MenuButton(
                  icon: Icons.notifications_active,
                  label: 'Alertas',
                  color: const Color(0xFFFFB830),
                  onTap: onAlertsClick,
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Eventos Recentes',
                  style: TextStyle(
                    color: Color(0xFFE8F0FE),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: onEventsClick,
                  child: const Text(
                    'Ver todos',
                    style: TextStyle(color: Color(0xFF00D4FF), fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...recentEvents.map(
              (event) => EventListCard(
                event: event,
                onClick: onEventClick,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1E2D45)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(color: Color(0xFF8B9EC7), fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _MenuButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.25)),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
