import 'package:flutter/material.dart';

import '../canvas/c02_grid.dart';

class DrawColor extends CustomPainter {
  late Paint _paint;

  DrawColor() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawPaint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawPaint(Canvas canvas, Size size) {
  // var colors = [
  //   Color(0xFFF60C0C),
  //   Color(0xFFF3B913),
  //   Color(0xFFE7F716),
  //   Color(0xFF3DF30B),
  //   Color(0xFF0DF6EF),
  //   Color(0xFF0829FB),
  //   Color(0xFFB709F4),
  // ];
  // var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];

  // var paint = Paint()
  // ..shader =
  //     ui.Gradient.linear(Offset(0, 0), Offset(size.width, 0), colors, pos, TileMode.clamp);
  // ..blendMode = BlendMode.lighten;
  // canvas.drawPaint(paint);
}
