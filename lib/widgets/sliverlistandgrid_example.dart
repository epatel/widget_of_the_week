import 'package:flutter/material.dart';

import '../week_entry.dart';

class SliverListAndGridExample extends StatelessWidget {
  static final weekEntry =
      WeekEntry(12, 'SliverList & SliverGrid', () => SliverListAndGridExample());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(10, (rowIndex) => _row(rowIndex)),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              children: List.generate(15, (rowIndex) => _cell(rowIndex)),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(10, (rowIndex) => _row(rowIndex + 10)),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
          mini: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      ),
    );
  }

  Widget _row(int rowIndex) {
    return Container(
      color: rowIndex % 2 == 1 ? Colors.red : Colors.yellow,
      child: Center(
        child: Text(
          'Row $rowIndex',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }

  Widget _cell(int cellIndex) {
    return Container(
      color: cellIndex % 2 == 1 ? Colors.red : Colors.yellow,
      child: Center(
        child: Text(
          'Cell $cellIndex',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
