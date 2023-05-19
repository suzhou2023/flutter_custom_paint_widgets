import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/coordinates.dart';

class PathTransform extends CustomPainter {
  late Paint _paint;

  PathTransform() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawCoordinates(canvas, size, _paint);
    drawPaths(canvas, size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawPaths(Canvas canvas, Size size, Paint paint) {
  Path path = Path();

  paint
    ..color = Colors.purple
    ..style = PaintingStyle.fill;

  path
    ..relativeMoveTo(0, 0)
    ..relativeLineTo(-30, 120)
    ..relativeLineTo(30, -30)
    ..relativeLineTo(30, 30)
    ..close();

  for (int i = 0; i < 8; i++) {
    canvas.drawPath(path.transform(Matrix4.rotationZ(i * pi / 4).storage), paint);
  }
}
