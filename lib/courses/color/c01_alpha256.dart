import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/coordinates.dart';

class Alpha256 extends CustomPainter {
  late Paint _paint;

  Alpha256() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawCoordinates(canvas, size, _paint);
    drawColors(canvas, size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

final List<Color> colors = List<Color>.generate(256, (i) => Color.fromARGB(255 - i, 255, 0, 0));

const double step = 20;

void drawColors(Canvas canvas, Size size, Paint paint) {
  // 遍历列表 绘制矩形色块
  canvas.translate(-step * 8.0, -step * 8.0);
  colors.asMap().forEach((i, color) {
    int line = (i % 16); // 行
    int row = i ~/ 16; // 列
    var topLeft = Offset(step * line, step * row);
    var rect = Rect.fromPoints(topLeft, topLeft.translate(step, step));
    canvas.drawRect(
      rect,
      paint
        ..color = color
        ..style = PaintingStyle.fill,
    );
  });
  canvas.restore();
}
