import 'dart:ui';

abstract class IAttr {
  String attrToString();
}

class Attr implements IAttr {
  @override
  String attrToString() {
    throw 'attrToString method must be implemented';
  }
}

class CircleAttr extends Attr {
  double radius;

  CircleAttr({
    this.radius,
  });

  @override
  String attrToString() {
    return '';
  }
}

class SquareAttr extends Attr {
  double length;

  SquareAttr(
    this.length,
  );

  @override
  String attrToString() {
    return '';
  }
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

  factory Shape(Attr attr) {
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
