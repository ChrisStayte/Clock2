import 'dart:math';

import 'package:flutter/material.dart';

class MinuteHandPainter extends CustomPainter {
  final Paint minuteHandPaint = new Paint();
  final minutes;
  final seconds;

  MinuteHandPainter({required this.minutes, required this.seconds}) {
    minuteHandPaint.color = Colors.white.withOpacity(.8);
    minuteHandPaint.style = PaintingStyle.fill;
    minuteHandPaint.strokeWidth = 5.0;
    minuteHandPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate((minutes * 6 + seconds * 0.1) * pi / 180);
    canvas.drawLine(Offset(0, 0), Offset(0, -radius * .8), minuteHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
