import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/domain/usecase/song/song.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/playlist_song_state.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class PlaylistSongCubit extends Cubit<PlaylistSongState> {
  PlaylistSongCubit() : super(PlaylistSongLoadingState());

  Future<void> getPlaylistSong() async {
    var songs = await sl<GetPlaylistSongUseCase>().call();

    songs.fold((l) {
      emit(PlaylistSongError());
    }, (data) {
      emit(PlaylistSongLoaded(songs: data));
    });
  }
}
