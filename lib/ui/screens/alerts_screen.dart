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

  @override
  void initState() {
    super.initState();
    allAlerts = getAllAlerts();
    filteredAlerts = allAlerts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AetherTopBar(
        title: 'Alertas',
        showBack: true,
        onBackClick: widget.onBackClick,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                selectedLevel == null
                    ? ElevatedButton(
                        onPressed: () => setState(() {
                          selectedLevel = null;
                          filteredAlerts = allAlerts;
                        }),
                        child: const Text('Todos'),
                      )
                    : OutlinedButton(
                        onPressed: () => setState(() {
                          selectedLevel = null;
                          filteredAlerts = allAlerts;
                        }),
                        child: const Text('Todos'),
                      ),
                ...AlertLevel.values.map((level) => selectedLevel == level
                    ? ElevatedButton(
                        onPressed: () => setState(() {
                          selectedLevel = level;
                          filteredAlerts = getAlertsByLevel(level);
                        }),
                        child: Text('${level.icon} ${level.label}'),
                      )
                    : OutlinedButton(
                        onPressed: () => setState(() {
                          selectedLevel = level;
                          filteredAlerts = getAlertsByLevel(level);
                        }),
                        child: Text('${level.icon} ${level.label}'),
                      )),
              ],
            ),

            const SizedBox(height: 8),

            Expanded(
              child: filteredAlerts.isEmpty
                  ? const Center(child: Text('Nenhum alerta encontrado'))
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
