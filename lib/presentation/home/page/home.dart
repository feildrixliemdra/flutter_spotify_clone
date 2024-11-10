import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/widget/appbar/basic_app_bar.dart';
import 'package:flutter_spotify_clone/core/config/asset/app_vector.dart';
import 'package:flutter_spotify_clone/core/config/theme/app_color.dart';
import 'package:flutter_spotify_clone/presentation/home/page/sub_page/home.dart';
import 'package:flutter_spotify_clone/presentation/home/page/sub_page/profile.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Different AppBars for each tab
  BasicAppBar _buildAppBar() {
    switch (_selectedIndex) {
      case 2:
        return BasicAppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          hideBack: true,
        );
      default:
        return BasicAppBar(
          title: SvgPicture.asset(
            AppVector.logo,
            height: 40,
            width: 40,
          ),
          centerTitle: true,
          hideBack: true,
        );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeSubPage(),
    Text(
      'Index 1: Business',
    ),
    ProfileSubPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primary,
        onTap: _onItemTapped,
        elevation: 0,
        showUnselectedLabels: false,
        enableFeedback: false,
        showSelectedLabels: false,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
