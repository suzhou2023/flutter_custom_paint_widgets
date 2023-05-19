import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/basic_graphic/c01_points.dart';
import 'package:flutter_custom_paint/courses/image_text/c06_axis_scales.dart';

import '../canvas/c02_grid.dart';

class PathConic extends CustomPainter {
  late Paint _paint;

  PathConic() {
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
  const Offset p1 = Offset(80, -100);
  const Offset p2 = Offset(160, 0);

  Path path = Path();
  paint
    ..color = Colors.purpleAccent
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  /// parabola
  path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1);
  canvas.drawPath(path, paint);

  path.reset();
  canvas.translate(-180, 0);

  /// ellipse
  path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 0.5);
  canvas.drawPath(path, paint);

  path.reset();
  canvas.translate(180 + 180.0, 0);

  /// hyperbola
  path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1.5);
  canvas.drawPath(path, paint);
}
