import 'package:flutter/material.dart';

import '../week_entry.dart';

class ExpandedExample extends StatefulWidget {
  static final weekEntry = WeekEntry(2, 'Expanded', () => ExpandedExample());

  @override
  _ExpandedExampleState createState() => _ExpandedExampleState();
}

class _ExpandedExampleState extends State<ExpandedExample> {
  var _expandedOrNot = List.generate(8, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _makeContainerOrExpanded(
              index: 0,
              color: Colors.amberAccent,
            ),
            _makeContainerOrExpanded(
              index: 1,
              color: Colors.lightBlueAccent,
            ),
            _makeContainerOrExpanded(
              index: 2,
              color: Colors.amberAccent,
            ),
            _makeContainerOrExpanded(
              index: 3,
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
        _makeContainerOrExpanded(
          index: 4,
          color: Colors.amberAccent,
        ),
        _makeContainerOrExpanded(
          index: 5,
          color: Colors.lightBlueAccent,
        ),
        _makeContainerOrExpanded(
          index: 6,
          color: Colors.amberAccent,
        ),
        _makeContainerOrExpanded(
          index: 7,
          color: Colors.lightBlueAccent,
        ),
      ],
    );
  }

  Widget _makeSwitchFor({int index}) {
    return Center(
      child: Switch(
        value: _expandedOrNot[index],
        onChanged: (value) {
          setState(() {
            _expandedOrNot[index] = value;
          });
        },
      ),
    );
  }

  Widget _makeContainerOrExpanded({int index, Color color}) {
    if (_expandedOrNot[index]) {
      return Expanded(
        child: Container(
          width: 80,
          height: 80,
          color: color,
          child: _makeSwitchFor(index: index),
        ),
      );
    }
    return Container(
      width: 80,
      height: 80,
      color: color,
      child: _makeSwitchFor(index: index),
    );
  }
}
