import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/basic_graphic/c01_points.dart';
import 'package:flutter_custom_paint/courses/image_text/c06_axis_scales.dart';

import '../canvas/c02_grid.dart';

class QuadraticBezier extends CustomPainter {
  late Paint _paint;

  QuadraticBezier() {
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
  const Offset p1 = Offset(100, -100);
  const Offset p2 = Offset(160, 50);

  Path path = Path();
  Paint paint = Paint()
    ..color = Colors.purpleAccent
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;
  path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
  path.relativeQuadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
  canvas.drawPath(path, paint);
}
