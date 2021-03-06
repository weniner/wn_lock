import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wn_lock/src/base_lock.dart';

class WNLockPainter extends CustomPainter {
  Paint shapePaint;

  Paint linePaint;

  List<int> choiceResult = [];

  List<Offset> centerPoints = [];

  Offset localOffset;

  bool isEnd;

  Attr attr;

  WNLockPainter({
    this.choiceResult,
    this.centerPoints,
    this.localOffset,
    this.isEnd,
    this.attr,
  });

  @override
  void paint(Canvas canvas, Size size) {
    initLinePainter();
    initShapePainter();
    Shape.fromAttr(attr).draw(canvas, shapePaint, centerPoints, attr);
    if (choiceResult.length != 0) {
      Path path = Path();
      int first = choiceResult[0];
      path.moveTo(centerPoints[first].dx, centerPoints[first].dy);
      for (int i = 1; i < choiceResult.length; i++) {
        path.lineTo(centerPoints[choiceResult[i]].dx, centerPoints[choiceResult[i]].dy);
      }
      if (!isEnd) {
        path.lineTo(localOffset.dx, localOffset.dy);
      }
      canvas.drawPath(path, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void initShapePainter() {
    shapePaint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
  }

  void initLinePainter() {
    linePaint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
  }
}
