import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    super.key,
    required this.context,
    required this.width,
  });

  final BuildContext context;
  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: Screen.designToScreenWidth(context, width),
        child: const Divider(
          color: Color.fromRGBO(217, 217, 217, 1),
          thickness: 0.5,
        ),
      );
}
