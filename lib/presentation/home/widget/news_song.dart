import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/domain/entity/song/song.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/news_song_cubit.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/news_song_state.dart';
import 'package:flutter_spotify_clone/presentation/play_song/page/now_playing.dart';

class NewsSong extends StatelessWidget {
  const NewsSong({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongCubit()..getNewsSong(),
      child:
          BlocBuilder<NewsSongCubit, NewsSongState>(builder: (context, state) {
        if (state is NewsSongLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NewsSongLoaded) {
          return _songs(context, state.songs);
        }

        return const Center(
          child: Text('error when loading news song'),
        );
      }),
    );
  }

  Widget _songs(BuildContext context, List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NowPlayingPage(song: songs[index]);
            }));
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(songs[index].coverImage),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  songs[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  songs[index].artist,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 14,
        );
      },
      itemCount: songs.length,
    );
  }
}
