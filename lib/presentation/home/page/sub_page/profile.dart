import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/common/widget/button/basic_app_button.dart';
import 'package:flutter_spotify_clone/core/config/theme/app_color.dart';
import 'package:flutter_spotify_clone/presentation/get_started/page/get_started.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/user_cubit.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/user_state.dart';

class ProfileSubPage extends StatelessWidget {
  const ProfileSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => UserCubit()..getUser(),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UserLoadedState) {
              return SingleChildScrollView(
                child: Container(
                  height: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: AppColor.darkGrey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              )),
                          height: MediaQuery.of(context).size.height / 4,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                maxRadius: 38,
                                backgroundColor: Colors.black12,
                                child: Icon(Icons.person),
                              ),
                              Text(
                                '${state.user.fullName}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${state.user.email}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: BasicAppButton(
                              text: 'Sign Out',
                              onPressed: () {
                                context.read<UserCubit>().signOut().then(
                                  (value) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const GetStartedPage(),
                                        ));
                                  },
                                );
                              })),
                    ],
                  ),
                ),
              );
            }

            return const Center(
              child: Text('something went wrong'),
            );
          },
        ));
  }
}
