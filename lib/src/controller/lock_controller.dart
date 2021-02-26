import 'package:flutter/cupertino.dart';
import 'package:wn_lock/wn_lock.dart';

class LockController extends ValueNotifier<LockValue> {
  LockController({List<Offset> offsets}) : super(offsets == null ? LockValue.empty : LockValue(offsets: offsets));

  LockController.fromValue(LockValue value) : super(value ?? LockValue.empty);

  set offsets(List<Offset> newOffsets) {
    value = value.copyWith(newOffsets);
  }

  @override
  set value(LockValue newValue) {
    super.value = newValue;
  }
}
