import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_alert.dart';

class AlertListCard extends StatelessWidget {
  final EnvironmentalAlert alert;

  const AlertListCard({super.key, required this.alert});

  Color get _levelColor {
    switch (alert.level) {
      case AlertLevel.emergency:
        return const Color(0xFFFF3B5C);
      case AlertLevel.danger:
        return const Color(0xFFFFB830);
      case AlertLevel.warning:
        return const Color(0xFF4A9EFF);
      case AlertLevel.info:
        return const Color(0xFF8B9EC7);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        color: alert.isRead
            ? colors.surface
            : _levelColor.withValues(alpha: 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: alert.isRead
                ? colors.outlineVariant
                : _levelColor.withValues(alpha: 0.35),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(alert.level.icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            alert.title,
                            style: TextStyle(
                              color: alert.isRead
                                  ? const Color(0xFF8B9EC7)
                                  : const Color(0xFFE8F0FE),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        if (!alert.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _levelColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      alert.message,
                      style: const TextStyle(
                        color: Color(0xFF8B9EC7),
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _levelColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            alert.level.label,
                            style: TextStyle(
                              color: _levelColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.location_on,
                          size: 11,
                          color: Color(0xFF8B9EC7),
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            alert.region,
                            style: const TextStyle(
                              color: Color(0xFF8B9EC7),
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Text(
                          alert.issuedAt,
                          style: const TextStyle(
                            color: Color(0xFF8B9EC7),
                            fontSize: 10,
                          ),
                        ),
                      ],
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
