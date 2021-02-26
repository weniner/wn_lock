import 'dart:ui';

/// 选中框绘制类型
enum ShapeType {
  /// 圆形
  CIRCLE,

  /// 正方形
  SQUARE,
}

abstract class IAttr {
  Canvas get canvas;

  Paint get paint;
}

class Attr implements IAttr {
  Canvas _canvas;
  Paint _paint;

  Attr(Canvas canvas, Paint paint) {
    _canvas = canvas;
    _paint = paint;
  }

  @override
  Canvas get canvas => this._canvas;

  @override
  Paint get paint => this._paint;
}

class CircleAttr extends Attr {
  double radius;
  Offset centerOffset;

  CircleAttr(Canvas canvas, Paint paint, this.radius, this.centerOffset) : super(canvas, paint);
}

class SquareAttr extends Attr {
  double length;
  Offset centerOffset;

  SquareAttr(Canvas canvas, Paint paint, this.length, this.centerOffset) : super(canvas, paint);
}

abstract class IShape {
  void draw(Attr attr);
}

class Shape implements IShape{
  void draw(Attr attr) {}

  factory Shape(ShapeType type) {
    assert(type != null, 'ShapeType can\'t be null');
    switch (type) {
      case ShapeType.CIRCLE:
        return Circle();
      case ShapeType.SQUARE:
        return Square();
      default:
        return Circle();
    }
  }
}

class Square implements Shape {
  @override
  void draw(Attr attr) {
    SquareAttr squareAttr = attr;
    double length = squareAttr.length;
  }
}

class Circle implements Shape {
  @override
  void draw(Attr attr) {
    CircleAttr circleAttr = attr;
    double radius = circleAttr.radius;
  }
}
