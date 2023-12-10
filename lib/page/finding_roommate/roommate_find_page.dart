import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:flutter/material.dart';

class RoommateFindPage extends StatefulWidget {
  @override
  _RoommateFindPageState createState() => _RoommateFindPageState();
}

class _RoommateFindPageState extends State<RoommateFindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Roommate Find Page'),
      ),
      bottomNavigationBar: BottomBarRoutingPage(),
    );
  }
}
