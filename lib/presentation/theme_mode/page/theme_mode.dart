import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/common/widget/button/basic_app_button.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_image.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_vector.dart';
import 'package:flutter_spotify_clone/core/config/theme/app_color.dart';
import 'package:flutter_spotify_clone/presentation/auth/page/signin_signup.dart';
import 'package:flutter_spotify_clone/presentation/theme_mode/bloc/theme_cubit.dart';
import 'package:flutter_svg/svg.dart';

class ThemeModePage extends StatefulWidget {
  const ThemeModePage({super.key});

  @override
  State<ThemeModePage> createState() => _ThemeModePageState();
}

class _ThemeModePageState extends State<ThemeModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImage.chooseModeBG),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVector.logo),
                    const Spacer(),
                    const Text(
                      'Choose Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.light);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff30393C)
                                          .withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppVector.sun,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Light Mode',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColor.grey,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.dark);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff30393C)
                                          .withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppVector.moon,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Dark Mode',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColor.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    BasicAppButton(
                        text: 'Continue',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SigninSignupPage(),
                              ));
                        })
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   color: Colors.black.withOpacity(0.1),
          // )
        ],
      ),
    );
  }
}
