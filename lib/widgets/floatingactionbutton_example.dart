import 'package:flutter/material.dart';

import '../week_entry.dart';

class FloatingActionButtonExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(8, 'FloatingActionButton', (context) => FloatingActionButtonExample());

  @override
  _FloatingActionButtonExampleState createState() =>
      _FloatingActionButtonExampleState();
}

class _FloatingActionButtonExampleState
    extends State<FloatingActionButtonExample> {
  int _location = 0;

  final _locations = [
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endTop,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.miniStartTop,
  ];

  final _names = [
    'centerDocked',
    'centerFloat',
    'endDocked',
    'endFloat',
    'endTop',
    'startTop',
    'miniStartTop',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FloatingActionButtonExample.weekEntry.name),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.wb_sunny),
        backgroundColor: Colors.green,
        mini: _location == 6,
        onPressed: () {
          setState(() {
            _location = (_location + 1) % _locations.length;
          });
        },
      ),
      floatingActionButtonLocation: _locations[_location],
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            _names[_location],
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
