import 'package:auto_size_text/auto_size_text.dart';
import 'package:clock2/providers/time_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HexClock extends StatelessWidget {
  const HexClock({super.key});

  Color _hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  String _getTimeHex(DateTime dateTime) {
    return '#${dateTime.hour.toString().padLeft(2, '0')}${dateTime.minute.toString().padLeft(2, '0')}${dateTime.second.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    DateTime time = context.watch<TimeProvider>().time;
    return Hero(
      tag: 'clock',
      child: Container(
        padding: EdgeInsets.all(16),
        color: _hexToColor(
          _getTimeHex(time),
        ),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: AutoSizeText(
              _getTimeHex(time).toUpperCase(),
              maxLines: 1,
              minFontSize: 22,
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
  }
}
