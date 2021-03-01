import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WNLockPainter extends CustomPainter {
  double _radius = 20.0;

  Paint painter;

  List<int> choiceResult = [];

  List<Offset> centerPoint = [];

  Offset localOffset;

  bool isEnd;

  WNLockPainter({
    this.choiceResult,
    this.centerPoint,
    this.localOffset,
    this.isEnd,
  });

  @override
  void paint(Canvas canvas, Size size) {
    initPainter();
    drawCircle(canvas, size);
    canvas.save();
    canvas.translate(0, size.width / 2 + _radius);
    drawCircle(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.translate(0, size.width + _radius * 2);
    drawCircle(canvas, size);
    canvas.restore();

    if (choiceResult.length != 0) {
      Path path = Path();
      int first = choiceResult[0];
      path.moveTo(centerPoint[first].dx, centerPoint[first].dy);
      for (int i = 1; i < choiceResult.length; i++) {
        path.lineTo(centerPoint[choiceResult[i]].dx, centerPoint[choiceResult[i]].dy);
      }
      if (!isEnd) {
        path.lineTo(localOffset.dx, localOffset.dy);
      }
      canvas.drawPath(path, painter);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawCircle(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(_radius, _radius), _radius, painter);
    canvas.drawCircle(Offset(size.width / 2, _radius), _radius, painter);
    canvas.drawCircle(Offset(size.width - _radius, _radius), _radius, painter);
  }

  void initPainter() {
    painter = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
  }
}
