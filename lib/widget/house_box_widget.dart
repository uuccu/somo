import 'package:agile_frontend/page/google_map_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/device/screen.dart';

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
        Get.to(GoogleMapPage());
      },
      child: Stack(
        children: <Widget>[
          Align(
            alignment: const Alignment(-1, -0.8),
            child: Text(text),
          ),
          Align(
            alignment: const Alignment(1.4, 0.7),
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
