import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedGradientContainer extends StatefulWidget {
  const AnimatedGradientContainer({super.key});

  @override
  State<AnimatedGradientContainer> createState() =>
      _AnimatedGradientContainerState();
}

class _AnimatedGradientContainerState extends State<AnimatedGradientContainer> {
  final List<Color> _colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.lightBlue,
    Colors.orange,
  ]..shuffle();
  final List<Alignment> _alignmentList = const [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerRight,
    Alignment.bottomRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
  ];

  int _index = 0;

  Color _bottomColor = Colors.red;
  Color _topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateColors();
    });
  }

  void _updateColors() {
    setState(() {
      _bottomColor = _colorList[_index % _colorList.length];
      _topColor = _colorList[(_index + 1) % _colorList.length];
      begin = _alignmentList[_index % _alignmentList.length];
      end = _alignmentList[(_index + 4) % _alignmentList.length];
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      onEnd: _updateColors,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            _bottomColor,
            _topColor,
          ],
        ),
      ),
    );
  }
}
