import 'package:flutter_spotify_clone/domain/entity/song/song.dart';

abstract class PlaylistSongState {}

class PlaylistSongLoadingState extends PlaylistSongState {}

class PlaylistSongError extends PlaylistSongState {}

class PlaylistSongLoaded extends PlaylistSongState {
  final List<SongEntity> songs;
  PlaylistSongLoaded({required this.songs});
}
