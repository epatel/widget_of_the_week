import 'dart:async';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class FutureBuilderExample extends StatelessWidget {
  static final weekEntry =
      WeekEntry(6, 'FutureBuilder', () => FutureBuilderExample());

  final _completer = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FutureBuilderExample.weekEntry.name),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: FlatButton(
              child: Text('Complete future'),
              color: Colors.green,
              onPressed: () {
                if (!_completer.isCompleted) {
                  _completer.complete('I am done!');
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          FutureBuilder(
            future: _completer.future,
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _myText('Waiting on Future!');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return _myText(snapshot.data);
              } else {
                return _myText('Catch all!');
              }
            },
          )
        ],
      ),
    );
  }

  Widget _myText(String text) => Text(
        text,
        style: TextStyle(fontSize: 22),
      );
}
