import 'package:flutter/material.dart';

import '../canvas/c02_grid.dart';

class DrawPath extends CustomPainter {
  late Paint _paint;

  DrawPath() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawPath(canvas, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawPath(Canvas canvas, Paint paint) {
  paint.color = Colors.blue;
  Path path = Path();

  path.lineTo(60, 60);
  path.lineTo(-60, 60);
  path.lineTo(60, -60);
  path.lineTo(-60, -60);
  path.close();

  canvas.drawPath(path, paint);
  canvas.translate(140, 0);
  canvas.drawPath(path, paint..style = PaintingStyle.stroke);
}
