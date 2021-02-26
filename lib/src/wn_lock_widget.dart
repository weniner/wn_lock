library wn_lock;

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wn_lock/src/controller/lock_controller.dart';
import 'package:wn_lock/src/wn_lock_paint.dart';

class WNLockWidget extends StatefulWidget {
  /// 结果以String返回，
  final ValueChanged<String> onMoveEnd;
  final LockController lockController;

  const WNLockWidget({Key key, this.onMoveEnd, @required this.lockController})
      : assert(lockController == null, 'LockController can\'t be null'),
        super(key: key);

  @override
  _WNLockState createState() {
    return _WNLockState();
  }
}

class _WNLockState extends State<WNLockWidget> {
  Offset localOffset;
  List<int> _doList = [];
  List<Offset> _circle = [];
  List<Offset> _choiceCircle = [];

  /// 停止移动标识
  bool isEnd = false;

  /// 屏幕宽
  double _width;

  /// 屏幕高
  double _height;

  @override
  void initState() {
    super.initState();
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    if (_circle.length == 0) {
      double _radius = 20.0;
      for (int x = 0; x < 9; x++) {
        int i = x ~/ 3;
        int y = x % 3;
        _circle.add(Offset(_radius + ((_width - _radius * 2) / 2 * i), _radius + (_height - _radius * 2) / 2 * y));
      }
      print(_width);
      print(_circle);
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: (offset) {
        _choiceCircle.clear();
        isEnd = false;
        _doList.clear();
        localOffset = offset.localPosition;
        isInCircle(localOffset);
        setState(() {});
        print("-------------> onPanStart ${offset.localPosition}");
      },
      onPanEnd: (offset) {
        isEnd = true;
        setState(() {});
      },
      onPanUpdate: (offset) {
        isEnd = false;
        localOffset = offset.localPosition;

        isInCircle(localOffset);
        setState(() {});
        // print("-------------> onPanUpdate ${offset.localPosition}");
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.width),
          painter: WNLockPainter(
            doList: _doList,
            circle: _circle,
            localOffset: localOffset,
            choiceCircle: _choiceCircle,
            isEnd: isEnd,
          ),
        ),
      ),
    );
  }

  void isInCircle(Offset localOffset) {
    for (Offset offset in _circle) {
      double radius = sqrt(pow(localOffset.dx - offset.dx, 2) + pow(localOffset.dy - offset.dy, 2));
      if (radius < 20.0) {
        if (!_doList.contains(_circle.indexOf(offset))) {
          _doList.add(_circle.indexOf(offset));
          _choiceCircle.add(offset);
          print("list is ------------->  $_doList ");
          print("add is ------------->  $offset ");
        }
      }
    }
  }
}
