import 'dart:ui';

import 'package:wn_lock/src/base_lock.dart';
import 'package:wn_lock/src/model/heart_attr.dart';

class Heart extends Shape {
  @override
  void draw(Canvas canvas, Paint paint, List<Offset> centerPoints, Attr attr) {
    super.draw(canvas, paint, centerPoints, attr);
    for (Offset offset in centerPoints) {
      final path = Path();
      path.moveTo(offset.dx, offset.dy);
      path.cubicTo(offset.dx - 5, offset.dy - 25, offset.dx - 25, offset.dy - 5, offset.dx - 20, offset.dy);
      canvas.drawPath(path, paint);
      path.reset();
      path.moveTo(offset.dx - 20, offset.dy);
      path.cubicTo(offset.dx - 18, offset.dy + 10, offset.dx - 7, offset.dy + 5, offset.dx, offset.dy + 20);
      canvas.drawPath(path, paint);
      path.reset();
      path.moveTo(offset.dx, offset.dy);
      path.cubicTo(offset.dx + 5, offset.dy - 25, offset.dx + 25, offset.dy - 5, offset.dx + 20, offset.dy);
      canvas.drawPath(path, paint);
      path.reset();
      path.moveTo(offset.dx + 20, offset.dy);
      path.cubicTo(offset.dx + 18, offset.dy + 10, offset.dx + 7, offset.dy + 5, offset.dx, offset.dy + 20);
      canvas.drawPath(path, paint);
    }
  }

  @override
  void revisePaint(Paint paint, Attr attr) {
    HeartAttr localAttr = attr;
    if (localAttr.color != null) {
      paint.color = localAttr.color;
    }
    if (localAttr.width != null) {
      paint.strokeWidth = localAttr.width;
    }
  }
}
