import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/model/auth/sign_in_request.dart';
import 'package:flutter_spotify_clone/data/model/auth/sign_up_request.dart';

abstract class AuthRepository {
  Future<Either> signUp(CreateUserRequest createUserReq);
  Future<Either> signIn(SignInRequest signInReq);
  Future<Either> getCurrentUser();
  Future<void> signOut();
}
