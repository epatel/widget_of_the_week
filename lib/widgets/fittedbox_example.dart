import 'package:flutter/material.dart';

import '../week_entry.dart';

class FittedBoxExample extends StatefulWidget {
  static final weekEntry = WeekEntry(20, 'FittedBox', () => FittedBoxExample());

  @override
  _FittedBoxExampleState createState() => _FittedBoxExampleState();
}

class _FittedBoxExampleState extends State<FittedBoxExample> {
  var _withFittedBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _actions(),
        title: Text(FittedBoxExample.weekEntry.name),
      ),
      body: _column(),
    );
  }

  Widget _column() {
    return ListView(
      children: [
        _withFittedBox
            ? FittedBox(
                fit: BoxFit.fill,
                child: _image(),
              )
            : _image(),
      ],
    );
  }

  Widget _image() {
    return Image.asset('assets/fluttersweden.png');
  }

  List<Widget> _actions() {
    return <Widget>[
      Switch(
        value: _withFittedBox,
        onChanged: (bool value) {
          setState(() {
            _withFittedBox = value;
          });
        },
      ),
    ];
  }
}
