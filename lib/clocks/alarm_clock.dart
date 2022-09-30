import 'package:auto_size_text/auto_size_text.dart';
import 'package:clock2/providers/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AlarmClock extends StatelessWidget {
  AlarmClock({super.key, this.tag, this.color = Colors.red})
      : _textStyle =
            TextStyle(color: color, fontSize: 300, fontFamily: 'AlarmClock');

  final String? tag;
  final Color color;
  final TextStyle _textStyle;

  String _buildClockString(DateTime time) {
    // Using Unicode character (U+2008) for the colon. It's considered a punctuation space.
    String middle = time.second.isEven ? ' ' : ':';
    String hour = DateFormat('hh').format(time);
    String minute = DateFormat('mm').format(time);
    return '$hour$middle$minute';
  }

  @override
  Widget build(BuildContext context) {
    DateTime time = context.watch<TimeProvider>().time;

    return Hero(
      tag: tag ?? (AlarmClock).toString(),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.black,
          child: SafeArea(
            bottom: false,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        AutoSizeText(
                          '88:88',
                          maxLines: 1,
                          style: _textStyle.copyWith(
                            color: _textStyle.color?.withOpacity(0.2),
                          ),
                        ),
                        AutoSizeText(
                          _buildClockString(time),
                          maxLines: 1,
                          style: _textStyle,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      DateFormat('a').format(time).toUpperCase(),
                      maxLines: 1,
                      style: _textStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
