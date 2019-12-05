import 'dart:math';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class AnimatedContainerExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(4, 'AnimatedContainer', () => AnimatedContainerExample());

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  int _state = 0;

  Color _color = Colors.red;

  double _width = 200;
  double _height = 100;
  double _angle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: AnimatedContainer(
              color: _color,
              width: _width,
              height: _height,
              duration: Duration(milliseconds: 600),
              transform: Matrix4.identity()..rotateZ(_angle),
              child: FlatButton(
                child: Text('Do it'),
                onPressed: () {
                  setState(() {
                    _update();
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _update() {
    _state++;
    switch (_state) {
      case 0:
        _color = Colors.green;
        _height = 400;
        break;
      case 1:
        _color = Colors.blue;
        _height = 200;
        _angle = pi / 4;
        break;
      default:
        _color = Colors.red;
        _state = -1;
        _width = 200;
        _height = 100;
        _angle = 0;
    }
  }
}
