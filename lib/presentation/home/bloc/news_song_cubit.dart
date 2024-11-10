import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/domain/usecase/song/song.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/news_song_state.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class NewsSongCubit extends Cubit<NewsSongState> {
  NewsSongCubit() : super(NewsSongLoading());

  Future<void> getNewsSong() async {
    var songs = await sl<GetNewsSongUseCase>().call();

    songs.fold((l) {
      emit(NewsSongError());
    }, (data) {
      emit(NewsSongLoaded(songs: data));
    });
  }
}
