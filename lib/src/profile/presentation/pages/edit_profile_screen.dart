import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_icons.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/utils/validators.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_modal_bottom_sheet.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_notification.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/misc/loomi_circular_progress_indicator.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/text_field/loomi_text_field_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.I<AuthStore>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    LoomiTextFieldController nameController = LoomiTextFieldController(
      authStore.userNameText,
      validators: Validators.required,
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
              SpacingTokens.v22,
              GestureDetector(
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorTokens.purple,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SpacingTokens.v30,
              Text(
                'Edit\nProfile',
                style: LoomiTextStyle.extraBold.style.copyWith(
                  color: ColorTokens.white,
                  fontSize: FontSizeTokens.s26,
                ),
              ),
              SpacingTokens.v36,
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(57),
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
                                            color: ColorTokens.white_60,
                                          ),
                                        ),
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
                      child: FutureBuilder(
                        future: authStore.checkUserPhoto(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const LoomiCircularProgressIndicator(
                              size: 10,
                            );
                          } else if (snapshot.hasError) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(110),
                              ),
                              constraints: const BoxConstraints(
                                minHeight: 110,
                                minWidth: 110,
                              ),
                              child: const Icon(
                                Icons.person_outline,
                                size: 65,
                                color: ColorTokens.white,
                              ),
                            );
                          } else {
                            String? photoURL = snapshot.data;
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(110),
                                image: photoURL != '' && photoURL != null
                                    ? DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          photoURL,
                                        ),
                                      )
                                    : null,
                              ),
                              constraints: const BoxConstraints(
                                minHeight: 110,
                                minWidth: 110,
                              ),
                              child: photoURL != '' && photoURL != null
                                  ? const SizedBox()
                                  : const Icon(
                                      Icons.person_outline,
                                      size: 65,
                                      color: ColorTokens.white,
                                    ),
                            );
                          }
                        },
                      ),
                    ),
                    SpacingTokens.h24,
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
              SpacingTokens.v38,
              Form(
                key: formKey,
                child: LoomiTextField(
                  autofocus: false,
                  hintText: 'Your name',
                  controller: nameController,
                ),
              ),
              const Spacer(),
              Center(
                child: LoomiButton.primary(
                  text: 'Update profile',
                  isLoading: authStore.isLoading,
                  onPressed: () async {
                    if (nameController.isValid) {
                      await authStore.changeName(name: nameController.text);
                      if (authStore.isSuccess) {
                        Navigator.pop(context);
                      }
                      if (authStore.isFailure) {
                        LoomiNotification.showNotification(
                            'Update profile error!', authStore.errorMessage!);
                      }
                    } else {
                      nameController.showValidationState();
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
