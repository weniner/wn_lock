import 'dart:ui';

import 'package:wn_lock/src/base_lock.dart';
import 'package:wn_lock/src/model/circle_attr.dart';

class Circle implements Shape {
  @override
  void draw(Canvas canvas, Paint paint, List<Offset> centerPoints, Attr attr) {
    revisePaint(paint, attr);
    CircleAttr circleAttr = attr;
    double radius = circleAttr.radius;
    for (Offset offset in centerPoints) {
      canvas.drawCircle(offset, radius, paint);
    }
  }

  @override
  void revisePaint(Paint paint, Attr attr) {
    CircleAttr localAttr = attr;
    if (localAttr.color != null) {
      paint.color = localAttr.color;
    }
    if (localAttr.width != null) {
      paint.strokeWidth = localAttr.width;
    }
  }
}
