import 'dart:math';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class CustomPaintExample extends StatelessWidget {
  static final weekEntry =
      WeekEntry(18, 'CustomPaint', () => CustomPaintExample());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(CustomPaintExample.weekEntry.name),
        ),
        body: Builder(
          builder: (context) => _body(context),
        ));
  }

  Widget _body(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 100;
    final size = Size(width, width);
    return Center(
      child: Container(
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomPaint(
            painter: CustomPainterExample(),
            size: size,
          ),
        ),
      ),
    );
  }
}

class CustomPainterExample extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.blue;
    canvas.drawRect(
      Rect.fromLTRB(0, 0, size.height, size.width),
      paint,
    );
    paint.color = Colors.green;
    paint.strokeWidth = 10;
    canvas.drawLine(
        Offset.zero,
        Offset(
          size.width,
          size.height,
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
