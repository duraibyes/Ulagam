enum CefrLevel {
  a1('A1', 'Beginner', 1),
  a2('A2', 'Elementary', 2),
  b1('B1', 'Intermediate', 3),
  b2('B2', 'Upper intermediate', 4),
  c1('C1', 'Advanced', 5);

  const CefrLevel(this.code, this.label, this.rank);

  final String code;
  final String label;
  final int rank;

  String get display => '$code · $label';

  static CefrLevel parse(String code) {
    return CefrLevel.values.firstWhere(
      (level) => level.code == code,
      orElse: () => CefrLevel.a2,
    );
  }

  bool allows(String wordLevel) => parse(wordLevel).rank <= rank;

  CefrLevel lower() {
    final index = CefrLevel.values.indexOf(this);
    if (index <= 0) return CefrLevel.a1;
    return CefrLevel.values[index - 1];
  }
}
