import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/home_view.dart';
import 'view/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool onBoarding = prefs.getBool('OnBoarding') ?? false;
  runApp(
    Phoenix(
      child: MyApp(onBoarding: onBoarding),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool onBoarding;
  const MyApp({super.key, this.onBoarding = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnBoarding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF7357a4),
        ),
        useMaterial3: true,
      ),
      home: onBoarding ? HomeView() : OnboardingView(),
    );
  }
}
