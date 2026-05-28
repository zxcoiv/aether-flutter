enum EventType { wildfire, flood, deforestation, drought, airPollution }

enum Severity { low, medium, high, critical }

enum EventStatus { active, monitoring, resolved }

extension EventTypeLabel on EventType {
  String get label {
    switch (this) {
      case EventType.wildfire:
        return 'Incêndio';
      case EventType.flood:
        return 'Enchente';
      case EventType.deforestation:
        return 'Desmatamento';
      case EventType.drought:
        return 'Seca';
      case EventType.airPollution:
        return 'Poluição';
    }
  }

  String get icon {
    switch (this) {
      case EventType.wildfire:
        return '🔥';
      case EventType.flood:
        return '🌊';
      case EventType.deforestation:
        return '🌳';
      case EventType.drought:
        return '☀️';
      case EventType.airPollution:
        return '💨';
    }
  }
}

extension SeverityLabel on Severity {
  String get label {
    switch (this) {
      case Severity.low:
        return 'Baixo';
      case Severity.medium:
        return 'Médio';
      case Severity.high:
        return 'Alto';
      case Severity.critical:
        return 'Crítico';
    }
  }
}

extension EventStatusLabel on EventStatus {
  String get label {
    switch (this) {
      case EventStatus.active:
        return 'Ativo';
      case EventStatus.monitoring:
        return 'Monitorando';
      case EventStatus.resolved:
        return 'Resolvido';
    }
  }
}

class EnvironmentalEvent {
  final String id;
  final String title;
  final String description;
  final String region;
  final EventType type;
  final Severity severity;
  final EventStatus status;
  final String detectedAt;
  final double affectedAreaKm2;
  final String satellite;

  const EnvironmentalEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.region,
    required this.type,
    required this.severity,
    required this.status,
    required this.detectedAt,
    required this.affectedAreaKm2,
    required this.satellite,
  });
}
