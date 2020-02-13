import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../week_entry.dart';

class DraggableExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(31, 'Draggable', (context) => DraggableExample());

  @override
  _DraggableExampleState createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  var _color = Colors.black;
  var _nextAmountDivisor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DraggableExample.weekEntry.name),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _draggable(Color.fromRGBO(255, 0, 0, 1.0)),
                _draggable(Color.fromRGBO(0, 255, 0, 1.0)),
                _draggable(Color.fromRGBO(0, 0, 255, 1.0)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: DragTarget<Color>(
                onAccept: (value) {
                  _color = mixInColor(_color, value, _nextAmountDivisor);
                  _nextAmountDivisor += 1.0;
                },
                builder: (context, candidates, rejects) {
                  if (candidates.isEmpty) {
                    return Container(
                      width: 300,
                      height: 300,
                      color: _color,
                    );
                  } else {
                    return DottedBorder(
                      color: Colors.black87,
                      dashPattern: [9, 5],
                      child: Container(
                        width: 300,
                        height: 300,
                        color: mixInColor(
                                _color, candidates.first, _nextAmountDivisor),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color mixInColor(Color colorMain, Color color, double amountDivisor) {
    return Color.fromARGB(
        255,
        (colorMain.red * (amountDivisor - 1) + color.red) ~/ amountDivisor,
        (colorMain.green * (amountDivisor - 1) + color.green) ~/ amountDivisor,
        (colorMain.blue * (amountDivisor - 1) + color.blue) ~/ amountDivisor);
  }

  Widget _draggable(Color color) {
    const growSize = 15.0;
    return Draggable<Color>(
      data: color,
      child: Container(
        height: 50,
        width: 50,
        decoration: new BoxDecoration(
          color: color,
          borderRadius: new BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      feedback: Container(
        height: 50 + growSize,
        width: 50 + growSize,
        transform: Matrix4.identity()..translate(-growSize / 2, -growSize / 2),
        decoration: new BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 1.0,
            )
          ],
          borderRadius: new BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      childWhenDragging: Container(
        height: 50,
        width: 50,
        decoration: new BoxDecoration(
          color: Colors.black12,
          borderRadius: new BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
