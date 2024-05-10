import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/auth/routes/success_reset_password_route.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_images.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/utils/validators.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_notification.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.instance<AuthStore>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    LoomiTextFieldController emailController = LoomiTextFieldController(
      authStore.emailText,
      validators: Validators.email,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SpacingTokens.s16,
                vertical: SpacingTokens.s54,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(LoomiImages.miniLogo),
                        SpacingTokens.v54,
                        Text(
                          'Forgot password?',
                          style: LoomiTextStyle.h1.style.copyWith(
                            color: ColorTokens.white,
                          ),
                        ),
                      ],
                    ),
                    SpacingTokens.v12,
                    Text(
                      'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                      style: LoomiTextStyle.bodyText2.style,
                      textAlign: TextAlign.center,
                    ),
                    SpacingTokens.v36,
                    Form(
                      key: formKey,
                      child: LoomiTextField(
                        autofocus: false,
                        controller: emailController,
                        hintText: 'Email',
                      ),
                    ),
                    SpacingTokens.v48,
                    Column(
                      children: [
                        LoomiButton.primary(
                          text: 'Send reset instructions',
                          isLoading: authStore.isLoading,
                          onPressed: () async {
                            if (emailController.isValid) {
                              await authStore.resetPassword(
                                email: emailController.text,
                              );

                              if (authStore.isSuccess) {
                                Navigator.push(
                                  context,
                                  SuccessResetPasswordRoute(),
                                );
                              }
                              if (authStore.isFailure) {
                                LoomiNotification.showNotification(
                                    'Reset password error!',
                                    authStore.errorMessage!);
                              }
                            } else {
                              emailController.showValidationState();
                            }
                          },
                        ),
                        SpacingTokens.v16,
                        LoomiButton.secondary(
                          text: 'Back',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
