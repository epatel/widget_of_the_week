import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../week_entry.dart';

class ValueListenableBuilderExample extends StatefulWidget {
  static final weekEntry = WeekEntry(30, 'ValueListenableBuilder',
      (context) => ValueListenableBuilderExample());

  @override
  _ValueListenableBuilderExampleState createState() =>
      _ValueListenableBuilderExampleState();
}

class _ValueListenableBuilderExampleState
    extends State<ValueListenableBuilderExample> {
  var _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ValueListenableBuilderExample.weekEntry.name),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ValueListenableBuilder(
                valueListenable: _valueNotifier,
                builder: (context, value, child) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Value: $value',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }),
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
                _valueNotifier.value += 1;
              },
            ),
          ],
        ),
      ),
    );
  }
}
