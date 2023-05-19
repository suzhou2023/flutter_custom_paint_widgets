import 'package:flutter/material.dart';

import '../canvas/c02_grid.dart';

class DrawColor extends CustomPainter {
  late Paint _paint;

  DrawColor() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    canvas.drawColor(Colors.blue, BlendMode.lighten);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
