import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/basic_graphic/c01_points.dart';
import 'package:flutter_custom_paint/courses/image_text/c06_axis_scales.dart';

import '../canvas/c02_grid.dart';

class PathArc extends CustomPainter {
  late Paint _paint;

  PathArc() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawAxis(canvas, size, _paint);
    drawScales(canvas, size, _paint);
    drawPath(canvas, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawPath(Canvas canvas, Paint paint) {
  paint
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  var rect = Rect.fromCenter(center: const Offset(0, 0), width: 180, height: 120);
  var path = Path()
    ..lineTo(30, 30)
    ..arcTo(rect, 0, pi * 1.5, true);
  canvas.drawPath(path, paint);

  path.reset();
  canvas.translate(200, 0);

  path
    ..lineTo(30, 30)
    ..arcTo(rect, 0, pi * 1.5, false);

  canvas.drawPath(path, paint);
}
