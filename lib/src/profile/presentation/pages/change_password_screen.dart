import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/utils/validators.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_notification.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.I<AuthStore>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    LoomiTextFieldController currentPasswordController =
        LoomiTextFieldController(
      null,
      validators: Validators.password,
    );
    LoomiTextFieldController newPasswordController = LoomiTextFieldController(
      null,
      validators: Validators.password,
    );
    LoomiTextFieldController confirmNewPasswordController =
        LoomiTextFieldController(
      null,
      validators: Validators.password,
    );

    return Observer(
      builder: (context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingTokens.s18,
            vertical: SpacingTokens.s36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorTokens.purple,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SpacingTokens.v30,
              Text(
                'Change \nPassword',
                style: LoomiTextStyle.extraBold.style.copyWith(
                  color: ColorTokens.white,
                  fontSize: FontSizeTokens.s26,
                ),
              ),
              SpacingTokens.v74,
              Form(
                key: formKey,
                child: Column(
                  children: [
                    LoomiTextField(
                      autofocus: false,
                      hintText: 'Current password',
                      controller: currentPasswordController,
                      suffix: SUFFIX.Eye,
                    ),
                    SpacingTokens.v50,
                    const Divider(
                      color: ColorTokens.darkDivider,
                    ),
                    SpacingTokens.v50,
                    LoomiTextField(
                      autofocus: false,
                      controller: newPasswordController,
                      hintText: 'New password',
                      suffix: SUFFIX.Eye,
                      onChanged: (String value) {
                        confirmNewPasswordController
                            .updateValueToCompareWith(value);
                      },
                    ),
                    SpacingTokens.v22,
                    LoomiTextField(
                      autofocus: false,
                      controller: confirmNewPasswordController,
                      hintText: 'Confirm new password',
                      suffix: SUFFIX.Eye,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: LoomiButton.primary(
                  text: 'Update password',
                  isLoading: authStore.isLoading,
                  onPressed: () async {
                    if (currentPasswordController.isValid) {
                      bool isCorrect = await authStore.checkCurrentPassword(
                          currentPassword: currentPasswordController.text);

                      if (isCorrect) {
                        if (newPasswordController.isValid &&
                            confirmNewPasswordController.isValid) {
                          await authStore.changePassword(
                              newPassword: newPasswordController.text);
                          if (authStore.isSuccess) {
                            Navigator.of(context).pop();
                          }
                          if (authStore.isFailure) {
                            LoomiNotification.showNotification(
                                'Update password error!',
                                authStore.errorMessage!);
                          }
                        } else {
                          newPasswordController.showValidationState();
                          confirmNewPasswordController.showValidationState();
                        }
                      } else {
                        LoomiNotification.showNotification(
                            'Password not match!', authStore.errorMessage!);
                      }
                    } else {
                      currentPasswordController.showValidationState();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
