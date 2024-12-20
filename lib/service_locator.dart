import 'package:flutter_spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:flutter_spotify_clone/data/repository/song/song_repository_impl.dart';
import 'package:flutter_spotify_clone/data/source/auth/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/data/source/song/song_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repository/auth/auth.dart';
import 'package:flutter_spotify_clone/domain/repository/song/song.dart';
import 'package:flutter_spotify_clone/domain/usecase/auth/signin.dart';
import 'package:flutter_spotify_clone/domain/usecase/song/song.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Auth
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<SignOutUseCase>(SignOutUseCase());

//News Song
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<GetNewsSongUseCase>(GetNewsSongUseCase());

  //Playlist Song
  sl.registerSingleton<GetPlaylistSongUseCase>(GetPlaylistSongUseCase());
}
