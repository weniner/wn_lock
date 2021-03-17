import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:wn_lock/src/base_lock.dart';
import 'package:wn_lock/src/model/square_attr.dart';

class Square extends Shape {
  @override
  void draw(Canvas canvas, Paint paint, List<Offset> centerPoints, Attr attr) {
    super.draw(canvas, paint, centerPoints, attr);
    revisePaint(paint, attr);
    SquareAttr squareAttr = attr;
    double length = squareAttr.length;
    for (Offset offset in centerPoints) {
      canvas.drawRect(Rect.fromCenter(center: offset, width: length, height: length), paint);
    }
  }

  @override
  void revisePaint(Paint paint, Attr attr) {
    SquareAttr localAttr = attr;
    if (localAttr.color != null) {
      paint.color = localAttr.color;
    }
    if (localAttr.width != null) {
      paint.strokeWidth = localAttr.width;
    }
  }
}
