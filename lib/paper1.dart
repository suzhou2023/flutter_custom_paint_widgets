import 'package:flutter/material.dart';

import 'courses/misc_draw/c04_draw_path.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: DrawPath(),
      ),
    );
  }
}
