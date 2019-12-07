import 'package:flutter/material.dart';

import '../week_entry.dart';

class TableExample extends StatelessWidget {
  static final weekEntry = WeekEntry(10, 'Table', () => TableExample());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weekEntry.name),
      ),
      body: Builder(
        builder: (context) {
          return Table(
            children: List.generate(10, (rowIndex) => _row(context, rowIndex)),
          );
        },
      ),
    );
  }

  TableRow _row(BuildContext context, int rowIndex) {
    return TableRow(
      children: List.generate(
          4, (columnIndex) => _cell(context, columnIndex, rowIndex)),
    );
  }

  Widget _cell(BuildContext context, int columnIndex, int rowIndex) {
    final aspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height -
            Scaffold.of(context).appBarMaxHeight);
    return AspectRatio(
      aspectRatio: aspectRatio / (4 / 10),
      child: Container(
        color: (columnIndex + rowIndex) % 2 == 1 ? Colors.red : Colors.black,
      ),
    );
  }
}
