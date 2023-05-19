import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/coordinates.dart';

class Metrics extends CustomPainter {
  late Paint _paint;

  Metrics() {
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

  path
    ..relativeMoveTo(0, 0)
    ..relativeLineTo(-30, 120)
    ..relativeLineTo(30, -30)
    ..relativeLineTo(30, 30)
    ..close();

  path.addOval(Rect.fromCenter(center: Offset.zero, width: 50, height: 50));

  PathMetrics pms = path.computeMetrics();
  for (var pm in pms) {
    debugPrint("length: ${pm.length} contourIndex: ${pm.contourIndex} isClosed: ${pm.isClosed}");
  }

  canvas.drawPath(path, paint);
}
