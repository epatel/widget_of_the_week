import 'package:flutter/material.dart';

import '../week_entry.dart';

class HeroExample extends StatefulWidget {
  static final weekEntry = WeekEntry(17, 'Hero', () => HeroExample());

  @override
  _HeroExampleState createState() => _HeroExampleState();
}

class _HeroExampleState extends State<HeroExample> {
  var _withOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _actions(),
        title: Text(HeroExample.weekEntry.name),
      ),
      body: _column(),
    );
  }

  Widget _column() {
    return Column(
      children: <Widget>[
        _container(Colors.red),
        _opacityContainer(Colors.yellow),
        _container(Colors.green),
        _opacityContainer(Colors.blue),
        _container(Colors.pink),
      ],
    );
  }

  Widget _container(Color color) {
    return Expanded(
      child: Container(
        color: color,
      ),
    );
  }

  Widget _opacityContainer(Color color) {
    return Expanded(
      child: Opacity(
        opacity: _withOpacity ? 0.0 : 1.0,
        child: Container(
          color: color,
        ),
      ),
    );
  }

  List<Widget> _actions() {
    return <Widget>[
      Switch(
        value: _withOpacity,
        onChanged: (bool value) {
          setState(() {
            _withOpacity = value;
          });
        },
      ),
    ];
  }
}
