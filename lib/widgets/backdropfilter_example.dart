import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class BackdropFilterExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(24, 'BackdropFilter', () => BackdropFilterExample());

  @override
  _BackdropFilterExampleState createState() => _BackdropFilterExampleState();
}

class _BackdropFilterExampleState extends State<BackdropFilterExample> {
  bool _filter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: _actions(),
          title: Text(BackdropFilterExample.weekEntry.name),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(100),
              ),
              Stack(
                children: <Widget>[
                  Center(
                    child: FlutterLogo(
                      size: 200,
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        color: _filter ? Colors.transparent : null,
                      ),
                    ),
                  )
                ],
              ),
              FlatButton(
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
            ],
          ),
        ));
  }

  List<Widget> _actions() {
    return <Widget>[
      Switch(
        value: _filter,
        onChanged: (bool value) {
          setState(() {
            _filter = value;
          });
        },
      ),
    ];
  }
}
