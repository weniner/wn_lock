import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:wn_lock/src/base_lock.dart';
import 'package:wn_lock/src/model/square_attr.dart';

class Square implements Shape {
  @override
  void draw(Canvas canvas, Paint paint, List<Offset> centerPoints, Attr attr) {
    SquareAttr squareAttr = attr;
    double length = squareAttr.length;
    for (Offset offset in centerPoints) {
      canvas.drawRect(Rect.fromCenter(center: offset, width: length, height: length), paint);
    }
  }
}
