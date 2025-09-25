import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  // Função para verificar o status do onboarding e decidir a navegação
  Future<void> _checkOnboardingStatus() async {
    await Future.microtask(() async {
      final prefs = await SharedPreferences.getInstance();
      // Lê o valor. Se não existir, o padrão é 'false'.
      final bool onboardingCompleted =
          prefs.getBool('onboarding_completed') ?? false;

      await Future.delayed(const Duration(seconds: 2));

      // Verificação de 'mounted' para garantir que o widget ainda está na tela
      if (!mounted) return;

      if (onboardingCompleted) {
        // Se o onboarding foi completo, vai para a Home
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Se não, vai para o Onboarding
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: Colors.orange,
            ),
            const SizedBox(height: 20),
            Text(
              'Carregando...',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
