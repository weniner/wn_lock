library wn_lock;

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wn_lock/src/base_lock.dart';
import 'package:wn_lock/src/controller/lock_controller.dart';
import 'package:wn_lock/src/wn_lock_paint.dart';

class WNLockWidget extends StatefulWidget {
  /// 移动结束 选取结果返回
  final ValueChanged<String> onPanEnd;

  /// 移动过程中 选取结果返回
  final ValueChanged<String> onPanUpdate;

  /// Lock句柄
  final LockController lockController;

  /// 横向列数
  final int row;

  /// 纵向列数
  final int column;

  /// 属性
  /// link [CircleAttr]、[SquareAttr]
  final Attr attr;

  /// 可触碰点占child比例
  final double touchInChildScale;

  /// 每个Child平分后占据的空间比例 以row数值作为平分点
  /// 平分空间后所占各空间比例
  // todo item 按照比例绘制
  // final double eachInParentScale;

  const WNLockWidget({
    Key key,
    @required this.lockController,
    this.onPanEnd,
    this.onPanUpdate,
    this.row = 3,
    this.column = 3,
    this.attr,
    this.touchInChildScale = 0.5,
    // this.eachInParentScale = 0.5,
  })  : assert(lockController == null, 'LockController can\'t be null'),
        assert(touchInChildScale > 0 && touchInChildScale <= 1, "touchInWidgetScale only approve (0,1]"),
        // assert(eachInParentScale > 0 && eachInParentScale <= 1, "eachInParentScale only approve (0,1]"),
        assert(row > 0 && row <= 9, "row only approve (0,9]"),
        assert(column > 0 && column <= 9, "column only approve (0,9]"),
        super(key: key);

  @override
  _WNLockState createState() {
    return _WNLockState();
  }
}

class _WNLockState extends State<WNLockWidget> {
  Offset localOffset;
  List<int> _choiceResult = [];
  List<Offset> _circle = [];

  /// 停止移动标识
  bool isEnd = false;

  /// 控件宽
  double _width;

  /// 控件高
  double _height;

  LockController _lockController;

  int _row;

  int _column;

  Attr _attr;

  @override
  void initState() {
    super.initState();
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _row = widget.row;
    _column = widget.column;
    _lockController = widget.lockController;
    _lockController.offsets = _circle;
    _attr = widget.attr ?? CircleAttr();
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
        isEnd = false;
        _choiceResult.clear();
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
            choiceResult: _choiceResult,
            circle: _circle,
            localOffset: localOffset,
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
        if (!_choiceResult.contains(_circle.indexOf(offset))) {
          _choiceResult.add(_circle.indexOf(offset));
          print("list is ------------->  $_choiceResult ");
          print("add is ------------->  $offset ");
        }
      }
    }
  }
}
