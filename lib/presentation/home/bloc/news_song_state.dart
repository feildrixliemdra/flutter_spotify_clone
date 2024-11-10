import 'package:flutter_spotify_clone/domain/entity/song/song.dart';

abstract class NewsSongState {}

class NewsSongLoading extends NewsSongState {}

class NewsSongError extends NewsSongState {}

class NewsSongLoaded extends NewsSongState {
  final List<SongEntity> songs;

  NewsSongLoaded({required this.songs});
}
