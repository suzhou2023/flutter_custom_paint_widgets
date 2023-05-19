import 'package:flutter/material.dart';

class PathGrids extends CustomPainter {
  late Paint _paint;

  PathGrids() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrids(canvas, size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawGrids(Canvas canvas, Size size, Paint paint) {
  const step = 20.0;
  paint
    ..style = PaintingStyle.stroke
    ..strokeWidth = .5
    ..color = Colors.grey;

  var path = Path();

  for (int i = 0; i < size.width / 2 / step; i++) {
    path.moveTo(step * i, -size.height / 2);
    path.relativeLineTo(0, size.height);
    path.moveTo(-step * i, -size.height / 2);
    path.relativeLineTo(0, size.height);
  }

  for (int i = 0; i < size.height / 2 / step; i++) {
    path.moveTo(-size.width / 2, step * i);
    path.relativeLineTo(size.width, 0);
    path.moveTo(-size.width / 2, -step * i);
    path.relativeLineTo(size.width, 0);
  }
  canvas.drawPath(path, paint);
}
