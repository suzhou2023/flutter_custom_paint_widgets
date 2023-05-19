import 'package:flutter/material.dart';

import '../canvas/c02_grid.dart';
import 'c01_points.dart';

class RectTest extends CustomPainter {
  late Paint _paint;

  RectTest() {
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

  Rect rectFromCenter = Rect.fromCenter(center: const Offset(0, 0), width: 160, height: 160);
  canvas.drawRect(rectFromCenter, paint);

  Rect rectFromLTRB = const Rect.fromLTRB(-120, -120, -80, -80);
  canvas.drawRect(rectFromLTRB, paint..color = Colors.red);

  Rect rectFromLTWH = const Rect.fromLTWH(80, -120, 40, 40);
  canvas.drawRect(rectFromLTWH, paint..color = Colors.orange);

  Rect rectFromCircle = Rect.fromCircle(center: const Offset(100, 100), radius: 20);
  canvas.drawRect(rectFromCircle, paint..color = Colors.green);

  Rect rectFromPoints = Rect.fromPoints(const Offset(-120, 80), const Offset(-80, 120));
  canvas.drawRect(rectFromPoints, paint..color = Colors.purple);
}
