import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Community Page'),
      ),
      bottomNavigationBar: BottomBarRoutingPage(),
    );
  }
}
