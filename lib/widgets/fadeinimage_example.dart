import 'dart:math';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class FadeInImageExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(13, 'FadeInImage', () => FadeInImageExample());

  @override
  _FadeInImageExampleState createState() => _FadeInImageExampleState();
}

class _FadeInImageExampleState extends State<FadeInImageExample> {
  bool started = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FadeInImageExample.weekEntry.name),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    int cacheKiller = Random().nextInt(32767);
    return Column(
      children: <Widget>[
        Center(
          child: FlatButton(
            color: started ? Colors.black12 : Colors.green,
            child: Text(
              'Start',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: started
                ? () {}
                : () {
                    setState(() {
                      started = true;
                    });
                  },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Center(
          child: started
              ? FadeInImage.assetNetwork(
                  width: 200,
                  fadeOutDuration: Duration(seconds: 1),
                  fadeInDuration: Duration(seconds: 1),
                  placeholder: 'assets/fluttersweden.png',
                  image:
                      'http://www.randomkittengenerator.com/cats/rotator.php?$cacheKiller',
                )
              : Image.asset(
                  'assets/fluttersweden.png',
                  width: 200,
                ),
        ),
      ],
    );
  }
}
