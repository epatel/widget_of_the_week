import 'package:flutter/widgets.dart';

class WeekEntry {
  WeekEntry(this.week, this.name, this.create);

  final int week;
  final String name;
  final Widget Function(BuildContext) create;
}
