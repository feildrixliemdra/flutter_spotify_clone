import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/domain/entity/song/song.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/playlist_song_cubit.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/playlist_song_state.dart';
import 'package:flutter_spotify_clone/presentation/play_song/page/now_playing.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistSongCubit()..getPlaylistSong(),
      child: BlocBuilder<PlaylistSongCubit, PlaylistSongState>(
          builder: (context, state) {
        if (state is PlaylistSongLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PlaylistSongLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Playlist',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'See More',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xffC6C6C6)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  // child: _playlistSong(context, state.songs),
                  child: _playlistSong(context, state.songs),
                )
              ],
            ),
          );
        }

        return Center(
          child: Container(
              child: const Text('error while fetching playlist data')),
        );
      }),
    );
  }

  Widget _playlistSong(BuildContext context, List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return NowPlayingPage(song: songs[index]);
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      // color: context.isDarkMode ? AppColors.darkGrey : const Color(0xffE6E6E6)
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      // color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555) ,
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songs[index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      songs[index].artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 11),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      songs[index].duration.toString().replaceAll('.', ':'),
                      style: const TextStyle(
                          fontSize: 12), // Add font size if needed
                    ),
                    const Icon(Icons.favorite, size: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 14,
        );
      },
      itemCount: songs.length,
    );
  }
}
