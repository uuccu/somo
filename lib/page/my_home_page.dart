import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/db/firebase_storage.dart';
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
    return SingleChildScrollView(
        child: Column(
      children: [
        _buildHeader(context),
        _buildHouseBoxWidgets(),
        Padding(
            padding:
                EdgeInsets.only(top: Screen.designToScreenHeight(context, 11))),
        _buildOutlinedButton(),
        Padding(
            padding:
                EdgeInsets.only(top: Screen.designToScreenHeight(context, 18))),
        _buildRecommendationText(),
        Padding(
            padding:
                EdgeInsets.only(top: Screen.designToScreenHeight(context, 15))),
        _buildHouseList(),
      ],
    ));
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

  Widget _buildHouseList() {
    return Consumer<HouseDataProviderService>(
        builder: (context, houseData, child) {
      return Container(
        height: Screen.designToScreenHeight(context, 249.4),
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding:
              EdgeInsets.only(left: Screen.designToScreenWidth(context, 20)),
          children: houseData.houses
              .map((house) => _buildHouseItem(context, house))
              .toList(),
        ),
      );
    });
  }

  Widget _buildHouseItem(BuildContext context, House house) {
    return FutureBuilder<String>(
      future: FirebaseStorageUtil().getImageUrl(house.imageUrl),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return _buildHouseImageWithText(context, house, snapshot.data!);
          }
        }
      },
    );
  }

  Widget _buildHouseImageWithText(
      BuildContext context, House house, String imageUrl) {
    return Padding(
      padding: EdgeInsets.only(right: Screen.designToScreenWidth(context, 13)),
      child: Stack(
        children: [
          _buildHouseImage(context, imageUrl),
          _buildHouseInfo(context, house),
        ],
      ),
    );
  }

  Widget _buildHouseImage(BuildContext context, String imageUrl) {
    return Container(
      width: Screen.designToScreenWidth(context, 177),
      height: Screen.designToScreenHeight(context, 249.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHouseInfo(BuildContext context, House house) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(14, 49, 70, 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)), // 원하는 반지름 값 설정
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              house.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              house.address,
              style: const TextStyle(
                // todo
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
