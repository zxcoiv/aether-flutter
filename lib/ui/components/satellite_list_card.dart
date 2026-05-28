import 'package:flutter/material.dart';
import 'package:aether_app/model/satellite.dart';

class SatelliteListCard extends StatelessWidget {
  final Satellite satellite;

  const SatelliteListCard({super.key, required this.satellite});

  Color get _statusColor {
    switch (satellite.status) {
      case SatelliteStatus.operational:
        return Colors.green;
      case SatelliteStatus.standby:
        return Colors.orange;
      case SatelliteStatus.maintenance:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.satellite_alt)),
        title: Text(
          satellite.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${satellite.mission}\n${satellite.orbit} • ${satellite.coverage}'),
        trailing: Text(
          satellite.status.label,
          style: TextStyle(color: _statusColor, fontWeight: FontWeight.bold),
        ),
        isThreeLine: true,
      ),
    );
  }
}
