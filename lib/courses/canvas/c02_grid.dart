import 'dart:math';

import 'package:flutter/material.dart';

class Grid extends CustomPainter {
  late Paint _paint;

  Grid() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawLineAround(canvas, size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawGrid(Canvas canvas, Size size, Paint paint) {
  drawBottomRight(canvas, size, paint);

  canvas.save();
  // canvas mirror along X-axis
  canvas.scale(1, -1);
  drawBottomRight(canvas, size, paint);
  canvas.restore();

  canvas.save();
  // canvas mirror along Y-axis
  canvas.scale(-1, 1);
  drawBottomRight(canvas, size, paint);
  canvas.restore();

  canvas.save();
  // canvas mirror along (0,0)
  canvas.scale(-1, -1);
  drawBottomRight(canvas, size, paint);
  canvas.restore();
}

void drawBottomRight(Canvas canvas, Size size, Paint paint) {
  paint
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.5;

  canvas.save();
  for (double i = 0; i < size.height / 2; i += 20) {
    canvas.drawLine(const Offset(0, 0), Offset(size.width / 2, 0), paint);
    canvas.translate(0, 20);
  }
  canvas.restore();

  canvas.save();
  for (double i = 0; i < size.width / 2; i += 20) {
    canvas.drawLine(const Offset(0, 0), Offset(0, size.height / 2), paint);
    canvas.translate(20, 0);
  }
  canvas.restore();
}

void drawLineAround(Canvas canvas, Size size, Paint paint) {
  paint
    ..color = Colors.orangeAccent
    ..strokeWidth = 4;

  for (double i = 0; i < size.height / 2; i += 20) {
    canvas.drawLine(const Offset(80, 0), const Offset(100, 0), paint);
    canvas.rotate(2 * pi / 12);
  }
}
