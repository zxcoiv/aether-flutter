import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_event.dart';

class EventListCard extends StatelessWidget {
  final EnvironmentalEvent event;
  final Function(EnvironmentalEvent)? onClick;

  const EventListCard({super.key, required this.event, this.onClick});

  Color get _severityColor {
    switch (event.severity) {
      case Severity.critical:
        return Colors.red;
      case Severity.high:
        return Colors.orange;
      case Severity.medium:
        return Colors.blue;
      case Severity.low:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onClick != null ? () => onClick!(event) : null,
        leading: Text(event.type.icon, style: const TextStyle(fontSize: 24)),
        title: Text(event.title),
        subtitle: Text(
          '${event.region} • ${event.severity.label} • ${event.status.label}',
        ),
        trailing: const Icon(Icons.chevron_right),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        subtitleTextStyle: TextStyle(color: _severityColor, fontSize: 12),
      ),
    );
  }
}
