import 'package:flutter/material.dart';

import '../week_entry.dart';

class FadeTransitionExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(7, 'FadeTransition', () => FadeTransitionExample());

  @override
  _FadeTransitionExampleState createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  String _buttonTitle;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _buttonTitle = 'Fade Out';
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FadeTransitionExample.weekEntry.name),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Center(
          child: FlatButton(
            color: Colors.green,
            child: Text(_buttonTitle),
            onPressed: () {
              setState(() {
              if (_animationController.isCompleted) {
                _animationController.reverse();
                _buttonTitle = 'Fade Out';
              } else {
                _animationController.forward();
                _buttonTitle = 'Fade In';
              }
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Center(
          child: _myText('Hello, world!'),
        ),
        FadeTransition(
          child: Center(
            child: _myText('Hello, world!'),
          ),
          opacity: Tween(
            begin: 1.0,
            end: 0.0,
          ).animate(_animationController),
        ),
        Center(
          child: _myText('Hello, world!'),
        ),
      ],
    );
  }

  Widget _myText(String text) => Text(
        text,
        style: TextStyle(fontSize: 22),
      );
}
