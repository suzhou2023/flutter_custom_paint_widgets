import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/coordinates.dart';

class TextParagraph extends CustomPainter {
  late Paint _paint;

  TextParagraph() {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrids(canvas, size, _paint);
    drawTextWithParagraph(canvas, _paint, TextAlign.center);
  }

  @override
  bool shouldRepaint(TextParagraph oldDelegate) => false;
}

void drawTextWithParagraph(Canvas canvas, Paint paint, TextAlign textAlign) {
  var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
    textAlign: textAlign,
    fontSize: 40,
    textDirection: TextDirection.ltr,
    maxLines: 3,
  ));
  builder.pushStyle(
    ui.TextStyle(color: Colors.black87, textBaseline: ui.TextBaseline.alphabetic),
  );
  builder.addText("Flutter Unit");
  ui.Paragraph paragraph = builder.build();
  paragraph.layout(const ui.ParagraphConstraints(width: 300));
  canvas.drawParagraph(paragraph, const Offset(0, 0));
  canvas.drawRect(const Rect.fromLTRB(0, 0, 300, 40), paint..color = Colors.blue.withAlpha(33));
}
