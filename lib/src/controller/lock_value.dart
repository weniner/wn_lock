class LockValue {
  final List<int> offsets;

  static const empty = LockValue(offsets: []);

  const LockValue({
    required this.offsets,
  });

  LockValue copyWith({
    List<int>? result,
  }) {
    return LockValue(
      offsets: result ?? this.offsets,
    );
  }
}
