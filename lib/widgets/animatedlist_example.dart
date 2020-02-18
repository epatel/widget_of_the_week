import 'dart:async';

import 'package:flutter/material.dart';

import '../week_entry.dart';

class AnimatedListExample extends StatefulWidget {
  static final weekEntry =
      WeekEntry(32, 'AnimatedList', (context) => AnimatedListExample());

  @override
  _AnimatedListExampleState createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  int _itemIndex = 8;
  List<String> _items;
  Timer _timer;
  GlobalKey<AnimatedListState> _animatedListKey;

  @override
  void initState() {
    super.initState();
    _animatedListKey = GlobalKey<AnimatedListState>();
    _items = List.generate(_itemIndex, (index) {
      return 'This is ListTile #${index + 1}';
    }).expand((item) {
      return [item, '--'];
    }).toList();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      // Remove last two items, the cell + the divider
      _animatedListKey.currentState.removeItem(_items.length - 1,
          (context, animation) {
        return Divider();
      });
      _items.removeLast();
      final title = _items.last;
      _animatedListKey.currentState.removeItem(
        _items.length - 1,
        (context, animation) {
          return SlideTransition(
            position:
                animation.drive(Tween(begin: Offset(1, 0), end: Offset(0, 0))),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
        duration: Duration(milliseconds: 100),
      );
      _items.removeLast();
      // Add new items first, a cell + a divider
      _itemIndex += 1;
      _items.insert(0, '--');
      _items.insert(0, 'This is ListTile #$_itemIndex');
      _animatedListKey.currentState
          .insertItem(0, duration: Duration(milliseconds: 100));
      _animatedListKey.currentState.insertItem(1);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AnimatedListExample.weekEntry.name),
      ),
      body: _listView(),
    );
  }

  Widget _listView() {
    return AnimatedList(
      key: _animatedListKey,
      initialItemCount: _items.length,
      itemBuilder: (context, index, animation) {
        if (_items[index] == '--') {
          return Divider();
        } else {
          return SlideTransition(
            position: animation.drive(Tween(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            )),
            child: ListTile(
              title: Text(
                _items[index],
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
