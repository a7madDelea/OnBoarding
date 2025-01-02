import '../models/onboarding_model.dart';

class OnboardingData {
  List<OnboardingModel> itemsData = const [
    OnboardingModel(
      title: 'Laboratory',
      description:
          'A scientist in his laboratory is not a mere technician: he is also a child confronting natural phenomena that impress him as though they were fairy tales.',
      image: 'assets/GIFs/onboarding1.gif',
    ),
    OnboardingModel(
      title: 'Diagnosis',
      description:
          'There is little you can do to stop a tornado, a hurricane, or a cancer diagnosis from changing your life in an instant.',
      image: 'assets/GIFs/onboarding2.gif',
    ),
    OnboardingModel(
      title: 'Chronic Diseases',
      description:
          'Cancer taught my family that my mom is much stronger than we ever thought.',
      image: 'assets/GIFs/onboarding3.gif',
    ),
    OnboardingModel(
      title: 'Heart Diseases',
      description:
          'A healthy heart is a key to happiness in life so put a stop to all of the problems related to your heart before it stops you.',
      image: 'assets/GIFs/onboarding4.gif',
    ),
  ];
}
