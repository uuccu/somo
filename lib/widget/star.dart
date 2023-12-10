// create widget of display a star icon
import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  const Star({
    Key? key,
  }) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.star,
        color: Colors.orange[300],
        size: 9,
      ),
    );
  }
}
