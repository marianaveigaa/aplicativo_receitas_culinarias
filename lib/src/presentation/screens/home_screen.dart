// Em: lib/src/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Receitas'),
        backgroundColor: Colors.orange.shade300,
      ),
      body: const Center(
        child: Text('Bem-vindo(a) ao App!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
