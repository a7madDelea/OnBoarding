import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setBool('OnBoarding', false);
            // ignore: use_build_context_synchronously
            Phoenix.rebirth(context);
          },
          child: const Text('Done!'),
        ),
      ),
    );
  }
}
