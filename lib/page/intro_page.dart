import 'package:flutter/material.dart';

import '../util/device/screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                alignment: Alignment.center,
                image: const AssetImage('asset/image/HOME.png'),
                width: Screen.designToScreenWidth(context, 258),
                height: Screen.designToScreenHeight(context, 248)),
            SizedBox(
              height: Screen.designToScreenHeight(context, 10),
            ),
            Image(
              alignment: Alignment.center,
              image: const AssetImage('asset/image/SOMO.png'),
              width: Screen.designToScreenWidth(context, 168),
              height: Screen.designToScreenHeight(context, 39),
            ),
          ],
        ),
      ),
    );
  }
}
