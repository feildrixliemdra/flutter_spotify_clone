import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/core/usecase/usecase.dart';
import 'package:flutter_spotify_clone/domain/repository/song/song.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class GetNewsSongUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<SongRepository>().getNewsSong();
  }
}

class GetPlaylistSongUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<SongRepository>().getPlaylistSong();
  }
}
