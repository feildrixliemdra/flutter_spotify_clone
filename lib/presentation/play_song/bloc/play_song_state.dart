abstract class PlaySongState {}

class PlaySongLoadingState extends PlaySongState {}

class PlaySongError extends PlaySongState {}

class PlaySongLoadedState extends PlaySongState {}

class PlaySongPauseState extends PlaySongState {}
