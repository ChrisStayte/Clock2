import 'package:flutter/material.dart';

class AlarmClock extends StatelessWidget {
  const AlarmClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: (AlarmClock).toString(),
      child: Container(
        color: Colors.black,
        child: Center(
            child: Stack(
          children: [
            Center(
              child: Text(
                '88:88',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'AlarmClock',
                  fontSize: 28,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
