import 'package:clock2/clocks/analog_clock/clock_dial_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnalogClock extends StatelessWidget {
  const AnalogClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: (AnalogClock).toString(),
      child: Container(
        padding: EdgeInsets.all(8),
        color: Color(0Xff1D1C1E),
        child: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            return AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: CustomPaint(
                                painter: ClockDialPainter(),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: constraints.biggest.shortestSide / 60,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0Xff1D1C1E),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
