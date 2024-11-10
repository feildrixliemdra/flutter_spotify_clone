import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/common/widget/appbar/basic_app_bar.dart';
import 'package:flutter_spotify_clone/core/config/theme/app_color.dart';
import 'package:flutter_spotify_clone/domain/entity/song/song.dart';
import 'package:flutter_spotify_clone/presentation/play_song/bloc/play_song_cubit.dart';
import 'package:flutter_spotify_clone/presentation/play_song/bloc/play_song_state.dart';

class NowPlayingPage extends StatelessWidget {
  final SongEntity song;
  const NowPlayingPage({super.key, required this.song});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        centerTitle: true,
        title: const Text(
          'Now playing',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        action: IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
      ),
      body: BlocProvider(
        create: (_) => PlaySongCubit()..loadSong(song.songUrl),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Builder(builder: (context) {
            return Column(
              children: [
                _songCover(context),
                const SizedBox(
                  height: 20,
                ),
                _songDetail(),
                const SizedBox(
                  height: 30,
                ),
                _songPlayer(context)
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(song.coverImage))),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              song.artist,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ],
        ),
        // FavoriteButton(song: song)
      ],
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<PlaySongCubit, PlaySongState>(
      builder: (context, state) {
        if (state is PlaySongLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is PlaySongLoadedState || state is PlaySongPauseState) {
          return Column(
            children: [
              Slider(
                  value: context
                      .read<PlaySongCubit>()
                      .songPosition
                      .inSeconds
                      .toDouble(),
                  min: 0.0,
                  max: context
                      .read<PlaySongCubit>()
                      .songDuration
                      .inSeconds
                      .toDouble(),
                  onChanged: (value) {}),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(
                      context.read<PlaySongCubit>().songPosition)),
                  Text(formatDuration(
                      context.read<PlaySongCubit>().songDuration))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  context.read<PlaySongCubit>().playOrPauseSong();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.primary),
                  child: Icon(context.read<PlaySongCubit>().audioPlayer.playing
                      ? Icons.pause
                      : Icons.play_arrow),
                ),
              )
            ],
          );
        }

        return Container();
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
