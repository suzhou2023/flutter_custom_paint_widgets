import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/basic_graphic/c01_points.dart';
import 'package:flutter_custom_paint/courses/image_text/c06_axis_scales.dart';

import '../canvas/c02_grid.dart';

class PathArcToPoint extends CustomPainter {
  late Paint _paint;

  PathArcToPoint() {
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

  var path = Path();

  path
    ..lineTo(80, -40)
    ..arcToPoint(
      const Offset(40, 40),
      radius: const Radius.circular(60),
      largeArc: false,
    )
    ..close();
  canvas.drawPath(path, paint);

  path.reset();
  canvas.translate(-150, 0);
  path
    ..lineTo(80, -40)
    ..arcToPoint(
      const Offset(40, 40),
      radius: const Radius.circular(60),
      largeArc: true,
      clockwise: false,
    )
    ..close();
  canvas.drawPath(path, paint);

  path.reset();
  canvas.translate(150 + 150, 0);
  path
    ..lineTo(80, -40)
    ..arcToPoint(
      const Offset(40, 40),
      radius: const Radius.circular(60),
      largeArc: true,
    )
    ..close();
  canvas.drawPath(path, paint);
}
