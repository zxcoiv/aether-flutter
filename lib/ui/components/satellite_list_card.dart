import 'package:flutter/material.dart';
import 'package:aether_app/model/satellite.dart';

class SatelliteListCard extends StatelessWidget {
  final Satellite satellite;

  const SatelliteListCard({super.key, required this.satellite});

  Color get _statusColor {
    switch (satellite.status) {
      case SatelliteStatus.operational:
        return const Color(0xFF00FF88);
      case SatelliteStatus.standby:
        return const Color(0xFFFFB830);
      case SatelliteStatus.maintenance:
        return const Color(0xFFFF3B5C);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colors.outlineVariant, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF00D4FF).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF00D4FF).withValues(alpha: 0.3),
                  ),
                ),
                child: const Icon(
                  Icons.satellite_alt,
                  color: Color(0xFF00D4FF),
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          satellite.name,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            color: const Color(0xFFE8F0FE),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: _statusColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              satellite.status.label,
                              style: TextStyle(
                                color: _statusColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      satellite.mission,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF8B9EC7),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${satellite.orbit}  •  ${satellite.coverage}',
                      style: const TextStyle(
                        color: Color(0xFF8B9EC7),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
