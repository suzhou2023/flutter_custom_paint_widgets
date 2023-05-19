import 'package:flutter/material.dart';

import 'package:image/image.dart' as img;

class CustomImagePaint extends CustomPainter {
  late Paint _paint;
  img.Image? _image;
  List<Ball> balls = [];
  double pixelW = 6;

  CustomImagePaint(img.Image? image) {
    _paint = Paint();
    if (image != null) {
      _image = image;
      initBalls(image);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.translate(size.width / 2, size.height / 2);
    // drawCoordinates(canvas, size, _paint);

    for (var ball in balls) {
      canvas.drawCircle(Offset(ball.x, ball.y), ball.r, _paint..color = ball.color);
      // var rect = Rect.fromCenter(center: Offset(ball.x, ball.y), width: ball.r, height: ball.r);
      // canvas.drawRect(rect, _paint..color = ball.color);
    }
  }

  @override
  bool shouldRepaint(CustomImagePaint oldDelegate) => oldDelegate._image != _image;

  void initBalls(img.Image image) {
    for (int i = 0; i < image.width; i++) {
      for (int j = 0; j < image.height; j++) {
        Ball ball = Ball();
        ball.x = i * pixelW + pixelW / 2;
        ball.y = j * pixelW + pixelW / 2;
        ball.r = pixelW / 2;
        img.Pixel pixel = image.getPixel(i, j);
        var color =
            Color.fromARGB(pixel.a.toInt(), pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt());
        ball.color = color;
        balls.add(ball);
      }
    }
  }
}

class Ball {
  double x;
  double y;
  Color color;
  double r;

  Ball({
    this.x = 0,
    this.y = 0,
    this.color = Colors.black,
    this.r = 5,
  });
}
