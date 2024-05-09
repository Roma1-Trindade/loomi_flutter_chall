import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_flutter_chall/src/auth/routes/sign_in_route.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_images.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_button.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.s16),
        child: Center(
          child: Column(
            children: [
              SpacingTokens.v54,
              Expanded(
                child: Column(
                  children: [
                    SvgPicture.asset(LoomiImages.miniLogo),
                    SpacingTokens.v54,
                    SizedBox(
                      width: 220,
                      child: Text(
                        'The instructions were sent!',
                        style: LoomiTextStyle.h1.style.copyWith(
                            color: ColorTokens.white, letterSpacing: 1.25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SpacingTokens.v12,
              Expanded(
                child: Text(
                  'If this was a valid email, instructions to reset your password will be sent to you. Please check your email.',
                  style: LoomiTextStyle.bodyText2.style,
                  textAlign: TextAlign.center,
                ),
              ),
              LoomiButton.primary(
                text: 'Login',
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    SignInRoute(),
                    (_) => false,
                  );
                },
              ),
              SpacingTokens.v32,
            ],
          ),
        ),
      ),
    );
  }
}
