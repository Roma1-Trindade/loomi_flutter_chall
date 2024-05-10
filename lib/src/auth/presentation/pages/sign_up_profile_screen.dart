import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/home/routes/home_route.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_icons.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_images.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/utils/validators.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_modal_bottom_sheet.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_notification.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field_controller.dart';

class SignUpProfileScreen extends StatelessWidget {
  const SignUpProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.I<AuthStore>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    LoomiTextFieldController nameController = LoomiTextFieldController(
      authStore.user?.displayName,
      validators: Validators.required,
    );

    return Observer(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingTokens.s16,
            vertical: SpacingTokens.s54,
          ),
          child: Center(
            child: Column(
              children: [
                SpacingTokens.v14,
                SvgPicture.asset(LoomiImages.miniLogo),
                SpacingTokens.v54,
                Text(
                  'Tell us more!',
                  style: LoomiTextStyle.h1.style.copyWith(
                    color: ColorTokens.white,
                  ),
                ),
                SpacingTokens.v12,
                Text(
                  'Complete your profile',
                  style: LoomiTextStyle.bodyText2.style,
                ),
                SpacingTokens.v64,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 66),
                  child: Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(34),
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            backgroundColor: ColorTokens.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return LoomiModalBottomSheet(
                                height: 250,
                                title: 'CHOOSE IMAGE',
                                children: [
                                  SpacingTokens.v26,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        borderRadius: BorderRadius.circular(34),
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorTokens.purple_20,
                                              borderRadius:
                                                  BorderRadius.circular(34),
                                              border: Border.all(
                                                  color: ColorTokens.purple)),
                                          constraints: const BoxConstraints(
                                            minHeight: 140,
                                            minWidth: 135,
                                          ),
                                          child: const Center(
                                            child: Column(
                                              children: [
                                                Icon(
                                                  LoomiIcons.camera,
                                                  color: ColorTokens.purple,
                                                ),
                                                SpacingTokens.v10,
                                                SizedBox(
                                                  width: SpacingTokens.s54,
                                                  child: Text(
                                                    'Take a photo',
                                                    textAlign: TextAlign.center,
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SpacingTokens.h20,
                                      InkWell(
                                        borderRadius: BorderRadius.circular(34),
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorTokens.white_10,
                                              borderRadius:
                                                  BorderRadius.circular(34),
                                              border: Border.all(
                                                  color: ColorTokens.white_60)),
                                          constraints: const BoxConstraints(
                                            minHeight: 140,
                                            minWidth: 135,
                                          ),
                                          child: const Center(
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.insert_photo_outlined,
                                                  color: ColorTokens.offWhite,
                                                ),
                                                SpacingTokens.v10,
                                                SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    'Choose from gallery',
                                                    textAlign: TextAlign.center,
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorTokens.purple_20,
                            borderRadius: BorderRadius.circular(34),
                          ),
                          constraints: const BoxConstraints(
                            minHeight: 116,
                            minWidth: 116,
                          ),
                          child: const Icon(
                            LoomiIcons.camera,
                            color: ColorTokens.purple,
                          ),
                        ),
                      ),
                      SpacingTokens.h16,
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose Image'.toUpperCase(),
                              style: LoomiTextStyle.extraBold.style.copyWith(
                                color: ColorTokens.white,
                              ),
                            ),
                            SpacingTokens.v4,
                            Text(
                              'A square .jpg, .gif, or .png image 200x200 or larger',
                              textAlign: TextAlign.start,
                              style: LoomiTextStyle.overline.style.copyWith(
                                color: ColorTokens.white,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SpacingTokens.v64,
                Form(
                  key: formKey,
                  child: LoomiTextField(
                    controller: nameController,
                    hintText: 'Your name',
                  ),
                ),
                SpacingTokens.v64,
                LoomiButton.primary(
                  text: 'Continue',
                  isLoading: authStore.isLoading,
                  onPressed: () async {
                    if (nameController.isValid) {
                      await authStore.signUp(
                        email: authStore.emailText!,
                        password: authStore.passwordText!,
                        name: nameController.text,
                      );

                      if (authStore.isSuccess) {
                        Navigator.of(context).pushAndRemoveUntil(
                          HomeRoute(),
                          (_) => false,
                        );
                      }
                      if (authStore.isFailure) {
                        LoomiNotification.showNotification(
                            'SignUp error!', authStore.errorMessage!);
                      }
                    } else {
                      nameController.showValidationState();
                    }
                  },
                ),
                SpacingTokens.v16,
                LoomiButton.secondary(
                  text: 'Back',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
