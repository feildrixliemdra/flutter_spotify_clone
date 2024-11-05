import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/core/usecase/usecase.dart';
import 'package:flutter_spotify_clone/data/model/auth/sign_in_request.dart';
import 'package:flutter_spotify_clone/data/model/auth/sign_up_request.dart';
import 'package:flutter_spotify_clone/domain/repository/auth/auth.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SignInUseCase implements UseCase<Either, SignInRequest> {
  @override
  Future<Either> call({SignInRequest? param}) async {
    return sl<AuthRepository>().signIn(param!);
  }
}

class SignUpUseCase implements UseCase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest? param}) {
    return sl<AuthRepository>().signUp(param!);
  }
}
