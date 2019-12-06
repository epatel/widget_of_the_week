import 'package:flutter/material.dart';

import 'week_entry.dart';
import 'widgets/animatedcontainer_example.dart';
import 'widgets/expanded_example.dart';
import 'widgets/fadeinimage_example.dart';
import 'widgets/fadetransition_example.dart';
import 'widgets/floatingactionbutton_example.dart';
import 'widgets/futurebuilder_example.dart';
import 'widgets/opacity_example.dart';
import 'widgets/pageview_example.dart';
import 'widgets/safearea_example.dart';
import 'widgets/sliverappbar_example.dart';
import 'widgets/sliverlistandgrid_example.dart';
import 'widgets/table_example.dart';
import 'widgets/wrap_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget of the Week',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetSelection(title: 'Widget of the Week'),
    );
  }
}

class WidgetSelection extends StatelessWidget {
  WidgetSelection({Key key, this.title}) : super(key: key);

  final String title;

  final _weeks = <WeekEntry>[
    SafeAreaExample.weekEntry,
    ExpandedExample.weekEntry,
    WrapExample.weekEntry,
    AnimatedContainerExample.weekEntry,
    OpacityExample.weekEntry,
    FutureBuilderExample.weekEntry,
    FadeTransitionExample.weekEntry,
    FloatingActionButtonExample.weekEntry,
    PageViewExample.weekEntry,
    TableExample.weekEntry,
    SliverAppBarExample.weekEntry,
    SliverListAndGridExample.weekEntry,
    FadeInImageExample.weekEntry,
  ];

  @override
  Widget build(BuildContext context) {
    _weeks.sort((a, b) => a.week.compareTo(b.week));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: _weeks
            .map((entry) => _makeListTile(context, entry))
            .expand((item) => [item, Divider()])
            .toList(),
      ),
    );
  }

  Widget _makeListTile(BuildContext context, WeekEntry entry) {
    return ListTile(
      title: Text(
        entry.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Week #${entry.week}'),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        _navigate(context, toContent: entry.create());
      },
    );
  }

  void _navigate(BuildContext context, {Widget toContent}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => toContent),
    );
  }
}
