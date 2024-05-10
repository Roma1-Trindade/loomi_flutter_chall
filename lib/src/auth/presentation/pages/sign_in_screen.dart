import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/auth/routes/forgot_password_route.dart';
import 'package:loomi_flutter_chall/src/auth/routes/sign_up_route.dart';
import 'package:loomi_flutter_chall/src/home/routes/home_route.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_images.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/utils/validators.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_notification.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/misc/loomi_divider.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field_controller.dart';
import 'package:loomi_flutter_chall/src/shared/presentation/widgets/loomi_social_buttons.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.instance<AuthStore>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    LoomiTextFieldController emailController = LoomiTextFieldController(
      null,
      validators: Validators.email,
    );
    LoomiTextFieldController passwordController = LoomiTextFieldController(
      null,
      validators: Validators.password,
    );

    return Observer(builder: (_) {
      return Scaffold(
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
                  SpacingTokens.v54,
                  SvgPicture.asset(LoomiImages.miniLogo),
                  SpacingTokens.v54,
                  Text(
                    'Welcome Back',
                    style: LoomiTextStyle.h1.style.copyWith(
                      color: ColorTokens.white,
                    ),
                  ),
                  SpacingTokens.v12,
                  Text(
                    'Look who is here!',
                    style: LoomiTextStyle.bodyText2.style,
                  ),
                  SpacingTokens.v64,
                  Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            LoomiTextField(
                              autofocus: false,
                              controller: emailController,
                              hintText: 'Email',
                              onChanged: (String value) =>
                                  authStore.setEmail(value),
                            ),
                            SpacingTokens.v22,
                            LoomiTextField(
                              autofocus: false,
                              controller: passwordController,
                              hintText: 'Password',
                              suffix: SUFFIX.Eye,
                            ),
                          ],
                        ),
                      ),
                      SpacingTokens.v22,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Text(
                              'Forgot password?',
                              style: LoomiTextStyle.extraBold.style.copyWith(
                                fontSize: FontSizeTokens.kilo,
                                color: ColorTokens.purple,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(ForgotPasswordRoute());
                            },
                          ),
                        ],
                      ),
                      SpacingTokens.v50,
                      LoomiButton.primary(
                        isLoading: authStore.isLoading,
                        text: 'Login',
                        onPressed: () async {
                          if (emailController.isValid &&
                              passwordController.isValid) {
                            await authStore.signIn(
                                email: emailController.text,
                                password: passwordController.text);
                            if (authStore.isSuccess) {
                              Navigator.of(context).pushAndRemoveUntil(
                                HomeRoute(),
                                (_) => false,
                              );
                            }
                            if (authStore.isFailure) {
                              passwordController.clear();
                              LoomiNotification.showNotification(
                                  'SignIn error!', authStore.errorMessage!);
                            }
                          } else {
                            emailController.showValidationState();
                            passwordController.showValidationState();
                          }
                        },
                      ),
                      SpacingTokens.v46,
                      const LoomiDivider(title: 'Or Sign in With'),
                      SpacingTokens.v28,
                      LoomiSocialButtons(
                        onApplePressed: () {},
                      ),
                      SpacingTokens.v28,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          InkWell(
                            child: Text(
                              'Sign Up!',
                              style: LoomiTextStyle.subtitle1.style.copyWith(
                                fontWeight: FontWeightTokens.extraBold,
                                color: ColorTokens.purple,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  SignUpRoute(), (_) => false);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SpacingTokens.v24,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
