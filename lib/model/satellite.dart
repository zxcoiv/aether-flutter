import 'package:equatable/equatable.dart';

enum SatelliteStatus { operational, standby, maintenance }

extension SatelliteStatusLabel on SatelliteStatus {
  String get label {
    switch (this) {
      case SatelliteStatus.operational:
        return 'Operacional';
      case SatelliteStatus.standby:
        return 'Standby';
      case SatelliteStatus.maintenance:
        return 'Manutenção';
    }
  }
}

class Satellite extends Equatable {
  final String id;
  final String name;
  final String orbit;
  final SatelliteStatus status;
  final String launchDate;
  final String coverage;
  final String mission;

  const Satellite({
    required this.id,
    required this.name,
    required this.orbit,
    required this.status,
    required this.launchDate,
    required this.coverage,
    required this.mission,
  });

  @override
  List<Object?> get props => [id];
}
