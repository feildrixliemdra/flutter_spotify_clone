import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/source/song/song_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repository/song/song.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSong() async {
    return await sl<SongFirebaseService>().getNewsSong();
  }

  @override
  Future<Either> getPlaylistSong() async {
    return await sl<SongFirebaseService>().getPlaylistSong();
  }
}
