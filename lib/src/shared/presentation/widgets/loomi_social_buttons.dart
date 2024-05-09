import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/home/home_routes.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_images.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_notification.dart';

class LoomiSocialButtons extends StatelessWidget {
  final VoidCallback onApplePressed;
  const LoomiSocialButtons({
    super.key,
    required this.onApplePressed,
  });

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.instance<AuthStore>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () async {
            await authStore.signInWithGoogle();
            if (authStore.isSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                HomeRoute(),
                (_) => false,
              );
            }
            if (authStore.isFailure) {
              LoomiNotification.showNotification(
                  'Authentication error!', authStore.errorMessage!);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorTokens.purple_20,
              borderRadius: BorderRadius.circular(30),
            ),
            constraints: const BoxConstraints(
              minHeight: 70,
              minWidth: 70,
            ),
            child: SvgPicture.asset(
              LoomiImages.googleLogo,
              fit: BoxFit.none,
            ),
          ),
        ),
        SpacingTokens.h16,
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onApplePressed,
          child: Container(
            decoration: BoxDecoration(
              color: ColorTokens.white_33,
              borderRadius: BorderRadius.circular(30),
            ),
            constraints: const BoxConstraints(
              minHeight: 70,
              minWidth: 70,
            ),
            child: SvgPicture.asset(
              LoomiImages.appleLogo,
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
