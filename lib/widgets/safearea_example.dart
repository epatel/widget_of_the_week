import 'package:flutter/material.dart';

class SafeAreaExample extends StatefulWidget {
  @override
  _SafeAreaExampleState createState() => _SafeAreaExampleState();
}

class _SafeAreaExampleState extends State<SafeAreaExample> {
  var _withSafeArea = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _actions(),
        title: Text('SafeArea'),
      ),
      body: _withSafeArea ? SafeArea(child: _listView()) : _listView(),
    );
  }

  Widget _listView() {
    return ListView(
      children: List.generate(40, (index) {
        return ListTile(
          title: Text(
            'This is ListTile #${index + 1}',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        );
      }).expand((item) {
        return [item, Divider()];
      }).toList(),
    );
  }

  List<Widget> _actions() {
    return <Widget>[
      Switch(
        value: _withSafeArea,
        onChanged: (bool value) {
          setState(() {
            _withSafeArea = value;
          });
        },
      ),
    ];
  }
}