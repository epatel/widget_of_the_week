import 'dart:math';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class AnimatedBuilderExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(27, 'AnimatedBuilder', (context) => AnimatedBuilderExample());

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  double _angle = 0.0;
  double _newAngle = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    final angle = _angle;
    _angle = _newAngle;
    return Scaffold(
      appBar: AppBar(
        title: Text(AnimatedBuilderExample.weekEntry.name),
      ),
      body: Center(
        child: angle != _newAngle ? _animatedButton(angle, _newAngle) : _button(angle),
      ),
    );
  }

  Widget _animatedButton(double oldAngle, double newAngle) {
    final animation = Tween(begin: oldAngle, end: newAngle).animate(_animationController);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return _button(animation.value);
      },
    );
  }

  Widget _button(double angle) {
    return Transform(
        child: FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.blueAccent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            child: Text(
              'I am a button',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              _newAngle += 30;
              _animationController.reset();
              _animationController.forward();
            });
          },
        ),
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateZ(angle * pi / 180.0));
  }
}
