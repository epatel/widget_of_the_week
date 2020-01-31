import 'package:flutter/material.dart';

import '../week_entry.dart';

class PositionedExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(26, 'Positioned', () => PositionedExample());

  @override
  _PositionedExampleState createState() => _PositionedExampleState();
}

class _PositionedExampleState extends State<PositionedExample> {
  var _leftOrRight = "left";
  var _leftRightValue = 0.0;
  var _topOrBottom = "top";
  var _topBottomValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PositionedExample.weekEntry.name),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Column(
              children: <Widget>[
                radioButton(
                  value: _leftOrRight,
                  name: "left",
                  onSelected: () {
                    _leftOrRight = "left";
                  }
                ),
                radioButton(
                  value: _leftOrRight,
                  name: "right",
                  onSelected: () {
                    _leftOrRight = "right";
                  }
                ),
                Slider(
                  value: _leftRightValue,
                  onChanged: (value) {
                    setState(() {
                      _leftRightValue = value;
                    });
                  },
                  min: 0,
                  max: 200,
                ),
                radioButton(
                  value: _topOrBottom,
                  name: "top",
                  onSelected: () {
                    _topOrBottom = "top";
                  }
                ),
                radioButton(
                  value: _topOrBottom,
                  name: "bottom",
                  onSelected: () {
                    _topOrBottom = "bottom";
                  }
                ),
                Slider(
                  value: _topBottomValue,
                  onChanged: (value) {
                    setState(() {
                      _topBottomValue = value;
                    });
                  },
                  min: 0,
                  max: 200,
                ),
              ],
            ),
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.black12,
                ),
                Positioned(
                  left: _leftOrRight == "left" ? _leftRightValue : null,
                  right: _leftOrRight == "right" ? _leftRightValue : null,
                  top: _topOrBottom == "top" ? _topBottomValue : null,
                  bottom: _topOrBottom == "bottom" ? _topBottomValue : null,
                  child: Text(
                    '[TEXT]',
                    style: TextStyle(backgroundColor: Colors.yellow,),
                  ),
                ),
              ],
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
