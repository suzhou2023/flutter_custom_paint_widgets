import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/basic_graphic/c01_points.dart';
import 'package:flutter_custom_paint/courses/image_text/c06_axis_scales.dart';

import '../canvas/c02_grid.dart';

class AddPolygon extends CustomPainter {
  late Paint _paint;

  AddPolygon() {
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
    ..color = Colors.purpleAccent
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;
  var p0 = const Offset(100, 100);
  path
    ..lineTo(100, 100)
    ..addPolygon([
      p0,
      p0.translate(20, -20),
      p0.translate(40, -20),
      p0.translate(60, 0),
      p0.translate(60, 20),
      p0.translate(40, 40),
      p0.translate(20, 40),
      p0.translate(0, 20),
    ], true)
    ..addPath(Path()..relativeQuadraticBezierTo(125, -100, 260, 0), Offset.zero)
    ..lineTo(160, 100);
  canvas.drawPath(path, paint);
}
