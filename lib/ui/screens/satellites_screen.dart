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
  bool filtered = false;

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
        title: 'SATÉLITES',
        showBack: true,
        onBackClick: widget.onBackClick,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            Row(
              children: [
                _SatStat(
                  label: 'Operacionais',
                  value: '$operational',
                  color: const Color(0xFF00FF88),
                ),
                const SizedBox(width: 10),
                _SatStat(
                  label: 'Total',
                  value: '${allSatellites.length}',
                  color: const Color(0xFF00D4FF),
                ),
              ],
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: SatelliteStatus.values.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final status = SatelliteStatus.values[index];
                  final isSelected = selectedStatus == status;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        filtered = true;
                        selectedStatus = status;
                        filteredSatellites = getSatellitesByStatus(status);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF00D4FF).withValues(alpha: 0.15)
                            : Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF00D4FF).withValues(alpha: 0.5)
                              : const Color(0xFF1E2D45),
                        ),
                      ),
                      child: Text(
                        status.label,
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFF00D4FF)
                              : const Color(0xFF8B9EC7),
                          fontSize: 12,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
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
                      selectedStatus = null;
                      filteredSatellites = allSatellites;
                    });
                  },
                  icon: const Icon(Icons.delete, color: Color(0xFF8B9EC7)),
                ),
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

class _SatStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SatStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Color(0xFF8B9EC7), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
