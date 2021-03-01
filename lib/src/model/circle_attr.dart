import 'package:flutter/material.dart';
import 'package:wn_lock/src/base_lock.dart';

class CircleAttr extends Attr {
  double radius;

  Color color;

  double width;

  CircleAttr({
    @required this.radius,
    this.color,
    this.width,
  })  : assert(width < radius, 'width is request smaller than radius'),
        super(length: radius * 2);
}
