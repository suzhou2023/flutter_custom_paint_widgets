import 'package:flutter/material.dart';

class StrokeWidth extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// paintbrush
    final Paint paint = Paint();

    canvas.drawCircle(
      const Offset(100 + 5, 100 + 5),
      100,
      paint
        ..color = Colors.red
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke,
    );

    canvas.drawCircle(
      const Offset(210 + 100, 100),
      100,
      paint
        ..color = Colors.red
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
