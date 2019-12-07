import 'package:flutter/material.dart';

import '../week_entry.dart';

class HeroExample extends StatelessWidget {
  static final weekEntry = WeekEntry(17, 'Hero', () => HeroExample());

  HeroExample({this.firstPage = true});

  final firstPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HeroExample.weekEntry.name),
      ),
      body: Container(
        color: firstPage ? Colors.blue : Colors.yellow,
        child: firstPage ? _firstPage(context) : _secondPage(context),
      ),
    );
  }

  Widget _firstPage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _text(),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          _image(),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          FlatButton(
            color: Colors.green,
            child: Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HeroExample(
                          firstPage: false,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _secondPage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image(width: 200),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          _text(),
          Padding(
            padding: EdgeInsets.only(top: 200),
          ),
        ],
      ),
    );
  }

  Widget _text() {
    return Hero(
      tag: 'text-tag',
      child: Text(
        'Look, I am a Hero!',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _image({double width = 400}) {
    return Hero(
      tag: 'image-tag',
      child: Image.asset(
        'assets/fluttersweden.png',
        width: width,
      ),
    );
  }
}
