import 'package:agile_frontend/widget/house_box_widget.dart';
import 'package:flutter/material.dart';

import '../util/device/screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
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
        ),
        Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    bottom: Screen.designToScreenHeight(context, 9))),
            SizedBox(
                width: Screen.designToScreenWidth(context, 390),
                height: Screen.designToScreenWidth(context, 33),
                child: const SizedBox(
                  child: Text("asdfasdfasdfss"),
                )),
          ],
        ),
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: Screen.designToScreenWidth(context, 20))),
            const HouseBoxWidget(
              text: 'Detached\nHouse',
              imageUrl: 'asset/image/home_page/detached_icon.png',
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: Screen.designToScreenWidth(context, 12))),
            const HouseBoxWidget(
              text: 'Multiplex',
              imageUrl: 'asset/image/home_page/multiplex_icon.png',
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(
                bottom: Screen.designToScreenHeight(context, 10))),
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: Screen.designToScreenWidth(context, 20))),
            const HouseBoxWidget(
              text: 'Apartment',
              imageUrl: 'asset/image/home_page/apartment_icon.png',
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: Screen.designToScreenWidth(context, 12))),
            const HouseBoxWidget(
              text: 'one-room\nhouse',
              imageUrl: 'asset/image/home_page/one-room_icon.png',
            ),
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: Screen.designToScreenHeight(context, 11)),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            fixedSize: const Size(390, 36),
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
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Today\'s recommendation in Phnom penh',
              style: TextStyle(
                fontFamily: 'hgg',
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
