import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/my_home_page.dart';
import '../util/device/screen.dart';
import 'button_widget.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.text,
    required this.imageUrl,
  });
  final String text;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = <Widget>[
      imageUrl?.isNotEmpty ?? false
          ? Image(image: AssetImage(imageUrl!))
          : Container(),
      imageUrl?.isNotEmpty ?? false
          ? SizedBox(width: Screen.designToScreenWidth(context, 45))
          : SizedBox(width: Screen.designToScreenWidth(context, 50)),
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Screen.designToScreenHeight(context, 14),
          color: Colors.black,
        ),
      ),
    ];

    return Padding(
      padding:
          EdgeInsets.only(bottom: Screen.designToScreenHeight(context, 19)),
      child: ButtonWidget(
        text: text,
        imageUrl: imageUrl,
        color: Colors.white,
        width: 280,
        height: 41,
        radius: 8,
        onPressed: () {
          Get.offAll(() => const MyHomePage());
        },
        boxContents: contents,
      ),
    );
  }
}
