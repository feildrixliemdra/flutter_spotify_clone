import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/main.dart';
import 'package:flutter_spotify_clone/presentation/play_song/bloc/play_song_cubit.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final double? elevation;
  final bool? centerTitle;
  const BasicAppBar(
      {this.title,
      this.action,
      this.backgroundColor,
      this.hideBack = false,
      this.elevation = 0,
      this.centerTitle = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
      centerTitle: centerTitle,
      title: title ?? const Text(''),
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.03),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
