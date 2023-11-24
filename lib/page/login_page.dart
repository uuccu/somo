import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';

import '../widget/login_button_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Screen.designToScreenHeight(context, 149 - 40),
                bottom: Screen.designToScreenHeight(context,
                    417 - 149 - 212), // shit!! dirty code! but no much time! ㅠㅠ
              ),
              child: Image(
                image: const AssetImage('asset/image/HOME.png'),
                width: Screen.designToScreenWidth(context, 224.3),
                height: Screen.designToScreenHeight(context, 212),
              ),
            ),
            const LoginButtonWidget(
              text: 'Login With Facebook',
              imageUrl: 'asset/image/login_logo/facebook_logo.png',
            ),
            const LoginButtonWidget(
              text: 'Login With Apple',
              imageUrl: 'asset/image/login_logo/apple_logo.png',
            ),
            const LoginButtonWidget(
              text: 'Login With Google',
              imageUrl: 'asset/image/login_logo/google_logo.png',
            ),
            const LoginButtonWidget(
              text: 'Browse without Login',
              imageUrl: null,
            ),
          ],
        ),
      ),
    );
  }
}
