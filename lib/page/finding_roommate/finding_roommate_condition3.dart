import 'package:agile_frontend/page/finding_roommate/finding_roommate_condition2.dart';
import 'package:agile_frontend/page/finding_roommate/finding_roommate_condition4.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:agile_frontend/widget/life_style_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FindingRoommateConditionPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: Screen.designToScreenWidth(context, 20),
          right: Screen.designToScreenWidth(context, 20),
          top: Screen.designToScreenHeight(context, 100),
          bottom: Screen.designToScreenHeight(context, 30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Share your living preferences',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'hgg',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 8)),
            const Text(
              'Meet roommates that suits you',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'hgg',
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 30)),
            const Text(
              'What is your sleep behavior?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.orange,
                fontFamily: 'hgg',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 30)),
            const LifestyleOptionCard(
              type: 'I have sleep habits ',
              emoji: '👃🦷',
              description: "(snoring, teeth grinding, etc.)",
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 16)),
            const Text(
              'VS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 16)),
            const LifestyleOptionCard(
              type: 'I do not have any sleep habits',
              emoji: '🚫',
              description: "",
            ),
            const Spacer(),
            const Text(
              'For a better match, try not to use this \'skip\' too often.',
              style: TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                      Screen.designToScreenWidth(context, 180),
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
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                  child: const Text("Skip"),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: Screen.designToScreenWidth(context, 11))),
                OutlinedButton(
                  onPressed: () {
                    Get.to(FindingRoommateConditionPage4());
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                      Screen.designToScreenWidth(context, 180),
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
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
