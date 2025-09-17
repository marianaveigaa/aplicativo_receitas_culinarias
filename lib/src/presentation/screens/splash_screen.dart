// Em: lib/src/presentation/screens/splash_screen.dart
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navega para a próxima tela após um tempo
    Future.delayed(const Duration(seconds: 3), () {
      // O 'mounted' checa se o widget ainda está na árvore de widgets
      if (mounted) {
        // Usamos pushReplacementNamed para que o usuário não possa voltar para a splash
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
            // Usando SafeArea para evitar áreas como o notch
            SafeArea(child: Image.asset('assets/images/logo.png', width: 150)),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
