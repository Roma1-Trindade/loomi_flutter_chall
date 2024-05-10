import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/auth/routes/sign_up_route.dart';
import 'package:loomi_flutter_chall/src/home/routes/home_route.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_images.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.instance<AuthStore>();

    return Scaffold(
      backgroundColor: ColorTokens.black,
      body: Observer(builder: (_) {
        if (authStore.isAuthenticated) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacement(HomeRoute());
          });
          return Center(
            child: SvgPicture.asset(LoomiImages.logo),
          );
        } else {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacement(SignUpRoute());
          });

          return Center(
            child: SvgPicture.asset(LoomiImages.logo),
          );
        }
      }),
    );
  }
}
