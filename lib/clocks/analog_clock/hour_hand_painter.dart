import 'dart:math';

import 'package:flutter/material.dart';

class HourHandPainter extends CustomPainter {
  final Paint hourHandPaint = new Paint();
  int hours;
  int minutes;

  HourHandPainter({required this.hours, required this.minutes}) {
    hourHandPaint.color = Colors.black;
    hourHandPaint.style = PaintingStyle.fill;
    hourHandPaint.strokeWidth = 3.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate((hours * 30 + minutes * 0.5) * pi / 180);
    canvas.drawLine(Offset(0, 0), Offset(0, -radius * .5), hourHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
