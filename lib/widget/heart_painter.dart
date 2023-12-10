import 'package:flutter/material.dart';

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color.fromRGBO(254, 142, 72, 1)
      ..style = PaintingStyle.stroke // 경로의 테두리만 색칠
      ..strokeWidth = 1.5;
    final Path path = Path();

    path.moveTo(0.5 * size.width, 0.35 * size.height);
    path.cubicTo(0.2 * size.width, 0.05 * size.height, -0.25 * size.width,
        0.45 * size.height, 0.5 * size.width, size.height);
    path.moveTo(0.5 * size.width, 0.35 * size.height);
    path.cubicTo(0.8 * size.width, 0.05 * size.height, 1.25 * size.width,
        0.45 * size.height, 0.5 * size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
