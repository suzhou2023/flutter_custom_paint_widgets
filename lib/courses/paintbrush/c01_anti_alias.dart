import 'package:flutter/material.dart';

class AntiAlias extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// paintbrush
    final Paint paint = Paint();

    /// with anti-alias
    canvas.drawCircle(
      const Offset(100, 100),
      100,
      paint
        ..color = Colors.red
        ..isAntiAlias = true,
    );

    /// without anti-alias
    canvas.drawCircle(
      const Offset(100 + 200, 100),
      100,
      paint
        ..color = Colors.red
        ..isAntiAlias = false,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
