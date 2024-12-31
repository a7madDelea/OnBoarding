import 'package:flutter/material.dart';
import 'package:onboarding/view/home_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/onboarding_data.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingData controller = OnboardingData();
  final PageController pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: PageView.builder(
          itemCount: controller.itemsData.length,
          controller: pageController,
          onPageChanged: (value) => setState(
            () => isLastPage = controller.itemsData.length - 1 == value,
          ),
          itemBuilder: (context, i) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.
                Image.asset(controller.itemsData[i].image),
                const SizedBox(height: 15),
                // Title.
                Text(
                  controller.itemsData[i].title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                // Description.
                Text(
                  controller.itemsData[i].description,
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
        child: isLastPage
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.purple,
                ),
                width: MediaQuery.of(context).size.width * .9,
                height: 55,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip button.
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ),
                      );
                    },
                    child: Text('Skip'),
                  ),
                  // Indicator.
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.itemsData.length,
                    onDotClicked: (index) => pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    ),
                    effect: WormEffect(
                      dotColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  // Next button.
                  TextButton(
                    onPressed: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    ),
                    child: Text('Next'),
                  ),
                ],
              ),
      ),
    );
  }
}
