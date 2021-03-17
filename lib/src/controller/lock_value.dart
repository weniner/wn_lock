class LockValue {
  final List<int> offsets;

  static const empty = LockValue(offsets: []);

  const LockValue({
    this.offsets,
  }) : assert(offsets != null);

  LockValue copyWith({
    List<int> result,
  }) {
    return LockValue(
      offsets: result ?? this.offsets,
    );
  }
}
