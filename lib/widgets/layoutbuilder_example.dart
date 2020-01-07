import 'package:flutter/material.dart';

import '../week_entry.dart';

class LayoutBuilderExample extends StatelessWidget {
  static final weekEntry =
      WeekEntry(21, 'LayoutBuilder', () => LayoutBuilderExample());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LayoutBuilderExample.weekEntry.name),
      ),
      body: _builder(),
    );
  }

  Widget _builder() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        const int rows = 3;
        const int columns = 4;
        final cellWidth = boxConstraints.maxWidth / columns;
        final cellHeight = cellWidth;
        return ListView(
          children: <Widget>[
            _row('Max width: ${boxConstraints.maxWidth}'),
            _row('Max height: ${boxConstraints.maxHeight}'),
            _row('Cell width: $cellWidth'),
            _row('Cell height: $cellHeight'),
            _table(columns, rows, cellWidth, cellHeight),
          ],
        );
      },
    );
  }

  Widget _row(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _table(int columns, int rows, double cellWidth, double cellHeight) {
    return Table(
      children: List.generate(rows, (rowIndex) {
        return TableRow(
          children: List.generate(columns, (columnIndex) {
            return Container(
              margin: EdgeInsets.all(1),
              width: cellWidth,
              height: cellHeight,
              color: Colors.red,
            );
          }),
        );
      }),
    );
  }
}
