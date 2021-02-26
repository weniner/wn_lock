import 'package:flutter/cupertino.dart';

import 'lock_value.dart';

class LockController extends ValueNotifier<LockValue> {
  LockController({List<Offset> offsets}) : super(offsets == null ? LockValue.empty : LockValue(offsets: offsets));

  set offsets(List<Offset> newOffsets) {
    value = value.copyWith(newOffsets);
  }

  @override
  set value(LockValue newValue) {
    super.value = newValue;
  }
}
