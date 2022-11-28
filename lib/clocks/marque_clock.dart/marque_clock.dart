import 'dart:ui';

import 'package:clock2/clocks/marque_clock.dart/clock_dial_painter.dart';
import 'package:clock2/clocks/marque_clock.dart/hour_hand_painter.dart';
import 'package:clock2/clocks/marque_clock.dart/minute_hand_painter.dart';
import 'package:clock2/clocks/marque_clock.dart/second_hand_painter.dart';
import 'package:clock2/providers/time_provider.dart';
import 'package:clock2/widgets/animated_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarqueClock extends StatelessWidget {
  const MarqueClock(
      {super.key,
      this.tag,
      this.showTicks = false,
      this.showRomanNumerials = false,
      this.showNumbers = true});

  final String? tag;
  final bool showTicks;
  final bool showRomanNumerials;
  final bool showNumbers;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? (MarqueClock).toString(),
      child: Stack(
        children: [
          AnimatedGradientContainer(),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.transparent,
            child: Center(
              child: LayoutBuilder(builder: (context, constraints) {
                return AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                    )
                                  ],
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                      width: 1.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white.withOpacity(0.5),
                                      Colors.white.withOpacity(0.2),
                                    ],
                                    stops: [0.0, 1.0],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: CustomPaint(
                                        painter: ClockDialPainter(
                                            showTicks: showTicks,
                                            showNumbers: showNumbers,
                                            clockText: showRomanNumerials
                                                ? ClockText.roman
                                                : ClockText.arabic),
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
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
