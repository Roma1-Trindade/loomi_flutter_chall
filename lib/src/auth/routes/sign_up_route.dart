import 'package:flutter/material.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/pages/sign_up_screen.dart';

class SignUpRoute extends PageRouteBuilder {
  SignUpRoute()
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => const SignUpScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
