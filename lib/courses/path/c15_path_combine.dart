import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/coordinates.dart';

class PathCombine extends CustomPainter {
  late Paint _paint;

  PathCombine() {
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

  var pathOval = Path()
    ..addOval(Rect.fromCenter(center: const Offset(0, 0), width: 60, height: 60));
  canvas.drawPath(Path.combine(PathOperation.difference, path, pathOval), paint);

  canvas.translate(120, 0);
  canvas.drawPath(Path.combine(PathOperation.intersect, path, pathOval), paint);

  canvas.translate(120, 0);
  canvas.drawPath(Path.combine(PathOperation.union, path, pathOval), paint);

  canvas.translate(-120 * 3.0, 0);
  canvas.drawPath(Path.combine(PathOperation.reverseDifference, path, pathOval), paint);

  canvas.translate(-120, 0);
  canvas.drawPath(Path.combine(PathOperation.xor, path, pathOval), paint);
}
