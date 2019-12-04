import 'package:flutter/material.dart';

import 'widgets/animatedcontainer_example.dart';
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

class Entry {
  Entry(this.index, this.name, this.prototype);
  final int index;
  final String name;
  final Function() prototype;
}

class WidgetSelection extends StatelessWidget {
  WidgetSelection({Key key, this.title}) : super(key: key);

  final String title;

  final _weeks = <Entry>[
    Entry(1, 'SafeArea', () => SafeAreaExample()),
    Entry(2, 'Expanded', () => ExpandedExample()),
    Entry(3, 'Wrap', () => WrapExample()),
    Entry(4, 'AnimatedContainer', () => AnimatedContainerExample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: _weeks
            .map((entry) {
              return ListTile(
                title: Text(
                  entry.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Week #${entry.index}'),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  _navigate(context, toContent: entry.prototype());
                },
              );
            })
            .expand((item) => [item, Divider()])
            .toList(),
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
