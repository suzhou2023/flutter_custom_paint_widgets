import 'package:flutter/material.dart';

import '../canvas/c02_grid.dart';

class DrawShadow extends CustomPainter {
  late Paint _paint;

  DrawShadow() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawShadow(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawShadow(Canvas canvas) {
  Path path = Path();
  path.lineTo(80, 80);
  path.lineTo(-80, 80);
  path.close();

  canvas.drawShadow(path, Colors.red, 3, true);
  canvas.translate(200, 0);
  canvas.drawShadow(path, Colors.red, 3, false);
}
