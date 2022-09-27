import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.background});

  final Widget background;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // context.read<RotatingGradientProvider>().animatedGradientContainer,
        background,
        Scaffold(
          appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
          backgroundColor: Colors.transparent,
        )
      ],
    );
  }
}
