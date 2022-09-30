import 'package:clock2/clocks/analog_clock/clock_dial_painter.dart';
import 'package:clock2/clocks/analog_clock/hour_hand_painter.dart';
import 'package:clock2/clocks/analog_clock/minute_hand_painter.dart';
import 'package:clock2/clocks/analog_clock/second_hand_painter.dart';
import 'package:clock2/providers/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0Xff1D1C1E),
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 1.0,
                              child: Container(
                                width: double.infinity,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CustomPaint(
                                      painter: HourHandPainter(
                                        hours: context
                                            .watch<TimeProvider>()
                                            .time
                                            .hour,
                                        minutes: context
                                            .watch<TimeProvider>()
                                            .time
                                            .minute,
                                      ),
                                    ),
                                    CustomPaint(
                                      painter: MinuteHandPainter(
                                        minutes: context
                                            .watch<TimeProvider>()
                                            .time
                                            .minute,
                                        seconds: context
                                            .watch<TimeProvider>()
                                            .time
                                            .second,
                                      ),
                                    ),
                                    CustomPaint(
                                      painter: SecondHandPainter(
                                        seconds: context
                                            .watch<TimeProvider>()
                                            .time
                                            .second,
                                      ),
                                    ),
                                  ],
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
