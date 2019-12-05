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
      body: Table(
        children: List.generate(10, (rowIndex) => _row(rowIndex)),
      ),
    );
  }

  TableRow _row(int rowIndex) {
    return TableRow(
      children: List.generate(4, (columnIndex) => _cell(columnIndex, rowIndex)),
    );
  }

  Widget _cell(int columnIndex, int rowIndex) {
    return Container(
      width: 50,
      height: 50,
      color: (columnIndex + rowIndex) % 2 == 1 ? Colors.red : Colors.black,
    );
  }
}
