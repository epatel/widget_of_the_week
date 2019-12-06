import 'dart:math';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class ClipRRectExample extends StatefulWidget {
  static final weekEntry = WeekEntry(16, 'ClipRRect', () => ClipRRectExample());

  @override
  _ClipRRectExampleState createState() => _ClipRRectExampleState();
}

class _ClipRRectExampleState extends State<ClipRRectExample> {
  bool _withClipRRect = false;
  bool _withClipOval = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ClipRRectExample.weekEntry.name),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('With ClipRRect:'),
              Switch(
                value: _withClipRRect,
                onChanged: (value) {
                  setState(() {
                    _withClipRRect = !_withClipRRect;
                  });
                },
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('ClipRRect/ClipOval:'),
              Switch(
                value: _withClipOval,
                onChanged: (value) {
                  setState(() {
                    _withClipOval = !_withClipOval;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Center(
          child: _withClipRRect
              ? (_withClipOval
                  ? ClipOval(
                      child: _image(),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: _image(),
                    ))
              : _image(),
        ),
      ],
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/fluttersweden.png',
      width: 200,
    );
  }
}
