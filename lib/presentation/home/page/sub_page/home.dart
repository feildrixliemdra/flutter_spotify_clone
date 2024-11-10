import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_image.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_vector.dart';
import 'package:flutter_spotify_clone/core/config/theme/app_color.dart';
import 'package:flutter_spotify_clone/presentation/home/widget/news_song.dart';
import 'package:flutter_spotify_clone/presentation/home/widget/playlist.dart';
import 'package:flutter_svg/svg.dart';

class HomeSubPage extends StatefulWidget {
  const HomeSubPage({super.key});

  @override
  State<HomeSubPage> createState() => _HomeSubPageState();
}

class _HomeSubPageState extends State<HomeSubPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _homeArtisCard(context),
          SizedBox(
            height: 40,
          ),
          _tabs(
            context,
          ),
          SizedBox(
            height: 260,
            child: TabBarView(
              controller: _tabController,
              children: [
                NewsSong(),
                Container(
                  height: 20,
                  width: 20,
                  color: Colors.amber,
                  child: Text('hello2'),
                ),
                Container(
                  child: Text('hello3'),
                ),
                Container(
                  height: 20,
                  width: 20,
                  color: Colors.teal,
                  child: Text('hello4'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Playlist(),
        ],
      ),
    );
  }

  Widget _homeArtisCard(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVector.homeTopCard)),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset(AppImage.homeArtist),
            ),
          )
        ]),
      ),
    );
  }

  Widget _tabs(BuildContext context) {
    return TabBar(
        padding: EdgeInsets.only(bottom: 30),
        controller: _tabController,
        unselectedLabelColor: AppColor.grey,
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorColor: AppColor.primary,
        labelColor: AppColor.primary,
        tabAlignment: TabAlignment.start,
        tabs: [
          Text(
            'News',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'Videos',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'Artists',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'Podcasts',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          )
        ]);
  }
}
