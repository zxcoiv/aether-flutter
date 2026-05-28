import 'package:flutter/material.dart';
import 'package:aether_app/model/environmental_event.dart';
import 'package:aether_app/repository/event_repository.dart';
import 'package:aether_app/ui/components/aether_top_app_bar.dart';
import 'package:aether_app/ui/components/event_list_card.dart';
import 'package:aether_app/ui/components/event_type_card.dart';

class EventsScreen extends StatefulWidget {
  final ValueChanged<EnvironmentalEvent> onEventClick;
  final VoidCallback onBackClick;

  const EventsScreen({
    super.key,
    required this.onEventClick,
    required this.onBackClick,
  });

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  late List<EnvironmentalEvent> allEvents;
  late List<EnvironmentalEvent> filteredEvents;
  EventType? selectedType;
  bool filtered = false;

  @override
  void initState() {
    super.initState();
    allEvents = getAllEvents();
    filteredEvents = allEvents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AetherTopBar(
        title: 'EVENTOS',
        showBack: true,
        onBackClick: widget.onBackClick,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            SizedBox(
              height: 96,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 4),
                itemCount: EventType.values.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final type = EventType.values[index];
                  return EventTypeCard(
                    eventType: type,
                    selected: selectedType == type,
                    onClick: (t) {
                      setState(() {
                        filtered = true;
                        selectedType = t;
                        filteredEvents = getEventsByType(t);
                      });
                    },
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
                      selectedType = null;
                      filteredEvents = allEvents;
                    });
                  },
                  icon: const Icon(Icons.delete, color: Color(0xFF8B9EC7)),
                ),
              ),

            const SizedBox(height: 8),

            Expanded(
              child: filteredEvents.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum evento encontrado',
                        style: TextStyle(color: Color(0xFF8B9EC7)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredEvents.length,
                      itemBuilder: (context, index) {
                        final event = filteredEvents[index];
                        return EventListCard(
                          event: event,
                          onClick: widget.onEventClick,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
