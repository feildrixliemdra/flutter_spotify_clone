import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/widget/button/basic_app_button.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_image.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_vector.dart';
import 'package:flutter_spotify_clone/core/config/theme/app_color.dart';
import 'package:flutter_spotify_clone/presentation/auth/page/signin_signup.dart';
import 'package:flutter_spotify_clone/presentation/theme_mode/page/theme_mode.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImage.introBG),
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
                      'Enjoy Listening to Music',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.grey,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Spotify is a proprietary Swedish audio streaming and media services provider. Enjoy listening to you favorite musice everywhere.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.darkGrey,
                        fontSize: 13,
                        leadingDistribution:
                            TextLeadingDistribution.proportional,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    BasicAppButton(
                        text: 'Get Started',
                        onPressed: () {
                          print('printed');
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
