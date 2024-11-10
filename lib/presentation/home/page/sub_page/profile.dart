import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/common/widget/appbar/basic_app_bar.dart';
import 'package:flutter_spotify_clone/common/widget/button/basic_app_button.dart';
import 'package:flutter_spotify_clone/core/config/theme/app_color.dart';
import 'package:flutter_spotify_clone/presentation/auth/page/signin.dart';
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
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UserLoadedState) {
              return SingleChildScrollView(
                child: Container(
                  height: double.maxFinite,
                  decoration: BoxDecoration(
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
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              )),
                          height: MediaQuery.of(context).size.height / 4,
                          child: Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 38,
                                backgroundColor: Colors.black12,
                                child: Icon(Icons.person),
                              ),
                              Text(
                                '${state.user.fullName}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${state.user.email}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 65,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: BasicAppButton(
                              text: 'Sign Out',
                              onPressed: () {
                                context.read<UserCubit>().signOut().then(
                                  (value) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              GetStartedPage(),
                                        ));
                                  },
                                );
                              })),
                    ],
                  ),
                ),
              );
            }

            return Center(
              child: Text('something went wrong'),
            );
          },
        ));
  }
}
