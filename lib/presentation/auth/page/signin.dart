import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spotify_clone/common/widget/appbar/basic_app_bar.dart';
import 'package:flutter_spotify_clone/common/widget/button/basic_app_button.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_vector.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _email = TextEditingController();
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
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text('If You Need Any Support, Click Here'),
            const SizedBox(
              height: 35,
            ),
            _emailField(context),
            const SizedBox(
              height: 10,
            ),
            _passwordField(context),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.topRight, child: Text('Forgot Password?')),
            const SizedBox(
              height: 10,
            ),
            BasicAppButton(
              text: 'Sign In',
              onPressed: () {}, //TODO: implement this
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
          const Text('Not a member ?'),
          TextButton(
            child: const Text('Register Now'),
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

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}