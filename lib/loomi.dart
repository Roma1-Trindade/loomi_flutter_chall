import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/pages/splash_screen.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/loomi_theme.dart';

class Loomi extends StatelessWidget {
  const Loomi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loomi',
      theme: LoomiTheme.data(context),
      home: const SplashScreen(),
    );
  }
}
