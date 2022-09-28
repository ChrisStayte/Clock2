import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.background});

  final Widget background;

  static final List<Widget> informationBoxes = [
    FrostedBox(
      child: Center(
        child: Text("test"),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // context.read<RotatingGradientProvider>().animatedGradientContainer,
        background,
        Scaffold(
          appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  maxCrossAxisExtent: 250,
                ),
                itemCount: informationBoxes.length,
                itemBuilder: (_, index) => informationBoxes[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FrostedBox extends StatelessWidget {
  const FrostedBox({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                  )
                ],
                border: Border.all(
                    color: Colors.white.withOpacity(0.2), width: 1.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2)
                  ],
                  stops: [0.0, 1.0],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
