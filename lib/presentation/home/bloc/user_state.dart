import 'package:flutter_spotify_clone/domain/entity/auth/user.dart';

abstract class UserState {}

class UserLoadedState extends UserState {
  final UserEntity user;

  UserLoadedState({required this.user});
}

class UserErrorState extends UserState {}

class UserLoadingState extends UserState {}
