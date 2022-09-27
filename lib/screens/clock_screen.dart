import 'package:flutter/material.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key, required this.clock});

  final Widget clock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        body: clock,
      ),
    );
  }
}
