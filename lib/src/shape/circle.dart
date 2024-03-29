import 'dart:ui';

import 'package:wn_lock/src/base_lock.dart';
import 'package:wn_lock/src/model/circle_attr.dart';

class Circle extends Shape {
  @override
  void draw(Canvas canvas, Paint paint, List<Offset> centerPoints, Attr attr) {
    super.draw(canvas, paint, centerPoints, attr);
    revisePaint(paint, attr);
    CircleAttr circleAttr = attr as CircleAttr;
    double radius = circleAttr.radius;
    for (Offset offset in centerPoints) {
      canvas.drawCircle(offset, radius, paint);
    }
  }

  @override
  void revisePaint(Paint paint, Attr attr) {
    CircleAttr localAttr = attr as CircleAttr;
    paint.color = localAttr.color;
    paint.strokeWidth = localAttr.width;
  }
}
