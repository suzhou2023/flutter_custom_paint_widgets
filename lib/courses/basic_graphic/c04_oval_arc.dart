import 'dart:math';

import 'package:flutter/material.dart';

import '../canvas/c02_grid.dart';

class OvalArc extends CustomPainter {
  late Paint _paint;

  OvalArc() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawFill(canvas, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawFill(Canvas canvas, Paint paint) {
  var paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.5;

  canvas.save();
  canvas.translate(-200, 0);
  canvas.drawCircle(const Offset(0, 0), 60, paint);
  canvas.restore();

  var rect = Rect.fromCenter(center: const Offset(0, 0), height: 100, width: 120);
  canvas.drawOval(rect, paint);

  canvas.save();
  canvas.translate(200, 0);
  canvas.drawArc(rect, 0, pi / 2 * 3, true, paint);
  canvas.restore();
}
