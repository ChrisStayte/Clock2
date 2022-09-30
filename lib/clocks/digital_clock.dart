import 'package:auto_size_text/auto_size_text.dart';
import 'package:clock2/providers/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key, this.dateFormat, this.backgroundColor});

  final String? dateFormat;
  final Color? backgroundColor;

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    DateTime time = context.watch<TimeProvider>().time;

    var hero = Hero(
      tag: widget.dateFormat != null
          ? '${(DigitalClock).toString()}_${widget.dateFormat}'
          : (DigitalClock).toString(),
      child: Container(
        padding: EdgeInsets.all(16),
        color: widget.backgroundColor ?? Colors.black,
        child: SafeArea(
          bottom: false,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: AutoSizeText(
                DateFormat(widget.dateFormat ?? 'hh:mm').format(time),
                maxLines: 1,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 200,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 250) {
        return GestureDetector(
          onTap: () => setState(() => _editing = _editing),
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
                    onPressed: () => {},
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
