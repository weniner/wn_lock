import 'dart:ui';

import 'package:flutter/cupertino.dart';

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

class CircleAttr extends Attr {
  double radius;

  CircleAttr({
    @required this.radius,
  }) : super(length: radius * 2);
}

class SquareAttr extends Attr {
  double length;

  SquareAttr({
    @required this.length,
  }) : super(length: length);
}

abstract class IShape {
  void draw(
    Canvas canvas,
    Paint paint,
    Offset centerPoint,
    Attr attr,
  );
}

class Shape implements IShape {
  void draw(Canvas canvas, Paint paint, Offset centerPoint, Attr attr) {}

  factory Shape.fromAttr(Attr attr) {
    if (attr is CircleAttr) {
      return Circle();
    } else if (attr is SquareAttr) {
      return Square();
    }
    throw UnimplementedError("Attr method not implemented,"
        " you can use CircleAttr() or other to replace it");
  }
}

class Square implements Shape {
  @override
  void draw(Canvas canvas, Paint paint, Offset centerPoint, Attr attr) {
    SquareAttr squareAttr = attr;
    double length = squareAttr.length;
  }
}

class Circle implements Shape {
  @override
  void draw(Canvas canvas, Paint paint, Offset centerPoint, Attr attr) {
    CircleAttr circleAttr = attr;
    double radius = circleAttr.radius;
  }
}
