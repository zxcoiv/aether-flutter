import 'package:aether_app/model/satellite.dart';

const _s1 = Satellite(
  id: 'SAT001',
  name: 'AETHER-1',
  orbit: 'LEO — 550 km',
  status: SatelliteStatus.operational,
  launchDate: '12/03/2024',
  coverage: 'América do Sul',
  mission: 'Monitoramento de vegetação e incêndios',
);

const _s2 = Satellite(
  id: 'SAT002',
  name: 'AETHER-2',
  orbit: 'LEO — 620 km',
  status: SatelliteStatus.operational,
  launchDate: '08/07/2024',
  coverage: 'América do Sul / Central',
  mission: 'Monitoramento hídrico e atmosférico',
);

const _s3 = Satellite(
  id: 'SAT003',
  name: 'AETHER-3',
  orbit: 'SSO — 700 km',
  status: SatelliteStatus.operational,
  launchDate: '21/11/2024',
  coverage: 'Global',
  mission: 'Mapeamento multiespectral',
);

const _s4 = Satellite(
  id: 'SAT004',
  name: 'AETHER-4',
  orbit: 'MEO — 8.000 km',
  status: SatelliteStatus.standby,
  launchDate: '05/02/2025',
  coverage: 'Hemisfério Sul',
  mission: 'Backup e contingência orbital',
);

const _s5 = Satellite(
  id: 'SAT005',
  name: 'AETHER-5',
  orbit: 'LEO — 480 km',
  status: SatelliteStatus.maintenance,
  launchDate: '30/04/2025',
  coverage: 'Brasil',
  mission: 'Monitoramento climático de precisão',
);

List<Satellite> getAllSatellites() {
  return [_s1, _s2, _s3, _s4, _s5];
}

List<Satellite> getSatellitesByStatus(SatelliteStatus status) {
  return getAllSatellites().where((s) => s.status == status).toList();
}
