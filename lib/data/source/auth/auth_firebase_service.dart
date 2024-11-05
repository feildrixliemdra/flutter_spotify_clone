import 'package:dartz/dartz.dart';

import 'package:flutter_spotify_clone/data/model/auth/sign_in_request.dart';
import 'package:flutter_spotify_clone/data/model/auth/sign_up_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserRequest createUserReq);
  Future<Either> signIn(SignInRequest signInReq);
}

class AuthFirebaseImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInRequest signInReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInReq.email.toString(),
          password: signInReq.password.toString());
      return const Right('Sign in success!');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Invalid Password';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return const Right('Signup success!');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      print('error $e');

      return Left(message);
    }
  }
}
