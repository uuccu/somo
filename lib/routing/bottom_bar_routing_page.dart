import 'package:agile_frontend/page/my_home_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Saved Page'),
    );
  }
}

class BottomBarRoutingPage extends StatefulWidget {
  @override
  _BottomBarRoutingPageState createState() => _BottomBarRoutingPageState();
}

class _BottomBarRoutingPageState extends State<BottomBarRoutingPage> {
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
  List<Widget> navBarPages = [
    MyHomePage(),
    SavedPage(),
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
      appBar: AppBar(leading: BackButton(
        onPressed: () {
          Navigator.pop(context);
        },
      )),
      body: AnimatedBuilder(
        animation: selectedIndex,
        builder: (BuildContext context, Widget child) {
          return navBarPages[selectedIndex.value];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Lim Chae Yeong
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
            backgroundColor: Colors.black,
          ),
          //BottomNavigationBarItem(
          //icon: Icon(Icons.add),
          //label: 'Add',
          //backgroundColor: Colors.black,
          //),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled_sharp),
            label: 'Community',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
