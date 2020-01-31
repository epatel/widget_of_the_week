import 'package:flutter/material.dart';

import '../week_entry.dart';

class AlignExample extends StatefulWidget {
  static final weekEntry = WeekEntry(25, 'Align', () => AlignExample());

  @override
  _AlignExampleState createState() => _AlignExampleState();
}

class _AlignExampleState extends State<AlignExample> {
  var _align = "topLeft";
  var _alignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AlignExample.weekEntry.name),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 100),
            child: Column(
              children: <Widget>[
                radioButton(
                    alignment: Alignment.topLeft,
                    name: "topLeft",),
                radioButton(
                    alignment: Alignment.topCenter,
                    name: "topCenter",),
                radioButton(
                    alignment: Alignment.topRight,
                    name: "topRight",),
                radioButton(
                    alignment: Alignment.centerLeft,
                    name: "centerLeft",),
                radioButton(
                    alignment: Alignment.center,
                    name: "center",),
                radioButton(
                    alignment: Alignment.centerRight,
                    name: "centerRight",),
                radioButton(
                    alignment: Alignment.bottomLeft,
                    name: "bottomLeft",),
                radioButton(
                    alignment: Alignment.bottomCenter,
                    name: "bottomCenter",),
                radioButton(
                    alignment: Alignment.bottomRight,
                    name: "bottomRight",),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.black12,
              child: Align(
                alignment: _alignment,
                child: Text('[TEXT]'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget radioButton({Alignment alignment, String name}) {
    return Row(children: <Widget>[
      Radio<String>(
        value: name,
        groupValue: _align,
        onChanged: (value) {
          if (name == value) {
            setState(() {
              _align = value;
              _alignment = alignment;
            });
          }
        },
      ),
      Text(name),
    ]);
  }
}
