import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_event.dart';

class EventListCard extends StatelessWidget {
  final EnvironmentalEvent event;
  final Function(EnvironmentalEvent)? onClick;

  const EventListCard({super.key, required this.event, this.onClick});

  Color get _severityColor {
    switch (event.severity) {
      case Severity.critical:
        return const Color(0xFFFF3B5C);
      case Severity.high:
        return const Color(0xFFFFB830);
      case Severity.medium:
        return const Color(0xFF4A9EFF);
      case Severity.low:
        return const Color(0xFF00CC66);
    }
  }

  Color get _statusColor {
    switch (event.status) {
      case EventStatus.active:
        return const Color(0xFFFF3B5C);
      case EventStatus.monitoring:
        return const Color(0xFFFFB830);
      case EventStatus.resolved:
        return const Color(0xFF00CC66);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onClick != null ? () => onClick!(event) : null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          color: colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: _severityColor.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 3,
                decoration: BoxDecoration(
                  color: _severityColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                event.type.icon,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  event.title,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall?.copyWith(
                                    color: const Color(0xFFE8F0FE),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 12,
                                color: Color(0xFF8B9EC7),
                              ),
                              const SizedBox(width: 3),
                              Expanded(
                                child: Text(
                                  event.region,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFF8B9EC7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: _severityColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  event.severity.label,
                                  style: TextStyle(
                                    color: _severityColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: _statusColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  event.status.label,
                                  style: TextStyle(
                                    color: _statusColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: colors.onSurfaceVariant,
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
