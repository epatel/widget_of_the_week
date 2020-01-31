import 'package:flutter/material.dart';

import 'week_entry.dart';
import 'widgets/absorbpointer_example.dart';
import 'widgets/align_example.dart';
import 'widgets/animatedcontainer_example.dart';
import 'widgets/backdropfilter_example.dart';
import 'widgets/cliprrect_example.dart';
import 'widgets/custompaint_example.dart';
import 'widgets/expanded_example.dart';
import 'widgets/fadeinimage_example.dart';
import 'widgets/fadetransition_example.dart';
import 'widgets/fittedbox_example.dart';
import 'widgets/floatingactionbutton_example.dart';
import 'widgets/futurebuilder_example.dart';
import 'widgets/hero_example.dart';
import 'widgets/inheritedmodel_example.dart';
import 'widgets/layoutbuilder_example.dart';
import 'widgets/opacity_example.dart';
import 'widgets/pageview_example.dart';
import 'widgets/positioned_example.dart';
import 'widgets/safearea_example.dart';
import 'widgets/sliverappbar_example.dart';
import 'widgets/sliverlistandgrid_example.dart';
import 'widgets/streambuilder_example.dart';
import 'widgets/table_example.dart';
import 'widgets/tooltip_example.dart';
import 'widgets/transform_example.dart';
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
    StreamBuilderExample.weekEntry,
    InheritedModelExample.weekEntry,
    ClipRRectExample.weekEntry,
    HeroExample.weekEntry,
    CustomPaintExample.weekEntry,
    TooltipExample.weekEntry,
    FittedBoxExample.weekEntry,
    LayoutBuilderExample.weekEntry,
    AbsorbPointerExample.weekEntry,
    TransformExample.weekEntry,
    BackdropFilterExample.weekEntry,
    AlignExample.weekEntry,
    PositionedExample.weekEntry,
// 26. Positioned https://youtu.be/EgtPleVwxBQ
// 27. AnimatedBuilder https://youtu.be/N-RiyZlv8v8
// 28. Dismissible https://youtu.be/iEMgjrfuc58
// 29. SizedBox https://youtu.be/EHPu_DzRfqA
// 30. ValueListenableBuilder https://youtu.be/s-ZG-jS5QHQ
// 31. Draggable https://youtu.be/QzA4c4QHZCY
// 32. AnimatedList https://youtu.be/ZtfItHwFlZ8
// 33. Flexible https://youtu.be/CI7x0mAZiY0
// 34. MediaQuery https://youtu.be/A3WrA4zAaPw
// 35. Spacer https://youtu.be/7FJgd7QN1zI
// 36. InheritedWidget https://youtu.be/1t-8rBCGBYw
// 37. AnimatedIcon https://youtu.be/pJcbh8pbvJs
// 38. AspectRatio https://youtu.be/XcnP3_mO_Ms
// 39. LimitedBox https://youtu.be/uVki2CIzBTs
// 40. Placeholder https://youtu.be/LPe56fezmoo
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
