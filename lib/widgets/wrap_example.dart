import 'dart:math';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class WrapExample extends StatefulWidget {
  static final weekEntry = WeekEntry(3, 'Wrap', () => WrapExample());

  @override
  _WrapExampleState createState() => _WrapExampleState();
}

class _WrapExampleState extends State<WrapExample> {
  var _wrapOnOrOff = false;
  var _rowOrColumn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WrapExample.weekEntry.name),
        actions: _actions(),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return _makeWrapRowOrColumn(
      children: <Widget>[
        _makeContainer(
          index: 1,
          color: Colors.lightBlueAccent,
        ),
        _makeContainer(
          index: 2,
          color: Colors.amberAccent,
        ),
        _makeContainer(
          index: 3,
          color: Colors.lightBlueAccent,
        ),
        _makeContainer(
          index: 4,
          color: Colors.yellowAccent,
        ),
        _makeContainer(
          index: 5,
          color: Colors.greenAccent,
        ),
        _makeContainer(
          index: 6,
          color: Colors.amberAccent,
        ),
        _makeContainer(
          index: 7,
          color: Colors.lightBlueAccent,
        ),
        _makeContainer(
          index: 8,
          color: Colors.yellowAccent,
        ),
        _makeContainer(
          index: 9,
          color: Colors.greenAccent,
        ),
        _makeContainer(
          index: 10,
          color: Colors.amberAccent,
        ),
        _makeContainer(
          index: 11,
          color: Colors.lightBlueAccent,
        ),
        _makeContainer(
          index: 12,
          color: Colors.amberAccent,
        ),
      ],
    );
  }

  Widget _makeWrapRowOrColumn({List<Widget> children}) {
    if (_wrapOnOrOff) {
      return Wrap(
        direction: _rowOrColumn ? Axis.horizontal : Axis.vertical,
        children: children,
      );
    }
    if (_rowOrColumn) {
      return Row(
        children: children,
      );
    }
    return Column(
      children: children,
    );
  }

  Widget _makeContainer({int index, Color color}) {
    return Container(
      width: 80 + Random().nextDouble() * 40.0,
      height: 80,
      color: color,
      child: Text('$index'),
    );
  }

  List<Widget> _actions() {
    return <Widget>[
      Switch(
        value: _wrapOnOrOff,
        onChanged: (bool value) {
          setState(() {
            _wrapOnOrOff = value;
            if (!value) {
              _rowOrColumn = !_rowOrColumn;
            }
          });
        },
      ),
    ];
  }
}
