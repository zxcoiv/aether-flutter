enum AlertLevel { info, warning, danger, emergency }

extension AlertLevelLabel on AlertLevel {
  String get label {
    switch (this) {
      case AlertLevel.info:
        return 'Informação';
      case AlertLevel.warning:
        return 'Atenção';
      case AlertLevel.danger:
        return 'Perigo';
      case AlertLevel.emergency:
        return 'Emergência';
    }
  }

  String get icon {
    switch (this) {
      case AlertLevel.info:
        return 'ℹ️';
      case AlertLevel.warning:
        return '⚠️';
      case AlertLevel.danger:
        return '🚨';
      case AlertLevel.emergency:
        return '🆘';
    }
  }
}

class EnvironmentalAlert {
  final String id;
  final String title;
  final String message;
  final String region;
  final AlertLevel level;
  final String issuedAt;
  final bool isRead;

  const EnvironmentalAlert({
    required this.id,
    required this.title,
    required this.message,
    required this.region,
    required this.level,
    required this.issuedAt,
    this.isRead = false,
  });
}
