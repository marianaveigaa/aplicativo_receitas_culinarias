// Em: lib/src/core/app_widget.dart
import 'package:flutter/material.dart';
import 'package:app_receitas_culinarias/src/presentation/screens/home_screen.dart';
import 'package:app_receitas_culinarias/src/presentation/screens/onboarding_screen.dart';
import 'package:app_receitas_culinarias/src/presentation/screens/splash_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Receitas',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true, // Boa prática, como sugerido
      ),
      debugShowCheckedModeBanner: false,
      // Estrutura de rotas nomeadas
      initialRoute: '/', // Rota inicial é a Splash
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
