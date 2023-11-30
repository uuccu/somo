import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                top: Screen.designToScreenHeight(context, 149),
                bottom: Screen.designToScreenHeight(context,
                    417 - 149 - 212), // shit!! dirty code! but no much time! ㅠㅠ
              ),
              child: Image(
                image: const AssetImage('asset/image/HOME.png'),
                width: Screen.designToScreenWidth(context, 224.3),
                height: Screen.designToScreenHeight(context, 212),
              ),
            ),
            LoginButtonWidget(
              text: 'Login With Facebook',
              imageUrl: 'asset/image/login_logo/facebook_logo.png',
              onPressed: () {
                Get.to(() => BottomBarRoutingPage());
              },
            ),
            LoginButtonWidget(
              text: 'Login With Apple',
              imageUrl: 'asset/image/login_logo/apple_logo.png',
              onPressed: () {
                Get.to(() => BottomBarRoutingPage());
              },
            ),
            LoginButtonWidget(
              text: 'Login With Google',
              imageUrl: 'asset/image/login_logo/google_logo.png',
              onPressed: () {
                Get.to(() => BottomBarRoutingPage());
              },
            ),
            LoginButtonWidget(
              text: 'Browse without Login',
              imageUrl: null,
              onPressed: () {
                Get.to(() => BottomBarRoutingPage());
              },
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: Screen.designToScreenWidth(context, 75),
                  ),
                ),
                SizedBox(
                  width: Screen.designToScreenWidth(context, 85.61),
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: Screen.designToScreenWidth(context, 6),
                  ),
                ),
                const Text(
                  'or connect with',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: Screen.designToScreenWidth(context, 6),
                  ),
                ),
                SizedBox(
                  width: Screen.designToScreenWidth(context, 85.61),
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(() => BottomBarRoutingPage());
              },
              child: const Image(
                image: AssetImage('asset/image/login_logo/twitter_logo.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Screen.designToScreenHeight(context, 30),
                bottom: Screen.designToScreenHeight(context, 56),
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Don’t have any account? Sign Up',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )),
            ),
            const Text(
              'By continuing with an account located in Cambodia,\nyou agree to our Terms of Service and acknowledge\n that you have read our Privacy Policy.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
