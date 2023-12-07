import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/db/firebase_storage.dart';
import 'package:agile_frontend/widget/build_house_list.dart';
import 'package:agile_frontend/widget/house_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/device/screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          _buildHeader(context),
          _buildHouseBoxWidgets(),
          Padding(
              padding: EdgeInsets.only(
                  top: Screen.designToScreenHeight(context, 11))),
          _buildOutlinedButton(),
          Padding(
              padding: EdgeInsets.only(
                  top: Screen.designToScreenHeight(context, 18))),
          _buildRecommendationText(),
          Padding(
              padding: EdgeInsets.only(
                  top: Screen.designToScreenHeight(context, 15))),
          const BuildHouseList(),
        ],
      )),
      bottomNavigationBar: BottomBarRoutingPage(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: Screen.designToScreenHeight(context, 20),
          top: Screen.designToScreenHeight(context, 68),
        ),
        child: const Text(
          'House you\'re\nlooking for! ',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontFamily: 'hgg',
            fontSize: 60,
          ),
        ),
      ),
    );
  }

  Widget _buildHouseBoxWidgets() {
    return Column(
      children: [
        _buildHouseBoxRow(
          'Detached\nHouse',
          'asset/image/home_page/detached_icon.png',
          'Multiplex',
          'asset/image/home_page/multiplex_icon.png',
        ),
        Padding(
            padding:
                EdgeInsets.only(top: Screen.designToScreenHeight(context, 10))),
        _buildHouseBoxRow(
          'Apartment',
          'asset/image/home_page/apartment_icon.png',
          'one-room\nhouse',
          'asset/image/home_page/one-room_icon.png',
        ),
      ],
    );
  }

  Widget _buildHouseBoxRow(
      String text1, String imageUrl1, String text2, String imageUrl2) {
    return Row(
      children: [
        SizedBox(width: Screen.designToScreenHeight(context, 20)),
        HouseBoxWidget(
          text: text1,
          imageUrl: imageUrl1,
        ),
        SizedBox(width: Screen.designToScreenHeight(context, 12)),
        HouseBoxWidget(
          text: text2,
          imageUrl: imageUrl2,
        ),
      ],
    );
  }

  Widget _buildOutlinedButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        fixedSize: Size(Screen.designToScreenWidth(context, 390),
            Screen.designToScreenHeight(context, 36)),
        side: const BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      onPressed: () {},
      child: const Text('Want to sell my home'),
    );
  }

  Widget _buildRecommendationText() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: Screen.designToScreenWidth(context, 20)),
        child: const Text(
          'Today\'s recommendation in Phnom penh',
          style: TextStyle(
            fontFamily: 'hgg',
            fontSize: 20,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
