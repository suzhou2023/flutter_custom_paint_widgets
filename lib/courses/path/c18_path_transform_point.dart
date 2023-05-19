import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/coordinates.dart';

class TransformPoint extends CustomPainter {
  late Paint _paint;

  TransformPoint() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawCoordinates(canvas, size, _paint);
    canvas.translate(-size.width / 2, -size.height / 2);
    drawPaths(canvas, size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawPaths(Canvas canvas, Size size, Paint paint) {
  paint.style = PaintingStyle.stroke;

  Path path = Path()
    // ..moveTo(size.width / 2, size.height / 2)
    ..relativeLineTo(40, 40)
    ..relativeLineTo(0, -40)
    ..close();

  canvas.drawPath(path, paint);

  Matrix4 m4 = Matrix4.translationValues(size.width / 2, size.height / 2, 0);
  Matrix4 center = Matrix4.translationValues(20, 20, 0);
  Matrix4 back = Matrix4.translationValues(-20, -20, 0);

  Matrix4 rotateM4 = Matrix4.rotationZ(10 * pi / 180);
  Matrix4 scaleM4 = Matrix4.diagonal3Values(2, 2, 1);

  m4.multiply(center);
  m4.multiply(rotateM4);
  m4.multiply(scaleM4);
  m4.multiply(back);
  path = path.transform(m4.storage);

  canvas.drawPath(path, paint);
}
