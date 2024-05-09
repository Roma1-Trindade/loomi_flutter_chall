import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/auth/routes/sign_in_route.dart';
import 'package:loomi_flutter_chall/src/auth/routes/sign_up_profile_route.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_images.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/utils/validators.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/misc/loomi_divider.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field_controller.dart';
import 'package:loomi_flutter_chall/src/shared/presentation/widgets/loomi_social_buttons.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.instance<AuthStore>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    LoomiTextFieldController emailController = LoomiTextFieldController(
      authStore.emailText,
      validators: Validators.email,
    );
    LoomiTextFieldController passwordController = LoomiTextFieldController(
      authStore.passwordText,
      validators: Validators.password,
    );
    LoomiTextFieldController confirmPasswordController =
        LoomiTextFieldController(
      authStore.passwordText,
      validators: Validators.password,
    );

    return Observer(
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingTokens.s16,
            ),
            child: Center(
              child: Column(
                children: [
                  SpacingTokens.v24,
                  SvgPicture.asset(
                    LoomiImages.loginLogo,
                  ),
                  SpacingTokens.v18,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: LoomiTextStyle.bodyText2.style,
                      ),
                      InkWell(
                        child: Text(
                          'Sign In!',
                          style: LoomiTextStyle.subtitle1.style.copyWith(
                            fontWeight: FontWeightTokens.extraBold,
                            color: ColorTokens.purple,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(SignInRoute());
                        },
                      ),
                    ],
                  ),
                  SpacingTokens.v32,
                  Text(
                    'Create an account',
                    style: LoomiTextStyle.h1.style.copyWith(
                      color: ColorTokens.white,
                    ),
                  ),
                  SpacingTokens.v12,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: SpacingTokens.s32),
                    child: Text(
                      'To get started, please complete your account registration.',
                      textAlign: TextAlign.center,
                      style: LoomiTextStyle.bodyText2.style,
                    ),
                  ),
                  SpacingTokens.v28,
                  LoomiSocialButtons(
                    onApplePressed: () {},
                  ),
                  SpacingTokens.v40,
                  const LoomiDivider(
                    title: 'Or Sign up With',
                  ),
                  SpacingTokens.v40,
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        LoomiTextField(
                          autofocus: false,
                          controller: emailController,
                          hintText: 'Email',
                          onChanged: (String value) {
                            authStore.setEmail(value);
                          },
                        ),
                        SpacingTokens.v22,
                        LoomiTextField(
                          autofocus: false,
                          controller: passwordController,
                          hintText: 'Password',
                          suffix: SUFFIX.Eye,
                          onChanged: (String value) {
                            confirmPasswordController
                                .updateValueToCompareWith(value);
                            authStore.setPassword(value);
                          },
                        ),
                        SpacingTokens.v22,
                        LoomiTextField(
                          autofocus: false,
                          controller: confirmPasswordController,
                          hintText: 'Confirm your Password',
                          suffix: SUFFIX.Eye,
                        ),
                      ],
                    ),
                  ),
                  SpacingTokens.v22,
                  LoomiButton.primary(
                    isLoading: authStore.isLoading,
                    onPressed: () {
                      if (emailController.isValid &&
                          passwordController.isValid &&
                          confirmPasswordController.isValid) {
                        Navigator.of(context).push(SignUpProfileRoute());
                      } else {
                        emailController.showValidationState();
                        passwordController.showValidationState();
                        confirmPasswordController.showValidationState();
                      }
                    },
                    text: 'Create account',
                  ),
                  SpacingTokens.v24
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
