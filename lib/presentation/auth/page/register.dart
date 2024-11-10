import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/widget/appbar/basic_app_bar.dart';
import 'package:flutter_spotify_clone/common/widget/button/basic_app_button.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_vector.dart';
import 'package:flutter_spotify_clone/data/model/auth/sign_up_request.dart';
import 'package:flutter_spotify_clone/domain/usecase/auth/signin.dart';
import 'package:flutter_spotify_clone/presentation/home/page/home.dart';
import 'package:flutter_spotify_clone/service_locator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVector.logo,
          height: 40,
          width: 40,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: _signIupText(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Register',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text('If You Need Any Support, Click Here'),
            const SizedBox(
              height: 35,
            ),
            _fullNameField(context),
            const SizedBox(
              height: 15,
            ),
            _emailField(context),
            const SizedBox(
              height: 15,
            ),
            _passwordField(context),
            const SizedBox(
              height: 15,
            ),
            BasicAppButton(
              text: 'Create Account',
              onPressed: () async {
                var result = await sl<SignUpUseCase>().call(
                    param: CreateUserRequest(
                  fullName: _fullName.text.toString(),
                  email: _email.text.toString(),
                  password: _password.text.toString(),
                ));

                result.fold((l) {
                  var snackBar = SnackBar(content: Text(l));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }, (r) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage()),
                      (route) => false);
                });
              },
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget _signIupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Do you have an account?'),
          TextButton(
            child: const Text('Sign In'),
            onPressed: () {}, //TODO: implement this
          ),
        ],
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
