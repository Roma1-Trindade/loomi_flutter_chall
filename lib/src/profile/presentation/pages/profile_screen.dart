import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/auth/routes/sign_in_route.dart';
import 'package:loomi_flutter_chall/src/auth/routes/sign_up_route.dart';
import 'package:loomi_flutter_chall/src/profile/routes/change_password_route.dart';
import 'package:loomi_flutter_chall/src/profile/routes/edit_profile_route.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_icons.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_images.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/buttons/loomi_tile_icon_button.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_modal_bottom_sheet.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_notification.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/extensions/date_time_extensions.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/misc/loomi_circular_progress_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.instance<AuthStore>();

    return Observer(
      builder: (context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingTokens.s18,
            vertical: SpacingTokens.s36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingTokens.v12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorTokens.purple,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  LoomiButton.tertiary(
                    text: 'Edit Profile',
                    onPressed: () {
                      Navigator.push(context, EditProfileRoute());
                    },
                    hasBorder: true,
                    width: 120,
                    borderWidth: 0.5,
                  )
                ],
              ),
              SpacingTokens.v30,
              Row(
                children: [
                  FutureBuilder(
                    future: authStore.checkUserPhoto(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                  SpacingTokens.h20,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: LoomiTextStyle.bodyText2.style.copyWith(
                            fontWeight: FontWeightTokens.semiBold,
                            color: ColorTokens.white,
                          ),
                        ),
                        Text(
                          authStore.userNameText != null
                              ? authStore.userNameText!
                              : '',
                          style: LoomiTextStyle.extraBold.style.copyWith(
                            color: ColorTokens.white,
                            fontSize: FontSizeTokens.s26,
                          ),
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SpacingTokens.v36,
              LoomiTileIconButton(
                text: 'Change Password',
                icon: LoomiIcons.shield,
                onPressed: () {
                  Navigator.push(context, ChangePasswordRoute());
                },
              ),
              SpacingTokens.v10,
              LoomiTileIconButton(
                text: 'Delete my account',
                icon: LoomiIcons.trash,
                onPressed: () async {
                  await showModalBottomSheet(
                    backgroundColor: ColorTokens.black,
                    context: context,
                    builder: (context) => LoomiModalBottomSheet(
                      height: 360,
                      title: 'Warning',
                      style: LoomiTextStyle.extraBold.style.copyWith(
                        fontSize: FontSizeTokens.mega,
                        color: ColorTokens.white,
                      ),
                      children: [
                        SpacingTokens.v48,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: SpacingTokens.s24,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Are you sure you want to delete your account?",
                                style: LoomiTextStyle.extraBold.style.copyWith(
                                  color: ColorTokens.white,
                                  fontSize: FontSizeTokens.kilo,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SpacingTokens.v12,
                              Text(
                                "This action is irreversible and all of your data will be permanently deleted. If you're having any issues with our app, we'd love to help you resolve them.",
                                style: LoomiTextStyle.bodyText2.style.copyWith(
                                  color: ColorTokens.white,
                                  fontWeight: FontWeightTokens.semiBold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SpacingTokens.v50,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: SpacingTokens.s12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LoomiButton.secondary(
                                text: 'Cancel',
                                width: 150,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              LoomiButton.primary(
                                text: 'Delete account',
                                width: 150,
                                isLoading: authStore.isLoading,
                                onPressed: () async {
                                  await authStore.deleteAccount();
                                  if (authStore.isSuccess) {
                                    Navigator.pushAndRemoveUntil(context,
                                        SignUpRoute(), (route) => false);
                                  }
                                  if (authStore.isFailure) {
                                    LoomiNotification.showNotification(
                                      'Delete account error!',
                                      authStore.errorMessage!,
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              SpacingTokens.v46,
              Text(
                'Subscriptions',
                style: LoomiTextStyle.bold.style.copyWith(
                  color: ColorTokens.white,
                  fontSize: FontSizeTokens.s18,
                ),
              ),
              SpacingTokens.v14,
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: ColorTokens.tileButtonGray,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage(LoomiImages.subscription),
                            fit: BoxFit.cover,
                          ),
                        ),
                        constraints:
                            const BoxConstraints(maxWidth: 67, maxHeight: 68),
                      ),
                      SpacingTokens.h20,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'STREAM Premium',
                              style: LoomiTextStyle.semiBold.style.copyWith(
                                color: ColorTokens.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SpacingTokens.v2,
                            Text(
                              DateTime(2023, 1, 22).toyMMMdyyyy,
                              style: LoomiTextStyle.semiBold.style.copyWith(
                                fontSize: FontSizeTokens.hecto,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Coming soon',
                        style: LoomiTextStyle.caption.style.copyWith(
                          color: ColorTokens.purple,
                        ),
                      ),
                      SpacingTokens.h16,
                    ],
                  ),
                ),
              ),
              SpacingTokens.v38,
              Text(
                'History',
                style: LoomiTextStyle.bold.style.copyWith(
                  color: ColorTokens.white,
                  fontSize: FontSizeTokens.s18,
                ),
              ),
              Center(
                child: LoomiButton.tertiary(
                  text: 'Log out',
                  width: 120,
                  borderColor: ColorTokens.cardTextColor,
                  textColor: ColorTokens.cardTextColor,
                  isLoading: authStore.isLoading,
                  onPressed: () async {
                    await authStore.signOut();
                    if (authStore.isSuccess) {
                      Navigator.of(context)
                          .pushAndRemoveUntil(SignInRoute(), (route) => false);
                    }
                    if (authStore.isFailure) {
                      LoomiNotification.showNotification(
                          'Sign Out error!', authStore.errorMessage!);
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
