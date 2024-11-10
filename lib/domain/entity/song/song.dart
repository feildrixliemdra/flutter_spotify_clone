import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String? id;
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  // final bool isFavorite;
  // final String songId;
  final String coverImage;
  final String songUrl;

  SongEntity({
    this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    // required this.isFavorite,
    // required this.songId,
    required this.coverImage,
    required this.songUrl,
  });
}
