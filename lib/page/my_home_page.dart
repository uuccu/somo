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
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
            top: Screen.designToScreenHeight(context, 68),
          )),
          const Text(
            'House you\'re\nlooking for! ',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'hgg',
              fontSize: 50,
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
                child: Text("We have to apply search widget here!"), //todo
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: Screen.designToScreenWidth(context, 20))),
              HouseBoxWidget(
                text: 'Detached\nHouse',
                imageUrl: 'asset/image/home_page/detached_icon.png',
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: Screen.designToScreenWidth(context, 12))),
              HouseBoxWidget(
                text: 'Multiplex',
                imageUrl: 'asset/image/home_page/multiplex_icon.png',
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(
                  bottom:
                      Screen.designToScreenHeight(context, 368 - 237 - 121))),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: Screen.designToScreenWidth(context, 20))),
              HouseBoxWidget(
                text: 'Apartment',
                imageUrl: 'asset/image/home_page/apartment_icon.png',
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: Screen.designToScreenWidth(context, 12))),
              HouseBoxWidget(
                text: 'one-room\nhouse',
                imageUrl: 'asset/image/home_page/one-room_icon.png',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: Screen.designToScreenHeight(context, 11)),
          ),
        ],
      ),
    );
  }
}

class HouseBoxWidget extends StatelessWidget {
  const HouseBoxWidget({
    super.key,
    required this.imageUrl,
    required this.text,
  });

  final String text;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        fixedSize: Size(
          Screen.designToScreenWidth(context, 189),
          Screen.designToScreenHeight(context, 121),
        ),
        side: const BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {
        print("Pressed\n$text"); // todo
      },
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-1, -0.8),
            child: Text(text),
          ),
          Align(
            alignment: Alignment(1.4, 0.7),
            child: Image(
              width: Screen.designToScreenWidth(context, 60),
              height: Screen.designToScreenHeight(context, 60),
              image: AssetImage(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}