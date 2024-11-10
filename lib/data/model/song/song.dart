import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spotify_clone/domain/entity/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  // bool? isFavorite;
  String? id;
  String? coverImage;
  String? songUrl;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    // required this.isFavorite,
    required this.id,
    required this.songUrl,
  });

  SongModel.fromJSON(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
    coverImage = data['coverImage'];
    songUrl = data['songUrl'];
    id = data['id'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      // isFavorite: isFavorite!,
      id: id!,
      coverImage: coverImage!,
      songUrl: songUrl!,
    );
  }
}
