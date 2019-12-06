import 'dart:async';

import 'package:flutter/material.dart';

import '../week_entry.dart';

/// ParentWidget that holds some Model data
class ParentWidget extends InheritedWidget {
  ParentWidget({this.name, Widget child}) : super(child: child);

  final String name;

  @override
  bool updateShouldNotify(ParentWidget oldWidget) {
    return name != oldWidget.name;
  }

  static ParentWidget of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(ParentWidget);
}

/// ChildWidget that accesses some Parent model data
class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(ParentWidget.of(context).name);
  }
}

/// The example
class InheritedModelExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(15, 'InheritedWidget', () => InheritedModelExample());

  @override
  _InheritedModelExampleState createState() => _InheritedModelExampleState();
}

class _InheritedModelExampleState extends State<InheritedModelExample> {
  final _pageController = PageController();

  int _index = 0;
  String _parentName = 'Parent Name (0)';

  Widget _pages; // Save childrens tree here, _pages are not recreated!
  Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (_) {
        setState(() {
          _index++;
          _parentName = 'Parent Name ($_index)';
        });
    });
    _pages = PageView(
      controller: _pageController,
      children: [
        _page(context, 'One'),
        _page(context, 'Two'),
        _page(context, 'Three'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(InheritedModelExample.weekEntry.name),
      ),
      body: ParentWidget(
        name: _parentName,
        child: _pages,
      ),
    );
  }

  Widget _page(BuildContext context, String text) {
    print('Create a page'); // Should only see 3 pages created. Children updated without a full update
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Text('Child Widget below is updated w/o being recreated.'),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        ChildWidget(),
      ],
    );
  }
}
