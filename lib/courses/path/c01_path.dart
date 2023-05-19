import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/basic_graphic/c01_points.dart';
import 'package:flutter_custom_paint/courses/image_text/c06_axis_scales.dart';

import '../canvas/c02_grid.dart';

class Path01 extends CustomPainter {
  late Paint _paint;

  Path01() {
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
    ..color = Colors.deepPurpleAccent
    ..style = PaintingStyle.fill;

  Path path = Path()
    ..moveTo(0, 0)
    ..lineTo(60, 80)
    ..lineTo(60, 0)
    ..lineTo(0, -80)
    ..close(); // close path

  canvas.drawPath(path, paint);

  paint
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  path
    ..moveTo(0, 0)
    ..lineTo(-60, 80)
    ..lineTo(-60, 0)
    ..lineTo(0, -80);

  canvas.drawPath(path, paint);
}
