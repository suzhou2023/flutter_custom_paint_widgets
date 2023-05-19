import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/basic_graphic/c01_points.dart';
import 'package:flutter_custom_paint/courses/image_text/c06_axis_scales.dart';

import '../canvas/c02_grid.dart';

class PathRelativeMove extends CustomPainter {
  late Paint _paint;

  PathRelativeMove() {
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
  Path path = Path();

  paint
    ..color = Colors.green
    ..style = PaintingStyle.fill;

  path
    ..relativeMoveTo(0, 0)
    ..relativeLineTo(100, 120)
    ..relativeLineTo(-10, -60)
    ..relativeLineTo(60, -10)
    ..close();

  canvas.drawPath(path, paint);

  path.reset();

  paint
    ..style = PaintingStyle.stroke
    ..color = Colors.green
    ..strokeWidth = 2;

  path
    ..relativeMoveTo(-200, 0)
    ..relativeLineTo(100, 120)
    ..relativeLineTo(-10, -60)
    ..relativeLineTo(60, -10)
    ..close();

  canvas.drawPath(path, paint);
}
