import 'dart:math';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class AnimatedBuilderExample extends StatefulWidget {
  static final weekEntry = WeekEntry(27, 'AnimatedBuilder', (context) => AnimatedBuilderExample());

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> {
  bool _transform = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _actions(),
        title: Text(AnimatedBuilderExample.weekEntry.name),
      ),
      body: Center(
        child: Transform(
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
              print('abc');
            },
          ),
          alignment: Alignment.center,
          transform: _transform
              ? (Matrix4.identity()..rotateZ(-pi / 2))
              : Matrix4.identity(),
        ),
      ),
    );
  }

  List<Widget> _actions() {
    return <Widget>[
      Switch(
        value: _transform,
        onChanged: (bool value) {
          setState(() {
            _transform = value;
          });
        },
      ),
    ];
  }
}
