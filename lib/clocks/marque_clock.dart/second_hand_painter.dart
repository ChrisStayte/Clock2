import 'dart:math';

import 'package:flutter/material.dart';

class SecondHandPainter extends CustomPainter {
  final Paint secondHandPaint = new Paint();
  final seconds;

  SecondHandPainter({required this.seconds}) {
    secondHandPaint.color = Colors.red;
    secondHandPaint.strokeWidth = 2.0;
    secondHandPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate(seconds * 6 * pi / 180);
    //canvas.drawLine(Offset(0, 0), Offset(0, -radius * .95), secondHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(SecondHandPainter oldDelegate) {
    return this.seconds != oldDelegate.seconds;
  }
}
