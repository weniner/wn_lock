import 'package:flutter/material.dart';
import 'package:wn_lock/src/base_lock.dart';

class HeartAttr extends Attr {
  // /// 爱心中间到上尖部距离
  // double topVerticalLength;
  //
  // /// 爱心中间到上尖部距离
  // double bottomVerticalLength;
  //
  // /// 爱心中间到上尖部距离
  // double centerHorizontalLength;

  /// 绘制线条的颜色
  Color color;

  /// 绘制边的宽度
  double width;

  HeartAttr({
    // this.topVerticalLength = 5,
    // this.bottomVerticalLength = 20,
    // this.centerHorizontalLength = 40,
    this.color = Colors.black,
    this.width = 2.0,
  }) : super(length: 20);
// assert(topVerticalLength > 0, ' topVerticalLength must bigger than zero'),
// assert(bottomVerticalLength > 0, ' bottomVerticalLength must bigger than zeroh'),
// assert(centerHorizontalLength > 0, ' centerHorizontalLength must bigger than zero'),
// super(length: topVerticalLength + bottomVerticalLength);
}
