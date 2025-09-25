import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/consent_page.dart';
import '../widgets/go_to_access_page.dart';
import '../widgets/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool? _marketingConsent;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "Descubra Novas Receitas",
      "description": "Milhares de receitas deliciosas na palma da sua mão.",
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "Cozinhe com Facilidade",
      "description": "Siga o passo a passo e prepare pratos incríveis.",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('marketing_consent', _marketingConsent ?? false);
    await prefs.setBool('onboarding_completed', true);

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    const int totalPages = 4;
    final bool isFirstPage = _currentPage == 0;
    final bool isLastPage = _currentPage == totalPages - 1;
    final bool isConsentPage = _currentPage == 2;

    final bool isButtonEnabled =
        !isConsentPage || (isConsentPage && _marketingConsent != null);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !isFirstPage && !isLastPage,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: TextButton(
                      onPressed: () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease),
                      child: const Text('Voltar'),
                    ),
                  ),
                  Visibility(
                    visible: _currentPage < 2,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: TextButton(
                      onPressed: () => _pageController.animateToPage(
                          2, // Pula para a pág. de consentimento
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease),
                      child: const Text('Pular'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: totalPages,
                onPageChanged: (page) => setState(() => _currentPage = page),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return OnboardingPageWidget(data: _onboardingData[0]);
                    case 1:
                      return OnboardingPageWidget(data: _onboardingData[1]);
                    case 2:
                      return ConsentPage(
                        marketingConsent: _marketingConsent,
                        onConsentChanged: (value) {
                          setState(() {
                            _marketingConsent = value;
                          });
                        },
                      );
                    case 3:
                      return const GoToAccessPage();
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Visibility(
                    visible: !isLastPage,
                    child: DotsIndicator(
                      dotsCount: totalPages,
                      position: _currentPage,
                      decorator: DotsDecorator(
                        activeColor: Theme.of(context).colorScheme.primary,
                        // ignore: deprecated_member_use
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            // ignore: deprecated_member_use
                            .withOpacity(0.3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                              if (!isLastPage) {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              } else {
                                _completeOnboarding();
                              }
                            }
                          : null,
                      child: Text(isLastPage ? 'Ir para o Acesso' : 'Avançar'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
