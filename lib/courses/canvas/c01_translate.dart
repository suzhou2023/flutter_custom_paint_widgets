import 'package:flutter/material.dart';

class CanvasCenter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    /// canvas move to center
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(const Offset(0, 0), 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
