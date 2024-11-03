import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/widget/appbar/basic_app_bar.dart';
import 'package:flutter_spotify_clone/common/widget/button/basic_app_button.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_image.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_vector.dart';
import 'package:flutter_spotify_clone/presentation/auth/page/register.dart';
import 'package:flutter_spotify_clone/presentation/auth/page/signin.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SigninSignupPage extends StatelessWidget {
  const SigninSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVector.topPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImage.authBG,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVector.bottomPattern),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVector.logo),
                  const SizedBox(
                    height: 75,
                  ),
                  Container(
                    child: const Text(
                      'Enjoy Listening to Music',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: BasicAppButton(
                            height: 60,
                            text: 'Register',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RegisterPage(),
                                ),
                              );
                            },
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignInPage(),
                                ),
                              );
                            }),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
