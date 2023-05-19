import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/basic_graphic/c01_points.dart';
import 'package:flutter_custom_paint/courses/canvas/c02_grid.dart';

class AxisScale extends CustomPainter {
  late Paint _paint;

  AxisScale() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawAxis(canvas, size, _paint);
    drawScales(canvas, size, _paint);
  }

  @override
  bool shouldRepaint(AxisScale oldDelegate) => false;
}

void drawScales(Canvas canvas, Size size, Paint paint) {
  const step = 40;

  /// x axis positive
  for (double i = 0; i < size.width / 2; i += step) {
    if (i == 0) continue;
    if (i + step / 2 > size.width / 2) continue;
    drawScale(canvas, paint, i);
  }

  /// x axis negative
  for (double i = 0; i > -size.width / 2; i -= step) {
    if (i == 0) continue;
    if (i - step / 2 < -size.width / 2) continue;
    drawScale(canvas, paint, i);
  }

  /// y axis positive
  for (double i = 0; i < size.height / 2; i += step) {
    if (i == 0) continue;
    if (i + step / 2 > size.height / 2) continue;
    drawScale(canvas, paint, i, false);
  }

  /// y axis negative
  for (double i = 0; i > -size.height / 2; i -= step) {
    if (i == 0) continue;
    if (i - step / 2 < -size.height / 2) continue;
    drawScale(canvas, paint, i, false);
  }
}

void drawScale(Canvas canvas, Paint paint, double scale, [bool isX = true]) {
  TextPainter textPainter = TextPainter(
    text: TextSpan(
      text: '${scale.toInt()}',
      style: const TextStyle(fontSize: 12, color: Colors.orange),
    ),
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout();
  Size size = textPainter.size;

  final offset = isX ? Offset(scale - size.width / 2, 2) : Offset(5, scale - size.height / 2);
  textPainter.paint(canvas, offset);
}
