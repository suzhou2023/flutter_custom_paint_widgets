import 'dart:ui';

import 'package:flutter/material.dart';

import '../canvas/c02_grid.dart';

class Points extends CustomPainter {
  late Paint _paint;

  Points() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawAxis(canvas, size, _paint);
    drawPoints(canvas, size, _paint);
    drawPolygon(canvas, size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawAxis(Canvas canvas, Size size, Paint paint) {
  paint
    ..color = Colors.blue
    ..strokeWidth = 1.5;

  canvas.drawLine(Offset(-size.width / 2, 0), Offset(size.width / 2, 0), paint);
  canvas.drawLine(Offset(0, -size.height / 2), Offset(0, size.height / 2), paint);
  canvas.drawLine(Offset(0, size.height / 2), Offset(0 - 7.0, size.height / 2 - 10), paint);
  canvas.drawLine(Offset(0, size.height / 2), Offset(0 + 7.0, size.height / 2 - 10), paint);
  canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2 - 10, 7), paint);
  canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2 - 10, -7), paint);
}

final List<Offset> points = [
  const Offset(-120, -20),
  const Offset(-80, -80),
  const Offset(-40, -40),
  const Offset(0, -100),
  const Offset(40, -140),
  const Offset(80, -160),
  const Offset(120, -100),
];

void drawPolygon(Canvas canvas, Size size, Paint paint) {
  paint
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.round;

  canvas.drawPoints(PointMode.polygon, points, paint);
}

void drawLines(Canvas canvas, Size size, Paint paint) {
  paint
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.round;

  canvas.drawPoints(PointMode.lines, points, paint);
}

void drawPoints(Canvas canvas, Size size, Paint paint) {
  paint
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  canvas.drawPoints(PointMode.points, points, paint);
}
