import 'dart:ui' as ui show Image;

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/courses/canvas/c02_grid.dart';

class AtlasPainter extends CustomPainter {
  final ui.Image? image;
  late Paint _paint;
  final List<Sprite> sprites = [];

  AtlasPainter(this.image) {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, _paint);
    if (image == null) return;
    // 添加一个 Sprite
    sprites.add(Sprite(
      position: const Rect.fromLTWH(0, 325, 257, 166),
      offset: const Offset(0, 0),
      alpha: 255,
      rotation: 0,
    ));
    // 通过 allSprites 创建 RSTransform 集合
    final List<RSTransform> transforms = sprites
        .map((sprite) => RSTransform.fromComponents(
              rotation: sprite.rotation,
              scale: 1.0,
              anchorX: 0,
              anchorY: 0,
              translateX: sprite.offset.dx,
              translateY: sprite.offset.dy,
            ))
        .toList();
    // 通过 allSprites 创建 Rect 集合
    final List<Rect> rects = sprites.map((sprite) => sprite.position).toList();

    canvas.drawAtlas(image!, transforms, rects, null, null, null, _paint);
  }

  @override
  bool shouldRepaint(AtlasPainter oldDelegate) => image != oldDelegate.image;
}

class Sprite {
  Rect position; // 雪碧图 中 图片矩形区域
  Offset offset; // 移动偏倚
  int alpha; // 透明度
  double rotation; // 旋转角度

  Sprite({
    required this.offset,
    required this.alpha,
    this.rotation = 0,
    required this.position,
  });
}

void drawImage(Canvas canvas, Paint paint, ui.Image image) {
  canvas.drawImage(image, Offset(-image.width / 2, -image.height / 2 - 300), paint);
}
