import 'package:flutter/material.dart';

import '../week_entry.dart';

/// CustomClipPath for the example
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path(); // Top left
    path.lineTo(size.width / 2, size.height); // Down center
    path.lineTo(size.width, 0); // Top right
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// The example
class ClipRRectExample extends StatefulWidget {
  static final weekEntry = WeekEntry(16, 'ClipRRect', (context) => ClipRRectExample());

  @override
  _ClipRRectExampleState createState() => _ClipRRectExampleState();
}

class _ClipRRectExampleState extends State<ClipRRectExample> {
  bool _withClipRRect = false;
  bool _withClipOval = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ClipRRectExample.weekEntry.name),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('With ClipRRect:'),
              Switch(
                value: _withClipRRect,
                onChanged: (value) {
                  setState(() {
                    _withClipRRect = !_withClipRRect;
                  });
                },
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('ClipRRect/ClipPath:'),
              Switch(
                value: _withClipOval,
                onChanged: (value) {
                  setState(() {
                    _withClipOval = !_withClipOval;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Center(
          child: _withClipRRect
              ? (_withClipOval
                  ? ClipPath(
                      clipper: CustomClipPath(),
                      child: _image(),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: _image(),
                    ))
              : _image(),
        ),
      ],
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/fluttersweden.png',
      width: 200,
    );
  }
}
