import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:wn_lock/src/model/circle_attr.dart';
import 'package:wn_lock/src/model/square_attr.dart';
import 'package:wn_lock/src/shape/circle.dart';
import 'package:wn_lock/src/shape/heart.dart';
import 'package:wn_lock/src/shape/square.dart';

import 'model/heart_attr.dart';

abstract class IAttr {
  double getLength();
}

class Attr implements IAttr {
  double length;

  Attr({this.length});

  @override
  double getLength() {
    return length;
  }
}

abstract class IShape {
  void draw(
    Canvas canvas,
    Paint paint,
    List<Offset> centerPoints,
    Attr attr,
  );

  void revisePaint(Paint paint, Attr attr);
}

class Shape implements IShape {
  @override
  @mustCallSuper
  void draw(Canvas canvas, Paint paint, List<Offset> centerPoints, Attr attr) {
    revisePaint(paint, attr);
  }

  @override
  void revisePaint(Paint paint, Attr attr) {}

  Shape fromAttr(Attr attr) {
    if (attr is CircleAttr) {
      return Circle();
    } else if (attr is SquareAttr) {
      return Square();
    } else if (attr is HeartAttr) {
      return Heart();
    }
    throw UnimplementedError("Attr method not implemented,"
        " you can use CircleAttr() or other to replace it");
  }
}
