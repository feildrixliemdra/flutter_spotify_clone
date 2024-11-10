import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/domain/usecase/auth/signin.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/user_state.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoadingState());

  Future<void> getUser() async {
    var user = await sl<GetUserUseCase>().call();

    user.fold((l) {
      emit(UserErrorState());
    }, (data) {
      emit(UserLoadedState(user: data));
    });
  }

  Future<void> signOut() async {
    await sl<SignOutUseCase>().call();
  }
}
