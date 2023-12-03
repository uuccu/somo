import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/device/screen.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
    required this.radius,
    required this.onPressed,
    required this.boxContents,
  });

  final String text;
  final String? imageUrl;
  final Color color;
  final double width;
  final double height;
  final double radius;
  final VoidCallback onPressed;
  final List<Widget> boxContents;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
        fixedSize: Size(
          Screen.designToScreenWidth(context, width),
          Screen.designToScreenHeight(context, height),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Row(children: boxContents),
    );
  }
}
