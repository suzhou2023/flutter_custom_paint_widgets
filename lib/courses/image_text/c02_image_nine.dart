import 'dart:ui' as ui show Image;

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/canvas/c02_grid.dart';

class ImageNine extends CustomPainter {
  final ui.Image? image;
  late Paint _paint;

  ImageNine(this.image) {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    if (image != null) {
      // drawImage(canvas, _paint, image!);
      drawImageNine(canvas, _paint, image!);
    }
  }

  @override
  bool shouldRepaint(ImageNine oldDelegate) => image != oldDelegate.image;
}

void drawImage(Canvas canvas, Paint paint, ui.Image image) {
  canvas.drawImage(image, Offset(-image.width / 2, -image.height / 2 - 300), paint);
}

void drawImageNine(Canvas canvas, Paint paint, ui.Image image) {
  canvas.drawImageNine(
      image,
      Rect.fromCenter(
          center: Offset(image.width / 2, image.height - 6.0),
          width: image.width - 20.0,
          height: 2.0),
      Rect.fromCenter(center: const Offset(0, 0), width: 200, height: 120),
      paint);

  canvas.drawImageNine(
      image,
      Rect.fromCenter(
          center: Offset(image.width / 2, image.height - 6.0),
          width: image.width - 20.0,
          height: 2.0),
      Rect.fromCenter(center: const Offset(0, 0), width: 100, height: 50).translate(250, 0),
      paint);

  canvas.drawImageNine(
      image,
      Rect.fromCenter(
          center: Offset(image.width / 2, image.height - 6.0),
          width: image.width - 20.0,
          height: 2.0),
      Rect.fromCenter(center: const Offset(0, 0), width: 80, height: 250).translate(-250, 0),
      paint);
}
