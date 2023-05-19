import 'package:flutter/material.dart';

import '../canvas/c02_grid.dart';
import 'c01_points.dart';

class RRectTest extends CustomPainter {
  late Paint _paint;

  RRectTest() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawAxis(canvas, size, _paint);
    drawRect(canvas, size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawRect(Canvas canvas, Size size, Paint paint) {
  paint
    ..color = Colors.blue
    ..strokeWidth = 1.5;

  RRect rrect;

  Rect rectFromCenter = Rect.fromCenter(center: const Offset(0, 0), width: 160, height: 160);
  rrect = RRect.fromRectXY(rectFromCenter, 60, 40);
  canvas.drawRRect(rrect, paint);

  rrect = const RRect.fromLTRBXY(-120, -120, -80, -80, 10, 10);
  canvas.drawRRect(rrect, paint..color = Colors.red);

  rrect = RRect.fromLTRBR(80, -120, 120, -80, const Radius.circular(10));
  canvas.drawRRect(rrect, paint..color = Colors.orange);
}
