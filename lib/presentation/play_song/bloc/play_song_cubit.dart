import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/presentation/play_song/bloc/play_song_state.dart';
import 'package:just_audio/just_audio.dart';

class PlaySongCubit extends Cubit<PlaySongState> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  PlaySongCubit() : super(PlaySongLoadingState()) {}

  void updateSongPlayer() {
    emit(PlaySongLoadedState());
  }

  Future<void> loadSong(String url) async {
    try {
      var duration = await audioPlayer.setUrl(url);
      songDuration = duration!;
      audioPlayer.positionStream.listen((position) {
        songPosition = position;
      });
      audioPlayer.play();
      emit(PlaySongLoadedState());
    } catch (e) {
      emit(PlaySongError());
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.pause();

      emit(PlaySongLoadedState());
    } else {
      audioPlayer.play();
      emit(PlaySongLoadedState());
    }
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
