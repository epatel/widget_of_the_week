import 'package:flutter/material.dart';

import '../week_entry.dart';

class SizedBoxExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(29, 'SizedBox', (context) => SizedBoxExample());

  @override
  _SizedBoxExampleState createState() => _SizedBoxExampleState();
}

class _SizedBoxExampleState extends State<SizedBoxExample> {
  var _widthValue = 0.0;
  var _heightValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SizedBoxExample.weekEntry.name),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Column(
              children: <Widget>[
                Slider(
                  value: _widthValue,
                  onChanged: (value) {
                    setState(() {
                      _widthValue = value;
                    });
                  },
                  min: 0,
                  max: 200,
                ),
                Slider(
                  value: _heightValue,
                  onChanged: (value) {
                    setState(() {
                      _heightValue = value;
                    });
                  },
                  min: 0,
                  max: 200,
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: _widthValue,
              height: _heightValue,
              child: Container(
                color: Colors.blue,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ',
                  style: TextStyle(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget radioButton({String value, String name, void Function() onSelected}) {
    return Row(children: <Widget>[
      Radio<String>(
        value: name,
        groupValue: value,
        onChanged: (value) {
          if (name == value) {
            setState(() {
              onSelected();
            });
          }
        },
      ),
      Text(name),
    ]);
  }
}
