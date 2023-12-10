import 'package:agile_frontend/util/db/entity/house.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';

class HomeNoBox extends StatelessWidget {
  const HomeNoBox({
    super.key,
    required this.house,
  });

  final House house;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.designToScreenHeight(context, 13),
      width: Screen.designToScreenWidth(context, 86),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          // todo home review page routing
          "home no. ${house.completionDate}",
          style: const TextStyle(fontSize: 7.5),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
