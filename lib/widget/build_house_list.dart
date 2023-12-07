import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/db/firebase_storage.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildHouseList extends StatefulWidget {
  const BuildHouseList({Key? key}) : super(key: key);

  @override
  _BuildHouseListState createState() => _BuildHouseListState();
}

class _BuildHouseListState extends State<BuildHouseList> {
  @override
  Widget build(BuildContext context) {
    return _buildHouseList();
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
          Container(
            width: Screen.designToScreenWidth(context, 177),
            height: Screen.designToScreenHeight(context, 249.4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
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
          ),
        ],
      ),
    );
  }
}
