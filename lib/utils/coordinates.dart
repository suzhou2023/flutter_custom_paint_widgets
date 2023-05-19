import 'package:flutter/material.dart';

const _step = 20.0;

void drawCoordinates(Canvas canvas, Size size, Paint paint, [double step = _step]) {
  drawGrids(canvas, size, paint, step);
  drawAxis(canvas, size, paint);
  drawScales(canvas, size, paint, step);
}

void drawGrids(Canvas canvas, Size size, Paint paint, [double step = _step]) {
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

void drawAxis(Canvas canvas, Size size, Paint paint) {
  paint
    ..color = Colors.blue
    ..strokeWidth = 1.5;

  canvas.drawLine(Offset(-size.width / 2, 0), Offset(size.width / 2, 0), paint);
  canvas.drawLine(Offset(0, -size.height / 2), Offset(0, size.height / 2), paint);
  canvas.drawLine(Offset(0, size.height / 2), Offset(0 - 7.0, size.height / 2 - 10), paint);
  canvas.drawLine(Offset(0, size.height / 2), Offset(0 + 7.0, size.height / 2 - 10), paint);
  canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2 - 10, 7), paint);
  canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2 - 10, -7), paint);
}

void drawScales(Canvas canvas, Size size, Paint paint, [double step = _step]) {
  /// x axis positive
  for (double i = 0; i < size.width / 2; i += step * 2) {
    if (i == 0) continue;
    if (i + step > size.width / 2) continue;
    drawScale(canvas, paint, i);
  }

  /// x axis negative
  for (double i = 0; i > -size.width / 2; i -= step * 2) {
    if (i == 0) continue;
    if (i - step < -size.width / 2) continue;
    drawScale(canvas, paint, i);
  }

  /// y axis positive
  for (double i = 0; i < size.height / 2; i += step * 2) {
    if (i == 0) continue;
    if (i + step > size.height / 2) continue;
    drawScale(canvas, paint, i, false);
  }

  /// y axis negative
  for (double i = 0; i > -size.height / 2; i -= step * 2) {
    if (i == 0) continue;
    if (i - step < -size.height / 2) continue;
    drawScale(canvas, paint, i, false);
  }
}

void drawScale(Canvas canvas, Paint paint, double scale, [bool isX = true]) {
  TextPainter textPainter = TextPainter(
    text: TextSpan(
      text: '${scale.toInt()}',
      style: const TextStyle(fontSize: 12, color: Colors.orange),
    ),
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout();
  Size size = textPainter.size;

  final offset = isX ? Offset(scale - size.width / 2, 2) : Offset(5, scale - size.height / 2);
  textPainter.paint(canvas, offset);
}
