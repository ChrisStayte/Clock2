import 'package:clock2/clocks/alarm_clock.dart';
import 'package:clock2/clocks/analog_clock/analog_clock.dart';

import 'package:clock2/clocks/digital_clock.dart';
import 'package:clock2/clocks/hex_clock.dart';
import 'package:clock2/clocks/marque_clock.dart/marque_clock.dart';

import 'package:clock2/screens/clock_screen.dart';
import 'package:clock2/screens/info_screen.dart';
import 'package:clock2/widgets/animated_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static final List<Widget> _clocks = [
    MarqueClock(
      showNumbers: false,
    ),
    AlarmClock(),
    AnalogClock(),
    DigitalClock(),
    AlarmClock(
      tag: 'alarm_green',
      color: Colors.green,
    ),
    AnalogClock(
      tag: 'analog_basic_with_ticks',
      showTicks: true,
    ),
    HexClock(),
    AnalogClock(
      tag: 'analog_basic_with_ticks_and_roman',
      showTicks: true,
      showRomanNumerials: true,
    ),
    DigitalClock(
      dateFormat: 'H:mm:ss',
    ),
    DigitalClock(
      dateFormat: 'hh:mm:ss',
    ),
    AnalogClock(
      tag: 'analog_basic_with_roman',
      showRomanNumerials: true,
    ),
    DigitalClock(
      dateFormat: 'H:mm',
    ),
  ];

  List<Widget> _buildClocks(BuildContext context) {
    return HomeScreen._clocks
        .map(
          (clock) => Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => ClockScreen(
                      clock: clock,
                    ),
                  ),
                ),
              },
              child: clock,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> clocks = _buildClocks(context);
    return Scaffold(
      appBar: AppBar(
          title: Hero(
            tag: 'title',
            child: Text(
              'Clock2',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => InfoScreen(),
                ),
              ),
            },
          ),
          flexibleSpace: AnimatedGradientContainer()),
      body: SafeArea(
        bottom: false,
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            maxCrossAxisExtent: 250,
          ),
          itemCount: clocks.length,
          itemBuilder: (_, index) => clocks[index],
        ),
      ),
    );
  }
}
