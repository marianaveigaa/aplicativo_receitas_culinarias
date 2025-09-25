import 'package:flutter/material.dart';

class ConsentPage extends StatelessWidget {
  final bool? marketingConsent;
  final ValueChanged<bool> onConsentChanged;
  const ConsentPage(
      {super.key,
      required this.marketingConsent,
      required this.onConsentChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.privacy_tip_outlined,
              size: 80, color: Colors.orange),
          const SizedBox(height: 24),
          const Text('Sua Privacidade',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text(
              'Gostaríamos de enviar novidades e promoções. Você pode mudar isso a qualquer momento.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16)),
          const SizedBox(height: 32),
          SwitchListTile(
            title: const Text('Aceito receber comunicações'),
            value: marketingConsent ?? false,
            onChanged: onConsentChanged,
            activeThumbColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
