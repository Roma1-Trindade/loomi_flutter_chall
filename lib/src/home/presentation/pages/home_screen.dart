import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_chall/src/profile/routes/profile_route.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/assets/loomi_images.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/themes/loomi_text_style.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/color_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/tokens/typography_tokens.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/card/loomi_card.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/misc/loomi_circular_progress_indicator.dart';
import 'package:palette_generator/palette_generator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = GetIt.instance<AuthStore>();

    return Observer(
      builder: (context) => Scaffold(
        body: FutureBuilder<PaletteGenerator>(
          future: PaletteGenerator.fromImageProvider(
            const AssetImage(LoomiImages.movie),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoomiCircularProgressIndicator(
                size: 10,
              );
            } else if (snapshot.hasError) {
              return const Text('Error to load image');
            } else {
              final PaletteGenerator palette = snapshot.data!;
              final List<Color> colors = [
                palette.paletteColors[6].color.withOpacity(0.2),
                palette.paletteColors[2].color.withOpacity(0.4),
                palette.paletteColors[6].color.withOpacity(0.2),
                palette.paletteColors[6].color.withOpacity(0.1),
                ColorTokens.black.withOpacity(0)
              ];
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: colors,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SpacingTokens.s16,
                      vertical: SpacingTokens.s54,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(LoomiImages.miniLogo),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(ProfileRoute());
                                },
                                borderRadius: BorderRadius.circular(40),
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
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        constraints: const BoxConstraints(
                                          minHeight: 40,
                                          minWidth: 40,
                                        ),
                                        child: const Icon(
                                          Icons.person_outline,
                                          size: 35,
                                          color: ColorTokens.white,
                                        ),
                                      );
                                    } else {
                                      String? photoURL = snapshot.data;
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          image:
                                              photoURL != '' && photoURL != null
                                                  ? DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        photoURL,
                                                      ),
                                                    )
                                                  : null,
                                        ),
                                        constraints: const BoxConstraints(
                                          minHeight: 40,
                                          minWidth: 40,
                                        ),
                                        child:
                                            photoURL != '' && photoURL != null
                                                ? const SizedBox()
                                                : const Icon(
                                                    Icons.person_outline,
                                                    size: 35,
                                                    color: ColorTokens.white,
                                                  ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SpacingTokens.v8,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Now Showing',
                            style: LoomiTextStyle.extraBold.style.copyWith(
                              fontSize: FontSizeTokens.s18,
                              color: ColorTokens.white,
                            ),
                          ),
                        ),
                        SpacingTokens.v8,
                        LoomiCard(
                          backgroundImage: LoomiImages.movie,
                          gender: 'Musical',
                          title: 'Barbie',
                          synopsis:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                          commentsNumber: 1322,
                          onWatchPressed: () {},
                          available: DateTime(2023, 2, 29),
                          onDislikePressed: () {},
                          onLikePressed: () {},
                          onLoveItPressed: () {},
                          onGiftPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
