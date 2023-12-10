import 'package:agile_frontend/page/home_information.dart';
import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/db/firebase_storage.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:agile_frontend/widget/line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Saved Page'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 32,
          itemBuilder: (context, index) {
            return ListTile(
              title: _buildHouseItem(
                  context,
                  Provider.of<HouseDataProviderService>(context, listen: false)
                      .houses[index.toString()]!),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomBarRoutingPage(),
    );
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
            return _buildHouseInfoBox(context, house, snapshot.data!);
          }
        }
      },
    );
  }

  Widget _buildHouseInfoBox(
      BuildContext context, House house, String imageUrl) {
    return GestureDetector(
        onTap: () {
          Provider.of<HouseDataProviderService>(context, listen: false)
              .changeHomeInformationIndex(int.parse(house.id));
          Get.to(() => const HomeInformation());
        },
        child: SizedBox(
          height: Screen.designToScreenHeight(context, 140),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      imageUrl,
                      width: Screen.designToScreenWidth(context, 148),
                      height: Screen.designToScreenHeight(context, 114),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 27))),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: '${house.name}\n',
                            style: const TextStyle(fontSize: 16.0)),
                        TextSpan(
                            text: house.price,
                            style: const TextStyle(fontSize: 20.0)),
                        const TextSpan(
                            text: ' per month',
                            style: TextStyle(fontSize: 16.0)),
                        TextSpan(
                          text:
                              '\n${house.floor} floor, near RUPP, \nlarge hallway',
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 23))),
                  GestureDetector(
                      onTap: () {
                        Provider.of<HouseDataProviderService>(context,
                                listen: false)
                            .changeHomeInformationIndex(int.parse(house.id));
                        Get.to(() => const HomeInformation());
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ))
                ],
              ),
              Line(context: context, width: 390)
            ],
          ),
        ));
  }
}
