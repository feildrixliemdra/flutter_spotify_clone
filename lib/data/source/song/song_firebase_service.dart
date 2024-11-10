import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/model/song/song.dart';
import 'package:flutter_spotify_clone/domain/entity/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSong();
  Future<Either> getPlaylistSong();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSong() async {
    final List<SongEntity> songs = [];

    try {
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .get();

      for (var e in data.docs) {
        var song = e.data();
        song['id'] = e.id;
        var songModel = SongModel.fromJSON(song);
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return Left('Error when getting news song data.');
    }
  }

  @override
  Future<Either> getPlaylistSong() async {
    final List<SongEntity> songs = [];
    try {
      var data = await FirebaseFirestore.instance.collection('songs').get();

      for (var e in data.docs) {
        var song = e.data();
        song['id'] = e.id;
        var songModel = SongModel.fromJSON(song);
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return Left('Error when getting playlist song data.');
    }
  }
}
