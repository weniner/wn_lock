import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WNLockPainter extends CustomPainter {
  double _radius = 20.0;

  Paint painter;

  List<int> doList = [];

  List<Offset> circle = [];

  Offset localOffset;

  List<Offset> choiceCircle = [];

  bool isEnd;

  Listenable factor;

  WNLockPainter({
    this.doList,
    this.circle,
    this.localOffset,
    this.choiceCircle,
    this.isEnd,
    this.factor,
  }) : super(repaint: factor);

  @override
  void paint(Canvas canvas, Size size) {
    painter = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    drawCircle(canvas, size);
    canvas.save();
    canvas.translate(0, size.width / 2 + _radius);
    drawCircle(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.translate(0, size.width + _radius * 2);
    drawCircle(canvas, size);
    canvas.restore();

    if (choiceCircle.length != 0) {
      Path path = Path();
      path.moveTo(choiceCircle[0].dx, choiceCircle[0].dy);
      for (int i = 1; i < choiceCircle.length; i++) {
        path.lineTo(choiceCircle[i].dx, choiceCircle[i].dy);
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
}
