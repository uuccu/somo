import 'package:agile_frontend/page/google_map_page.dart';
import 'package:agile_frontend/page/my_home_page.dart';
import 'package:agile_frontend/service/bottom_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class BottomBarRoutingPage extends StatefulWidget {
  @override
  _BottomBarRoutingPageState createState() => _BottomBarRoutingPageState();
}

class _BottomBarRoutingPageState extends State<BottomBarRoutingPage> {
  List<Widget> navBarPages = [
    const MyHomePage(),
    const MyHomePage(),
    GoogleMapPage(),

    // const CommunityPage(),
    // const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    Provider.of<BottomBarProvider>(context, listen: false).currentIndex = index;
    Get.offAll(navBarPages[index]);
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = Provider.of<BottomBarProvider>(context).currentIndex;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Lim Chae Yeong
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('asset/image/bottom_bar/home.png')),
            activeIcon:
                Image(image: AssetImage('asset/image/bottom_bar/home2.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('asset/image/bottom_bar/saved.png')),
            activeIcon:
                Image(image: AssetImage('asset/image/bottom_bar/saved2.png')),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon:
                Image(image: AssetImage('asset/image/bottom_bar/map_icon.png')),
            activeIcon: Image(
                image: AssetImage('asset/image/bottom_bar/map_icon2.png')),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage('asset/image/bottom_bar/community_icon.png')),
            activeIcon: Image(
                image:
                    AssetImage('asset/image/bottom_bar/community_icon2.png')),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon:
                Image(image: AssetImage('asset/image/bottom_bar/profile.png')),
            activeIcon:
                Image(image: AssetImage('asset/image/bottom_bar/profile2.png')),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
