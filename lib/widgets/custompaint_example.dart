import 'package:flutter/material.dart';

import '../week_entry.dart';

class CustomPaintExample extends StatelessWidget {
  static final weekEntry =
      WeekEntry(18, 'CustomPaint', (context) => CustomPaintExample());

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
    const paddingToEdge = 60;
    final width = MediaQuery.of(context).size.width - paddingToEdge * 2;
    final size = Size(width, width);
    return Center(
      child: Container(
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(paddingToEdge / 2),
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

    // Make a blue background
    canvas.drawRect(
      Rect.fromLTRB(0, 0, size.height, size.width),
      paint,
    );

    // Here are some point
    var points = [
      Offset(0.0, 0.0),
      Offset(0.0, 0.5),
      Offset(0.5, 0.5),
      Offset(0.5, 1.0),
      Offset(1.0, 1.0),
      Offset(1.0, 0.5),
      Offset(0.75, 0.5),
      Offset(0.75, 0.0),
    ];

    final path = Path();
    path.addPolygon(points, true);
    final scaledPath = path.transform(
        Matrix4.identity().scaled(size.width, size.height, 1.0).storage);

    // Draw green border
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;
    canvas.drawPath(scaledPath, paint);

    // Draw red border
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;
    paint.strokeJoin = StrokeJoin.round;
    canvas.drawPath(scaledPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
