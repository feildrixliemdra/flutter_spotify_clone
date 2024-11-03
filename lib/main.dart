import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/config/theme/app_theme.dart';
import 'package:flutter_spotify_clone/presentation/get_started/page/get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // hardcode to light theme for now
      home: const GetStartedPage(),
    );
  }
}
