import 'dart:ui' as ui show Image;

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/canvas/c02_grid.dart';

class ImagePainter extends CustomPainter {
  final ui.Image? image;
  late Paint _paint;

  ImagePainter(this.image) {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    if (image != null) {
      drawImage(canvas, _paint, image!);
      drawImageRect(canvas, _paint, image!);
    }
  }

  @override
  bool shouldRepaint(ImagePainter oldDelegate) => image != oldDelegate.image;
}

void drawImage(Canvas canvas, Paint paint, ui.Image image) {
  canvas.drawImage(image, Offset(-image.width / 2, -image.height / 2 - 300), paint);
}

void drawImageRect(Canvas canvas, Paint paint, ui.Image image) {
  canvas.drawImageRect(
    image,
    Rect.fromLTRB(0, 0, image.width / 2, image.height / 2),
    Rect.fromLTRB(-image.width / 2, -image.height / 2, 0, 0).translate(-10, -10),
    paint,
  );

  canvas.drawImageRect(
    image,
    Rect.fromLTRB(image.width / 2, 0, image.width as double, image.height / 2),
    Rect.fromLTRB(0, -image.height / 2, image.width / 2, 0).translate(10, -10),
    paint,
  );

  canvas.drawImageRect(
    image,
    Rect.fromLTRB(0, image.height / 2, image.width / 2, image.height as double),
    Rect.fromLTRB(-image.width / 2, 0, 0, image.height / 2).translate(-10, 10),
    paint,
  );

  canvas.drawImageRect(
    image,
    Rect.fromLTRB(image.width / 2, image.height / 2, image.width as double, image.height as double),
    Rect.fromLTRB(0, 0, image.width / 2, image.height / 2).translate(10, 10),
    paint,
  );
}
