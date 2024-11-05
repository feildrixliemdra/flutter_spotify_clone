import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/core/config/theme/app_theme.dart';
import 'package:flutter_spotify_clone/firebase_options.dart';
import 'package:flutter_spotify_clone/presentation/get_started/page/get_started.dart';
import 'package:flutter_spotify_clone/presentation/theme_mode/bloc/theme_cubit.dart';
import 'package:flutter_spotify_clone/service_locator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          title: 'Flutter Spotify Clone',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: mode,
          darkTheme: AppTheme.darkTheme,
          home: const GetStartedPage(),
        ),
      ),
    );
  }
}
