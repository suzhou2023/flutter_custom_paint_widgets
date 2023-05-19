import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/coordinates.dart';

class PathContains extends CustomPainter {
  late Paint _paint;

  PathContains() {
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
  canvas.drawPath(path, paint);

  debugPrint('${path.contains(const Offset(20, 20))}');
  debugPrint('${path.contains(const Offset(0, 20))}');

  Rect bounds = path.getBounds();

  canvas.drawRect(
    bounds,
    paint
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1,
  );
}
