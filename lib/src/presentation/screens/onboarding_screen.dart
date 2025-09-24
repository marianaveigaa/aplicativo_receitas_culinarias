import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/consent_page.dart';
import '../widgets/go_to_access_page.dart';
import '../widgets/how_it_works_page.dart';
import '../widgets/welcome_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool?
      _marketingConsent; // Começa como nulo para indicar que não foi escolhido

  // Lista de páginas do onboarding
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    // A lista é inicializada aqui para poder passar o método onConsentChanged
    _pages.addAll([
      const WelcomePage(),
      const HowItWorksPage(),
      ConsentPage(
        marketingConsent: _marketingConsent,
        onConsentChanged: (value) {
          setState(() {
            _marketingConsent = value;
          });
        },
      ),
      const GoToAccessPage(),
    ]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    // Salva o consentimento (o padrão é false se não for escolhido)
    await prefs.setBool('marketing_consent', _marketingConsent ?? false);
    // Marca o onboarding como concluído
    await prefs.setBool('onboarding_completed', true);

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Verifica se o botão principal deve estar habilitado
    // Na página de consentimento, só habilita se uma escolha foi feita
    final bool isButtonEnabled =
        _currentPage != 2 || (_currentPage == 2 && _marketingConsent != null);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Botões "Pular" e "Voltar" no topo
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão Voltar
                  Visibility(
                    visible:
                        _currentPage > 0 && _currentPage < _pages.length - 1,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: TextButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: const Text('Voltar'),
                    ),
                  ),

                  // Botão Pular
                  Visibility(
                    visible: _currentPage <
                        2, // Visível antes da pág de consentimento
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: TextButton(
                      onPressed: () {
                        // Pula diretamente para a página de consentimento
                        _pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: const Text('Pular'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: _pages,
              ),
            ),
            // Indicador de progresso e botão de avançar
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // DotsIndicator
                  Visibility(
                    visible: _currentPage <
                        _pages.length - 1, // Oculto na última página
                    child: DotsIndicator(
                      dotsCount: _pages.length,
                      position: _currentPage,
                      decorator: DotsDecorator(
                        activeColor: Theme.of(context).colorScheme.primary,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            // ignore: deprecated_member_use
                            .withOpacity(0.3),
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Botão Avançar / Finalizar
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      // Desabilitado se não for válido
                      onPressed: isButtonEnabled
                          ? () {
                              if (_currentPage < _pages.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              } else {
                                _completeOnboarding();
                              }
                            }
                          : null,
                      child: Text(
                        _currentPage < _pages.length - 1
                            ? 'Avançar'
                            : 'Ir para o Acesso',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
