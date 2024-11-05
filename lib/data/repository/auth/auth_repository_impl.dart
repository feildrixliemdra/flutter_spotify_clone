import 'package:dartz/dartz.dart';

import 'package:flutter_spotify_clone/data/model/auth/sign_in_request.dart';
import 'package:flutter_spotify_clone/data/model/auth/sign_up_request.dart';
import 'package:flutter_spotify_clone/data/source/auth/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repository/auth/auth.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInRequest signInReq) async {
    return await sl<AuthFirebaseService>().signIn(signInReq);
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
