import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/basic_graphic/c01_points.dart';
import 'package:flutter_custom_paint/courses/image_text/c06_axis_scales.dart';

import '../canvas/c02_grid.dart';

class AddRect extends CustomPainter {
  late Paint _paint;

  AddRect() {
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

  Rect rect = Rect.fromPoints(const Offset(100, 100), const Offset(160, 160));
  path
    ..lineTo(100, 100)
    ..addRect(rect)
    ..relativeLineTo(100, -100)
    ..addRRect(RRect.fromRectXY(rect.translate(100, -100), 10, 10));
  canvas.drawPath(path, paint);
}
