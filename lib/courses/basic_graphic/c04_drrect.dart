import 'package:flutter/material.dart';

import '../canvas/c02_grid.dart';
import 'c01_points.dart';

class DRRect extends CustomPainter {
  late Paint _paint;

  DRRect() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawAxis(canvas, size, _paint);
    drawDRRect(canvas, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawDRRect(Canvas canvas, Paint paint) {
  paint
    ..color = Colors.blue
    ..strokeWidth = 1.5;

  Rect outRect = Rect.fromCenter(center: const Offset(0, 0), width: 160, height: 160);
  Rect inRect = Rect.fromCenter(center: const Offset(0, 0), width: 100, height: 100);
  canvas.drawDRRect(RRect.fromRectXY(outRect, 20, 20), RRect.fromRectXY(inRect, 10, 10), paint);

  Rect outRect2 = Rect.fromCenter(center: const Offset(0, 0), width: 60, height: 60);
  Rect inRect2 = Rect.fromCenter(center: const Offset(0, 0), width: 40, height: 40);
  canvas.drawDRRect(RRect.fromRectXY(outRect2, 0, 0), RRect.fromRectXY(inRect2, 0, 0),
      paint..color = Colors.green);
}
