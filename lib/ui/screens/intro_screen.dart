import 'package:flutter/material.dart';

class _IntroPage {
  final String icon;
  final String title;
  final String description;

  const _IntroPage({
    required this.icon,
    required this.title,
    required this.description,
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
    ),
    _IntroPage(
      icon: '🌍',
      title: 'Eventos Ambientais',
      description:
          'Acompanhe incêndios, enchentes, desmatamento, secas e poluição com dados precisos capturados do espaço.',
    ),
    _IntroPage(
      icon: '🚨',
      title: 'Alertas',
      description:
          'Receba alertas classificados por severidade e tome decisões rápidas para proteger vidas e o meio ambiente.',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: widget.onFinish,
                  child: const Text('Pular'),
                ),
              ),
              const Spacer(),
              Text(page.icon, style: const TextStyle(fontSize: 64)),
              const SizedBox(height: 32),
              Text(
                page.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                page.description,
                style: const TextStyle(fontSize: 15),
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
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  if (_currentPage > 0) ...[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _back,
                        child: const Text('Voltar'),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _next,
                      child: Text(
                        _currentPage < _pages.length - 1 ? 'Avançar' : 'Começar',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
