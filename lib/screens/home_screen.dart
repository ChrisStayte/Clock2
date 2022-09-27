import 'package:clock2/clocks/hex_clock.dart';

import 'package:clock2/screens/clock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/time_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Widget> _clocks = [HexClock()];

  List<Widget> _buildClocks(BuildContext context) {
    return _clocks
        .map(
          (clock) => Container(
            margin: EdgeInsets.all(16),
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
        title: Text(
          'Clock2',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0XFF7EB0C9), Color(0XFFDB7343)],
            ),
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
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
    );
  }
}
