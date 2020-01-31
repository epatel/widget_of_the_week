import 'dart:async';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class StreamBuilderExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(14, 'StreamBuilder', (context) => StreamBuilderExample());

  @override
  _StreamBuilderExampleState createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  Completer _completer = Completer();

  Stream<int> _numberStream() async* {
    int number = 1;
    while (true) {
      await _completer.future;
      _completer = Completer();
      yield number++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StreamBuilderExample.weekEntry.name),
      ),
      body: StreamBuilder(
        stream: _numberStream(),
        initialData: 0,
        builder: (context, snapshot) {
          Widget label;
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              label = _myText('State: Active (${snapshot.data})');
              break;
            case ConnectionState.done:
              label = _myText('State: Done (${snapshot.data})');
              break;
            case ConnectionState.none:
              label = _myText('State: None');
              break;
            case ConnectionState.waiting:
              label = _myText('State: Waiting (${snapshot.data})');
              break;
            default:
              label = _myText('Case: default');
              break;
          }
          return Column(
            children: <Widget>[
              Center(
                child: FlatButton(
                  child: Text('Step stream'),
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
              label
            ],
          );
        },
      ),
    );
  }

  Widget _myText(String text) => Text(
        text,
        style: TextStyle(fontSize: 22),
      );
}
