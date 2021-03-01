import 'package:flutter/material.dart';
import 'package:wn_lock/src/base_lock.dart';

class CircleAttr extends Attr {
  double radius;

  CircleAttr({
    @required this.radius,
  }) : super(length: radius * 2);
}
