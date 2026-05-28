import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_alert.dart';
import 'package:aether_app/repository/alert_repository.dart';
import 'package:aether_app/ui/components/aether_top_app_bar.dart';
import 'package:aether_app/ui/components/alert_list_card.dart';

class AlertsScreen extends StatefulWidget {
  final VoidCallback onBackClick;

  const AlertsScreen({super.key, required this.onBackClick});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  late List<EnvironmentalAlert> allAlerts;
  late List<EnvironmentalAlert> filteredAlerts;
  AlertLevel? selectedLevel;
  bool filtered = false;

  @override
  void initState() {
    super.initState();
    allAlerts = getAllAlerts();
    filteredAlerts = allAlerts;
  }

  @override
  Widget build(BuildContext context) {
    final unread = allAlerts.where((a) => !a.isRead).length;

    return Scaffold(
      appBar: AetherTopBar(
        title: 'ALERTAS',
        showBack: true,
        onBackClick: widget.onBackClick,
        actions: unread > 0
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF3B5C).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFFF3B5C).withValues(alpha: 0.4),
                        ),
                      ),
                      child: Text(
                        '$unread não lidos',
                        style: const TextStyle(
                          color: Color(0xFFFF3B5C),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: AlertLevel.values.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final level = AlertLevel.values[index];
                  final isSelected = selectedLevel == level;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        filtered = true;
                        selectedLevel = level;
                        filteredAlerts = getAlertsByLevel(level);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF00D4FF).withValues(alpha: 0.15)
                            : Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF00D4FF).withValues(alpha: 0.5)
                              : const Color(0xFF1E2D45),
                        ),
                      ),
                      child: Text(
                        '${level.icon} ${level.label}',
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFF00D4FF)
                              : const Color(0xFF8B9EC7),
                          fontSize: 12,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            if (filtered)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      filtered = false;
                      selectedLevel = null;
                      filteredAlerts = allAlerts;
                    });
                  },
                  icon: const Icon(Icons.delete, color: Color(0xFF8B9EC7)),
                ),
              ),

            const SizedBox(height: 8),

            Expanded(
              child: filteredAlerts.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum alerta encontrado',
                        style: TextStyle(color: Color(0xFF8B9EC7)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredAlerts.length,
                      itemBuilder: (context, index) {
                        return AlertListCard(alert: filteredAlerts[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
