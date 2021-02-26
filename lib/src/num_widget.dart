library wn_lock;

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wn_lock/src/lock_controller.dart';

class NumWidget extends StatefulWidget {
  /// 结果以String返回，
  final ValueChanged<String> onMoveEnd;
  final LockController lockController;

  const NumWidget({Key key, this.onMoveEnd, @required this.lockController})
      : assert(lockController == null, 'LockController can\'t be null'),
        super(key: key);

  @override
  _NumState createState() {
    return _NumState();
  }
}

class _NumState extends State<NumWidget> {
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
      // onLongPressMoveUpdate: (offset) {
      //   print("-------------> ${offset.localPosition}");
      // },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.width),
          painter: NumSecret(_doList, _circle, localOffset, _choiceCircle, isEnd),
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

class NumSecret extends CustomPainter {
  double _radius = 20.0;

  Paint painter;

  List<int> _doList = [];

  List<Offset> _circle = [];

  Offset _localOffset;

  List<Offset> _choiceCircle = [];

  bool _isEnd;

  NumSecret(List<int> doList, List<Offset> circle, Offset localOffset, List<Offset> choiceCircle, bool isEnd) {
    _doList = doList;
    _circle = circle;
    _localOffset = localOffset;
    _choiceCircle = choiceCircle;
    _isEnd = isEnd;
  }

  @override
  void paint(Canvas canvas, Size size) {
    painter = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    drawCircle(canvas, size);
    canvas.save();
    canvas.translate(0, size.width / 2 + _radius);
    drawCircle(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.translate(0, size.width + _radius * 2);
    drawCircle(canvas, size);
    canvas.restore();

    if (_choiceCircle.length != 0) {
      Path path = Path();
      path.moveTo(_choiceCircle[0].dx, _choiceCircle[0].dy);
      for (int i = 1; i < _choiceCircle.length; i++) {
        path.lineTo(_choiceCircle[i].dx, _choiceCircle[i].dy);
      }
      if (!_isEnd) {
        path.lineTo(_localOffset.dx, _localOffset.dy);
      }
      canvas.drawPath(path, painter);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawCircle(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(_radius, _radius), _radius, painter);
    canvas.drawCircle(Offset(size.width / 2, _radius), _radius, painter);
    canvas.drawCircle(Offset(size.width - _radius, _radius), _radius, painter);
  }
}
