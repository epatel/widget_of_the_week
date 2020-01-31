import 'package:flutter/material.dart';

import '../week_entry.dart';

class AbsorbPointerExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(22, 'AbsorbPointer', (context) => AbsorbPointerExample());

  @override
  _AbsorbPointerExampleState createState() => _AbsorbPointerExampleState();
}

class _AbsorbPointerExampleState extends State<AbsorbPointerExample> {
  bool _absorb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _actions(),
        title: Text(AbsorbPointerExample.weekEntry.name),
      ),
      body: AbsorbPointer(
        absorbing: _absorb,
        child: Center(
          child: FlatButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blueAccent,),
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
        ),
      ),
    );
  }

  List<Widget> _actions() {
    return <Widget>[
      Switch(
        value: _absorb,
        onChanged: (bool value) {
          setState(() {
            _absorb = value;
          });
        },
      ),
    ];
  }
}
