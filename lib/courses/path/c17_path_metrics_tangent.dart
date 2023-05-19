import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/coordinates.dart';

class MetricsTangent extends CustomPainter {
  late Paint _paint;

  MetricsTangent() {
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

  paint
    ..color = Colors.purple
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke;
  canvas.drawPath(path, paint);

  PathMetrics pms = path.computeMetrics();
  for (var pm in pms) {
    Tangent? tangent = pm.getTangentForOffset(pm.length * 0.5);
    if (tangent == null) continue;
    debugPrint(
        "---position:-${tangent.position}----angle:-${tangent.angle}----vector:-${tangent.vector}----");
    paint
      ..color = Colors.deepOrange
      ..style = PaintingStyle.fill;
    canvas.drawCircle(tangent.position, 5, paint);
  }
}
