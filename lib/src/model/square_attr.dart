import 'package:flutter/material.dart';
import 'package:wn_lock/src/base_lock.dart';

class SquareAttr extends Attr {
  /// 边长
  double length;

  /// 绘制线条的颜色
  Color color;

  /// 绘制边的宽度
  double width;

  SquareAttr({
    required this.length,
    this.color = Colors.black,
    this.width = 2.0,
  })  : assert(width < length / 2,
            ' width is request smaller than half of length'),
        super(length: length);
}
