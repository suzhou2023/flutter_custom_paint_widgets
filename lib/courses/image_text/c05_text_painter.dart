import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/canvas/c02_grid.dart';

class TextPainterTest extends CustomPainter {
  late Paint _paint;

  TextPainterTest() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    drawText2(canvas, _paint);
  }

  @override
  bool shouldRepaint(TextPainterTest oldDelegate) => false;
}

void drawText(Canvas canvas, Paint paint) {
  var textPainter = TextPainter(
      text: const TextSpan(
        text: 'Flutter Paint',
        style: TextStyle(fontSize: 40, color: Colors.black),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr);

  textPainter.layout();
  // valid after layout
  Size size = textPainter.size;
  textPainter.paint(canvas, Offset(-size.width / 2, -size.height / 2));

  canvas.drawRect(
      Rect.fromLTRB(0, 0, size.width, size.height).translate(-size.width / 2, -size.height / 2),
      paint..color = Colors.blue.withAlpha(33));
}

void drawText2(Canvas canvas, Paint paint) {
  paint
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  TextPainter textPainter = TextPainter(
    text: TextSpan(
      text: 'Flutter Paint 随风',
      style: TextStyle(foreground: paint, fontSize: 40),
    ),
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(maxWidth: 250);
  Size size = textPainter.size;

  textPainter.paint(canvas, Offset(-size.width / 2, -size.height / 2));

  paint
    ..color = Colors.blue.withAlpha(33)
    ..style = PaintingStyle.fill;

  canvas.drawRect(
      Rect.fromLTRB(0, 0, size.width, size.height).translate(-size.width / 2, -size.height / 2),
      paint);
}
