import 'package:agile_frontend/page/finding_roommate/finding_roommate_condition2.dart';
import 'package:agile_frontend/page/finding_roommate/roommate_find_page.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:agile_frontend/widget/life_style_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FindingRoommateConditionPage5 extends StatelessWidget {
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
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 30)),
            const Text(
              'Are you sensitive to indoor room temperature?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'hgg',
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 30)),
            const LifestyleOptionCard(
              type: 'Temperature Sensitive Type ',
              emoji: '🥵🥶',
              description:
                  "I can't tolerate hot or cold weather well and am sensitive to room temperature",
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 16)),
            const Text(
              'VS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Screen.designToScreenHeight(context, 16)),
            const LifestyleOptionCard(
              type: 'Temperature Tolerant Type',
              emoji: '😐',
              description:
                  "I can withstand hot or cold weather well and am not sensitive to room temperature.",
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
                  onPressed: () {
                    Get.to(RoommateFindPage());
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                      Screen.designToScreenWidth(context, 390),
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
                  child: const Text("Done"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
