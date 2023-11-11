import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              alignment: Alignment.center,
              image: AssetImage('asset/image/HOME.png'),
              width: 258,
              height: 248,
            ),
            SizedBox(
              height: 10,
            ),
            Image(
              alignment: Alignment.center,
              image: AssetImage('asset/image/SOMO.png'),
            ),
          ],
        ),
      ),
    );
  }
}
