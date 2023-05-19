import 'dart:ui' as ui show Image;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

import 'courses/color/c02_custom_image_paint.dart';

Future<ui.Image>? loadImageFromAssets(String path) async {
  ByteData data = await rootBundle.load(path);
  return decodeImageFromList(data.buffer.asUint8List());
}

Future<img.Image?> loadImageFromAssets2(String path) async {
  ByteData data = await rootBundle.load(path);
  List<int> bytes = data.buffer.asUint8List();
  return img.decodeImage(Uint8List.fromList(bytes));
}

class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  PaperState createState() => PaperState();
}

class PaperState extends State<Paper> {
  ui.Image? _image;
  img.Image? _image2;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    // _image = await loadImageFromAssets('assets/images/wy_300x200.jpg');
    // _image = await loadImageFromAssets('assets/images/right_chat.png');
    _image2 = await loadImageFromAssets2('assets/images/icon_head.png');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: CustomImagePaint(_image2),
      ),
    );
  }
}
