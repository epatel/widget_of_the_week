import 'package:flutter/material.dart';

import '../week_entry.dart';

class TooltipExample extends StatelessWidget {
  static final weekEntry = WeekEntry(19, 'Tooltip', () => TooltipExample());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TooltipExample.weekEntry.name),
      ),
      body: _column(),
    );
  }

  Widget _column() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Tooltip(
          message: 'This is the Flutter Sweden logo',
          child: Image.asset('assets/fluttersweden.png', width: 256),
        ),
        Tooltip(
          message: 'Yes I can submit now',
          child: Center(
            child: FlatButton(
              color: Colors.green,
              child: Text('Submit'),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
