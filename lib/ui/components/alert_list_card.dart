import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_alert.dart';

class AlertListCard extends StatelessWidget {
  final EnvironmentalAlert alert;

  const AlertListCard({super.key, required this.alert});

  Color get _levelColor {
    switch (alert.level) {
      case AlertLevel.emergency:
        return Colors.red;
      case AlertLevel.danger:
        return Colors.orange;
      case AlertLevel.warning:
        return Colors.blue;
      case AlertLevel.info:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Text(alert.level.icon, style: const TextStyle(fontSize: 24)),
        title: Text(
          alert.title,
          style: TextStyle(
            fontWeight: alert.isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text('${alert.message}\n${alert.region} • ${alert.issuedAt}'),
        trailing: Chip(
          label: Text(alert.level.label),
          labelStyle: TextStyle(color: _levelColor, fontSize: 11),
        ),
        isThreeLine: true,
      ),
    );
  }
}
