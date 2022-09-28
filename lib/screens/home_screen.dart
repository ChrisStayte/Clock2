import 'package:clock2/clocks/alarm_clock.dart';
import 'package:clock2/clocks/digital_military_clock.dart';
import 'package:clock2/clocks/hex_clock.dart';

import 'package:clock2/screens/clock_screen.dart';
import 'package:clock2/screens/info_screen.dart';
import 'package:clock2/widgets/animated_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static final List<Widget> _clocks = [
    HexClock(),
    DigitalMilitaryClock(),
    AlarmClock(),
  ];
  final Widget _animatedGradientContainer = AnimatedGradientContainer();

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
              )),
          elevation: 0,
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
          flexibleSpace: _animatedGradientContainer),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: GridView.builder(
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
      ),
    );
  }
}
