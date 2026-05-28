import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_event.dart';

class EventTypeCard extends StatelessWidget {
  final EventType eventType;
  final bool selected;
  final Function(EventType)? onClick;

  const EventTypeCard({
    super.key,
    required this.eventType,
    this.selected = false,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF00D4FF);
    final color = selected ? primary : const Color(0xFF8B9EC7);

    return GestureDetector(
      onTap: onClick != null ? () => onClick!(eventType) : null,
      child: SizedBox(
        width: 90,
        height: 90,
        child: Card(
          shape: const CircleBorder(),
          elevation: selected ? 6 : 2,
          color: selected
              ? primary.withValues(alpha: 0.15)
              : const Color(0xFF111827),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(eventType.icon, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 4),
                  Text(
                    eventType.label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: selected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
