import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final Map<String, String> data;
  const OnboardingPageWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              data['image']!,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 40),
          Text(data['title']!,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(data['description']!,
              style: Theme.of(context).textTheme.bodyLarge),
          const Spacer(),
        ],
      ),
    );
  }
}
