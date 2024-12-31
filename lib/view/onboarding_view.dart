import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: PageView.builder(
          itemBuilder: (context, i) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/GIFs/onboarding1.gif'),
                const SizedBox(height: 15),
                Text(
                  'data',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'data',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip button.
            TextButton(
              onPressed: () {},
              child: Text('Skip'),
            ),
            // Indicator.
            SmoothPageIndicator(
              controller: PageController(),
              count: 4,
              effect: const WormEffect(
                dotColor: Colors.purple,
              ),
            ),
            // Next button.
            TextButton(
              onPressed: () {},
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
