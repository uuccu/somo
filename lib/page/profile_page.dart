import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:agile_frontend/widget/line.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile Page'),
      ),
      backgroundColor: Color(0xffF5F5F5),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
          top: Screen.designToScreenHeight(context, 20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: Screen.designToScreenWidth(context, 20)),
                Container(
                  width: Screen.designToScreenWidth(context, 70),
                  height: Screen.designToScreenHeight(context, 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                      image: AssetImage(
                          'asset/image/agent_init_data/HANDSOMEGUY.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: Screen.designToScreenWidth(context, 100)),
                Column(
                  children: [
                    Text(
                      'Mr. Handsome Guy',
                      style: TextStyle(
                        fontSize: Screen.designToScreenHeight(context, 20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ChingSan Lao',
                      style: TextStyle(
                        fontSize: Screen.designToScreenHeight(context, 15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 10)),
            SizedBox(height: Screen.designToScreenHeight(context, 20)),
            Row(
              children: [
                SizedBox(width: Screen.designToScreenWidth(context, 20)),
                const Image(
                    image:
                        AssetImage('asset/image/house_info/CircleCircle.png')),
                SizedBox(width: Screen.designToScreenWidth(context, 10)),
                Text(
                  'Event',
                  style: TextStyle(
                    fontSize: Screen.designToScreenHeight(context, 20),
                  ),
                ),
                SizedBox(width: Screen.designToScreenWidth(context, 128)),
                Text(
                  'Not Implemented Yet!',
                  style: TextStyle(
                    fontSize: Screen.designToScreenHeight(context, 15),
                  ),
                ),
              ],
            ),
            Line(
                context: context,
                width: Screen.designToScreenWidth(context, 390)),
            SizedBox(height: Screen.designToScreenHeight(context, 10)),
            Row(
              children: [
                SizedBox(width: Screen.designToScreenWidth(context, 20)),
                const Image(
                    image:
                        AssetImage('asset/image/house_info/CircleCircle.png')),
                SizedBox(width: Screen.designToScreenWidth(context, 10)),
                Text(
                  'Create House',
                  style: TextStyle(
                    fontSize: Screen.designToScreenHeight(context, 20),
                  ),
                ),
                SizedBox(width: Screen.designToScreenWidth(context, 60)),
                Text(
                  'Not Implemented Yet!',
                  style: TextStyle(
                    fontSize: Screen.designToScreenHeight(context, 15),
                  ),
                ),
              ],
            ),
            Line(
                context: context,
                width: Screen.designToScreenWidth(context, 390)),
            SizedBox(height: Screen.designToScreenHeight(context, 10)),
            Row(
              children: [
                SizedBox(width: Screen.designToScreenWidth(context, 20)),
                const Image(
                    image:
                        AssetImage('asset/image/house_info/CircleCircle.png')),
                SizedBox(width: Screen.designToScreenWidth(context, 10)),
                Text(
                  'Report Log',
                  style: TextStyle(
                    fontSize: Screen.designToScreenHeight(context, 20),
                  ),
                ),
                SizedBox(width: Screen.designToScreenWidth(context, 83)),
                Text(
                  'Not Implemented Yet!',
                  style: TextStyle(
                    fontSize: Screen.designToScreenHeight(context, 15),
                  ),
                ),
              ],
            ),
            Line(
                context: context,
                width: Screen.designToScreenWidth(context, 390)),
            SizedBox(height: Screen.designToScreenHeight(context, 10)),
            SizedBox(height: Screen.designToScreenHeight(context, 20)),
            Row(
              children: [
                SizedBox(width: Screen.designToScreenWidth(context, 20)),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                      Screen.designToScreenWidth(context, 190),
                      Screen.designToScreenHeight(context, 40),
                    )),
                    side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(
                            color: Color.fromRGBO(254, 142, 72, 1))),
                    alignment: Alignment.center,
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(254, 142, 72, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                  ),
                  child: const Text("Edit profile"),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: Screen.designToScreenWidth(context, 11))),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                      Screen.designToScreenWidth(context, 190),
                      Screen.designToScreenHeight(context, 40),
                    )),
                    side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Colors.grey)),
                    alignment: Alignment.center,
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                  ),
                  child: const Text("Log out"),
                )
              ],
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 20)),
            SizedBox(height: Screen.designToScreenHeight(context, 20)),
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
            SizedBox(
              height: Screen.designToScreenHeight(context, 20),
            ),
            const Text(
              'app version 1.0.0',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: Screen.designToScreenHeight(context, 10),
            ),
            Container(
              width: Screen.designToScreenWidth(context, 500),
              height: Screen.designToScreenHeight(context, 10),
              color: Colors.grey[300],
            ),
            SizedBox(
              height: Screen.designToScreenHeight(context, 3),
            ),
            const Text(
              'made by AGILE TEAM Thanks for using our app!',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomBarRoutingPage(),
    );
  }
}
