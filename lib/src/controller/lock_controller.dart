import 'package:flutter/cupertino.dart';
import 'package:wn_lock/wn_lock.dart';

class LockController extends ValueNotifier<LockValue> {
  LockController({List<int> offsets}) : super(offsets == null ? LockValue.empty : LockValue(offsets: offsets));

  LockController.fromValue(LockValue value) : super(value ?? LockValue.empty);

  /// 如果你想要重置选取结果，调用此方法。
  void reset() {
    value = LockValue.empty;
  }

  set offsets(List<int> newOffsets) {
    value = value.copyWith(
      result: newOffsets,
    );
  }

  List<int> get offsets {
    return value.offsets;
  }

  void addOffsets(int newOffset) {
    List<int> tempList = List<int>.from(this.offsets);
    tempList.add(newOffset);
    value = value.copyWith(result: tempList);
  }

  @override
  set value(LockValue newValue) {
    assert(newValue != null, 'offset must not be null');
    super.value = newValue;
  }
}
