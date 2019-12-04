import 'package:flutter/material.dart';

import 'widgets/expanded_example.dart';
import 'widgets/safearea_example.dart';
import 'widgets/wrap_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Of The Week',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetSelection(title: 'Widget Of The Week'),
    );
  }
}

class WidgetSelection extends StatelessWidget {
  WidgetSelection({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('SafeArea'),
            subtitle: Text('Week #1'),
            onTap: () {
              _navigate(context, toContent: SafeAreaExample());
            },
          ),
          Divider(),
          ListTile(
            title: Text('Expanded'),
            subtitle: Text('Week #2'),
            onTap: () {
              _navigate(context, toContent: ExpandedExample());
            },
          ),
          Divider(),
          ListTile(
            title: Text('Wrap'),
            subtitle: Text('Week #3'),
            onTap: () {
              _navigate(context, toContent: WrapExample());
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  void _navigate(BuildContext context, {Widget toContent}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => toContent),
    );
  }
}
