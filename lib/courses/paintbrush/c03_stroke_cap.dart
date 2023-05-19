import 'package:flutter/material.dart';

class StrokeCapTest extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 20;
    canvas.drawLine(
      const Offset(50, 50),
      const Offset(50, 150),
      paint..strokeCap = StrokeCap.butt,
    );
    canvas.drawLine(
      const Offset(50 + 50.0, 50),
      const Offset(50 + 50.0, 150),
      paint..strokeCap = StrokeCap.round,
    );
    canvas.drawLine(
      const Offset(50 + 50.0 * 2, 50),
      const Offset(50 + 50.0 * 2, 150),
      paint..strokeCap = StrokeCap.square,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
