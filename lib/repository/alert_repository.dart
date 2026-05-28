import 'package:aether_app/model/environmental_alert.dart';

const _a1 = EnvironmentalAlert(
  id: 'ALT001',
  title: 'EMERGÊNCIA — Incêndio Crítico',
  message:
      'Foco de incêndio em expansão acelerada detectado no Cerrado. Defesa Civil acionada. Evacuação preventiva em curso.',
  region: 'Mato Grosso, Brasil',
  level: AlertLevel.emergency,
  issuedAt: '27/05/2026 - 08:30',
);

const _a2 = EnvironmentalAlert(
  id: 'ALT002',
  title: 'Risco de Inundação',
  message:
      'Nível do rio atingiu cota de alerta. Populações ribeirinhas devem se preparar para possível evacuação.',
  region: 'Minas Gerais, Brasil',
  level: AlertLevel.danger,
  issuedAt: '27/05/2026 - 01:00',
);

const _a3 = EnvironmentalAlert(
  id: 'ALT003',
  title: 'Qualidade do Ar Prejudicial',
  message:
      'Índice de qualidade do ar atingiu nível "Muito Ruim". Recomenda-se evitar atividades ao ar livre.',
  region: 'São Paulo, Brasil',
  level: AlertLevel.warning,
  issuedAt: '27/05/2026 - 07:00',
);

const _a4 = EnvironmentalAlert(
  id: 'ALT004',
  title: 'Alerta de Desmatamento',
  message:
      'Atividade de desmatamento acima da média detectada via análise orbital. Fiscalização ambiental notificada.',
  region: 'Pará, Brasil',
  level: AlertLevel.danger,
  issuedAt: '26/05/2026 - 18:00',
  isRead: true,
);

const _a5 = EnvironmentalAlert(
  id: 'ALT005',
  title: 'Monitoramento de Seca',
  message:
      'Índices de umidade do solo em queda contínua. Situação será reavaliada em 48h.',
  region: 'Piauí, Brasil',
  level: AlertLevel.warning,
  issuedAt: '25/05/2026 - 12:00',
  isRead: true,
);

const _a6 = EnvironmentalAlert(
  id: 'ALT006',
  title: 'Atualização do Sistema',
  message:
      'AETHER-3 concluiu ciclo orbital de mapeamento. Novos dados disponíveis para análise.',
  region: 'Global',
  level: AlertLevel.info,
  issuedAt: '24/05/2026 - 22:00',
  isRead: true,
);

List<EnvironmentalAlert> getAllAlerts() {
  return [_a1, _a2, _a3, _a4, _a5, _a6];
}

List<EnvironmentalAlert> getUnreadAlerts() {
  return getAllAlerts().where((a) => !a.isRead).toList();
}

List<EnvironmentalAlert> getAlertsByLevel(AlertLevel level) {
  return getAllAlerts().where((a) => a.level == level).toList();
}
