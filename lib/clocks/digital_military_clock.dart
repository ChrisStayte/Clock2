import 'package:auto_size_text/auto_size_text.dart';
import 'package:clock2/clocks/hex_clock.dart';
import 'package:clock2/providers/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DigitalMilitaryClock extends StatefulWidget {
  const DigitalMilitaryClock({super.key});

  @override
  State<DigitalMilitaryClock> createState() => _DigitalMilitaryClockState();
}

class _DigitalMilitaryClockState extends State<DigitalMilitaryClock> {
  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    DateTime time = context.watch<TimeProvider>().time;

    var hero = Hero(
      tag: (DigitalMilitaryClock).toString(),
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.black,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: AutoSizeText(
              '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}',
              maxLines: 1,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 80,
              ),
            ),
          ),
        ),
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 250) {
        return GestureDetector(
          onTap: () => setState(() => _editing = !_editing),
          child: Stack(
            children: [
              hero,
              Visibility(
                visible: _editing,
                child: Positioned(
                  left: 40,
                  bottom: 55,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.format_paint_outlined),
                    onPressed: () => print('hello'),
                  ),
                ),
              )
            ],
          ),
        );
      } else {
        return hero;
      }
    });
  }
}
