import 'package:flutter/material.dart';

import '../week_entry.dart';

class PageViewExample extends StatelessWidget {
  static final weekEntry = WeekEntry(9, 'PageView', () => PageViewExample());

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weekEntry.name),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          _page('One'),
          _page('Two'),
          _page('Three'),
          _page('Four'),
        ],
      ),
    );
  }

  Widget _page(String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Text('Swipe to next page'),
      ],
    );
  }
}
