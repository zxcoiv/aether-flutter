import 'package:flutter/material.dart';
import 'package:aether_app/model/satellite.dart';
import 'package:aether_app/repository/satellite_repository.dart';
import 'package:aether_app/ui/components/aether_top_app_bar.dart';
import 'package:aether_app/ui/components/satellite_list_card.dart';

class SatellitesScreen extends StatefulWidget {
  final VoidCallback onBackClick;

  const SatellitesScreen({super.key, required this.onBackClick});

  @override
  State<SatellitesScreen> createState() => _SatellitesScreenState();
}

class _SatellitesScreenState extends State<SatellitesScreen> {
  late List<Satellite> allSatellites;
  late List<Satellite> filteredSatellites;
  SatelliteStatus? selectedStatus;

  @override
  void initState() {
    super.initState();
    allSatellites = getAllSatellites();
    filteredSatellites = allSatellites;
  }

  @override
  Widget build(BuildContext context) {
    final operational =
        allSatellites.where((s) => s.status == SatelliteStatus.operational).length;

    return Scaffold(
      appBar: AetherTopBar(
        title: 'Satélites',
        showBack: true,
        onBackClick: widget.onBackClick,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$operational de ${allSatellites.length} operacionais',
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                selectedStatus == null
                    ? ElevatedButton(
                        onPressed: () => setState(() {
                          selectedStatus = null;
                          filteredSatellites = allSatellites;
                        }),
                        child: const Text('Todos'),
                      )
                    : OutlinedButton(
                        onPressed: () => setState(() {
                          selectedStatus = null;
                          filteredSatellites = allSatellites;
                        }),
                        child: const Text('Todos'),
                      ),
                ...SatelliteStatus.values.map((status) => selectedStatus == status
                    ? ElevatedButton(
                        onPressed: () => setState(() {
                          selectedStatus = status;
                          filteredSatellites = getSatellitesByStatus(status);
                        }),
                        child: Text(status.label),
                      )
                    : OutlinedButton(
                        onPressed: () => setState(() {
                          selectedStatus = status;
                          filteredSatellites = getSatellitesByStatus(status);
                        }),
                        child: Text(status.label),
                      )),
              ],
            ),

            const SizedBox(height: 8),

            Expanded(
              child: ListView.builder(
                itemCount: filteredSatellites.length,
                itemBuilder: (context, index) {
                  return SatelliteListCard(satellite: filteredSatellites[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
