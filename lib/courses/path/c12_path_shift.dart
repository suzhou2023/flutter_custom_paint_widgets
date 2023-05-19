import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/coordinates.dart';

class PathShift extends CustomPainter {
  late Paint _paint;

  PathShift() {
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
    ..color = Colors.purpleAccent
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  path
    ..lineTo(100, 100)
    ..relativeLineTo(0, -50)
    ..close();

  canvas.drawPath(path, paint);
  canvas.drawPath(path.shift(const Offset(100, 0)), paint);
  canvas.drawPath(path.shift(const Offset(200, 0)), paint);
}
