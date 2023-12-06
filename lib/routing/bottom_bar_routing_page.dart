import 'package:agile_frontend/page/my_home_page.dart';
import 'package:flutter/material.dart';

class BottomBarRoutingPage extends StatefulWidget {
  @override
  _BottomBarRoutingPageState createState() => _BottomBarRoutingPageState();
}

class _BottomBarRoutingPageState extends State<BottomBarRoutingPage> {
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
  List<Widget> navBarPages = [
    const MyHomePage(),
    // const Text('add'),
    // const MapPage(),
    // const CommunityPage(),
    // const ProfilePage(),
  ];

  dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBarPages[selectedIndex.value],
      bottomNavigationBar: Container(
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
              icon:
                  Image(image: AssetImage('asset/image/bottom_bar/saved.png')),
              activeIcon:
                  Image(image: AssetImage('asset/image/bottom_bar/saved2.png')),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage('asset/image/bottom_bar/map_icon.png')),
              activeIcon: Image(
                  image: AssetImage('asset/image/bottom_bar/map_icon2.png')),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Image(
                  image:
                      AssetImage('asset/image/bottom_bar/community_icon.png')),
              activeIcon: Image(
                  image:
                      AssetImage('asset/image/bottom_bar/community_icon2.png')),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage('asset/image/bottom_bar/profile.png')),
              activeIcon: Image(
                  image: AssetImage('asset/image/bottom_bar/profile2.png')),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex.value,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
