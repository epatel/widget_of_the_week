import 'package:flutter/material.dart';

import '../week_entry.dart';

class SliverAppBarExample extends StatelessWidget {
  static final weekEntry =
      WeekEntry(11, 'SliverAppBar', () => SliverAppBarExample());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150.0,
              backgroundColor: Colors.red,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('I am a SliverAppBar',
                    style: TextStyle(color: Colors.black)),
                background: FlutterLogo(colors: Colors.yellow),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(30, (rowIndex) => _row(rowIndex)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(int rowIndex) {
    return Text(
      'Row $rowIndex',
      style: TextStyle(
        fontSize: 28,
      ),
    );
  }
}
