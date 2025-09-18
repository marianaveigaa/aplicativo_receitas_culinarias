import 'package:flutter/material.dart';
import 'package:app_receitas_culinarias/src/presentation/widgets/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controlador para o PageView
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Dados das páginas do onboarding
  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "Descubra Novas Receitas",
      "description":
          "Milhares de receitas deliciosas na palma da sua mão, para todos os gostos e ocasiões.",
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "Cozinhe com Facilidade",
      "description":
          "Siga o passo a passo detalhado e prepare pratos incríveis sem complicação.",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose(); // Limpando o controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(data: _onboardingData[index]);
                },
              ),
            ),
            // Indicador de página e botão
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bolinhas indicadoras
                  Row(
                    children: List.generate(
                      _onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: _currentPage == index ? 20 : 10,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.orange
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  // Botão de Próximo / Finalizar
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _onboardingData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        // Navega para a Home, substituindo a rota do Onboarding
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    child: Text(
                      _currentPage < _onboardingData.length - 1
                          ? 'Próximo'
                          : 'Começar',
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
