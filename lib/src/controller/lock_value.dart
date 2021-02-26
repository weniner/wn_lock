import 'dart:ui';

class LockValue {
  final List<Offset> offsets;

  static LockValue empty = LockValue();

  LockValue copyWith(List<Offset> offsets) {
    return LockValue(offsets: offsets);
  }

  LockValue({this.offsets});
}
