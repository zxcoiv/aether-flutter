import 'package:flutter/material.dart';

class _IntroPage {
  final String icon;
  final String title;
  final String description;
  final Color color;

  const _IntroPage({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

class IntroScreen extends StatefulWidget {
  final VoidCallback onFinish;

  const IntroScreen({super.key, required this.onFinish});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;

  final List<_IntroPage> _pages = const [
    _IntroPage(
      icon: '🛰️',
      title: 'Monitoramento Orbital',
      description:
          'O AETHER utiliza uma constelação de satélites para monitorar eventos ambientais em tempo real em todo o planeta.',
      color: Color(0xFF00D4FF),
    ),
    _IntroPage(
      icon: '🌍',
      title: 'Eventos Ambientais',
      description:
          'Acompanhe incêndios, enchentes, desmatamento, secas e poluição com dados precisos capturados do espaço.',
      color: Color(0xFF00FF88),
    ),
    _IntroPage(
      icon: '🚨',
      title: 'Alertas Inteligentes',
      description:
          'Receba alertas classificados por severidade e tome decisões rápidas para proteger vidas e o meio ambiente.',
      color: Color(0xFFFFB830),
    ),
  ];

  void _next() {
    if (_currentPage < _pages.length - 1) {
      setState(() => _currentPage++);
    } else {
      widget.onFinish();
    }
  }

  void _back() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: widget.onFinish,
                  child: const Text(
                    'Pular',
                    style: TextStyle(color: Color(0xFF8B9EC7)),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: page.color.withValues(alpha: 0.1),
                  border: Border.all(
                    color: page.color.withValues(alpha: 0.4),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: page.color.withValues(alpha: 0.2),
                      blurRadius: 40,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    page.icon,
                    style: const TextStyle(fontSize: 52),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                page.title,
                style: const TextStyle(
                  color: Color(0xFFE8F0FE),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                page.description,
                style: const TextStyle(
                  color: Color(0xFF8B9EC7),
                  fontSize: 15,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (i) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == _currentPage ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == _currentPage
                          ? page.color
                          : const Color(0xFF8B9EC7).withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  if (_currentPage > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _back,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF1E2D45)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(color: Color(0xFF8B9EC7)),
                        ),
                      ),
                    ),
                  if (_currentPage > 0) const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: page.color,
                        foregroundColor: const Color(0xFF0A0E1A),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentPage < _pages.length - 1 ? 'Avançar' : 'Começar',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
