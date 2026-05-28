import 'package:aether_app/model/environmental_event.dart';

const _e1 = EnvironmentalEvent(
  id: 'EVT001',
  title: 'Incêndio no Cerrado Brasileiro',
  description:
      'Foco de incêndio de grande proporção detectado via satélite AETHER-1 na região central do Cerrado. Área em expansão com ventos de 40km/h favorecendo alastramento.',
  region: 'Mato Grosso, Brasil',
  type: EventType.wildfire,
  severity: Severity.critical,
  status: EventStatus.active,
  detectedAt: '27/05/2026 - 08:14',
  affectedAreaKm2: 1240.5,
  satellite: 'AETHER-1',
);

const _e2 = EnvironmentalEvent(
  id: 'EVT002',
  title: 'Enchente no Vale do Rio Doce',
  description:
      'Nível do rio acima do crítico detectado por sensores orbitais. Risco iminente de inundação em áreas urbanas marginais ao curso d\'água.',
  region: 'Minas Gerais, Brasil',
  type: EventType.flood,
  severity: Severity.high,
  status: EventStatus.active,
  detectedAt: '26/05/2026 - 23:50',
  affectedAreaKm2: 320.8,
  satellite: 'AETHER-2',
);

const _e3 = EnvironmentalEvent(
  id: 'EVT003',
  title: 'Desmatamento Amazônico — Zona Norte',
  description:
      'Perda de cobertura florestal superior a 800 km² identificada por análise multiespectral. Padrão indica ação humana sistemática.',
  region: 'Pará, Brasil',
  type: EventType.deforestation,
  severity: Severity.critical,
  status: EventStatus.monitoring,
  detectedAt: '25/05/2026 - 14:30',
  affectedAreaKm2: 830.0,
  satellite: 'AETHER-3',
);

const _e4 = EnvironmentalEvent(
  id: 'EVT004',
  title: 'Seca Extrema no Nordeste',
  description:
      'Índices de umidade do solo abaixo de 12% em toda a região semiárida. Período de estiagem superior a 180 dias.',
  region: 'Piauí, Brasil',
  type: EventType.drought,
  severity: Severity.high,
  status: EventStatus.monitoring,
  detectedAt: '20/05/2026 - 09:00',
  affectedAreaKm2: 5600.0,
  satellite: 'AETHER-1',
);

const _e5 = EnvironmentalEvent(
  id: 'EVT005',
  title: 'Poluição Atmosférica — Grande SP',
  description:
      'Concentração de material particulado PM2.5 acima de 150 µg/m³ detectada por sensores orbitais. Condição perigosa para saúde pública.',
  region: 'São Paulo, Brasil',
  type: EventType.airPollution,
  severity: Severity.medium,
  status: EventStatus.active,
  detectedAt: '27/05/2026 - 06:00',
  affectedAreaKm2: 1521.0,
  satellite: 'AETHER-2',
);

const _e6 = EnvironmentalEvent(
  id: 'EVT006',
  title: 'Incêndio em Reflorestamento',
  description:
      'Foco controlado em área de reflorestamento, monitorado preventivamente. Equipes de combate acionadas.',
  region: 'Rio Grande do Sul, Brasil',
  type: EventType.wildfire,
  severity: Severity.low,
  status: EventStatus.resolved,
  detectedAt: '24/05/2026 - 16:45',
  affectedAreaKm2: 45.2,
  satellite: 'AETHER-3',
);

const _e7 = EnvironmentalEvent(
  id: 'EVT007',
  title: 'Cheia do Rio Amazonas',
  description:
      'Período de cheia acima da média histórica. Comunidades ribeirinhas em alerta máximo.',
  region: 'Amazonas, Brasil',
  type: EventType.flood,
  severity: Severity.medium,
  status: EventStatus.monitoring,
  detectedAt: '22/05/2026 - 11:20',
  affectedAreaKm2: 2100.0,
  satellite: 'AETHER-1',
);

List<EnvironmentalEvent> getAllEvents() {
  return [_e1, _e2, _e3, _e4, _e5, _e6, _e7];
}

List<EnvironmentalEvent> getEventsByType(EventType type) {
  return getAllEvents().where((e) => e.type == type).toList();
}

List<EnvironmentalEvent> getActiveEvents() {
  return getAllEvents().where((e) => e.status == EventStatus.active).toList();
}
