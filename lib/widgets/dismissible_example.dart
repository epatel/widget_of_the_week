import 'package:flutter/material.dart';

import '../week_entry.dart';

class DismissibleExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(28, 'Dismissible', (context) => DismissibleExample());

  @override
  _DismissibleExampleState createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  var _checked = 0;
  var _canceled = 0;
  var _list = <String>[];

  @override
  void initState() {
    super.initState();
    _list = List.generate(20, (index) {
      return 'Hello $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[
      ListTile(
        title: Text('Checked: $_checked Canceled: $_canceled'),
      ),
    ]..addAll(_list.map((title) {
        return _dismissibleThing(title);
      }));
    return Scaffold(
      appBar: AppBar(
        title: Text(DismissibleExample.weekEntry.name),
      ),
      body: ListView(
        children: widgetList,
      ),
    );
  }

  Widget _dismissibleThing(String title) {
    return Dismissible(
      key: GlobalKey(),
      child: ListTile(
        title: Text(title),
      ),
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.startToEnd:
            setState(() {
              _list.remove(title);
              _checked += 1;
            });
            print('Check');
            break;
          case DismissDirection.endToStart:
            setState(() {
              _list.remove(title);
              _canceled += 1;
            });
            print('Cancel');
            break;
          case DismissDirection.up:
          case DismissDirection.down:
          default:
            print('Direction: $direction');
        }
      },
      background: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        color: Colors.green,
        child: Icon(Icons.check),
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(Icons.cancel),
      ),
    );
  }
}
