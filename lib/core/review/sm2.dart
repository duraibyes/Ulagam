class Sm2State {
  const Sm2State({
    required this.ease,
    required this.intervalDays,
    required this.repetitions,
    required this.lapses,
  });

  final double ease;
  final int intervalDays;
  final int repetitions;
  final int lapses;

  static const initial = Sm2State(
    ease: 2.5,
    intervalDays: 0,
    repetitions: 0,
    lapses: 0,
  );
}

class Sm2Result {
  const Sm2Result({required this.state, required this.dueInDays});

  final Sm2State state;
  final int dueInDays;
}

/// SuperMemo-2. Quality is 0–5. Below 3 is a lapse.
Sm2Result reviewSm2(Sm2State current, int quality) {
  final q = quality.clamp(0, 5);
  if (q < 3) {
    return Sm2Result(
      state: Sm2State(
        ease: current.ease,
        intervalDays: 1,
        repetitions: 0,
        lapses: current.lapses + 1,
      ),
      dueInDays: 1,
    );
  }

  final ease = (current.ease + (0.1 - (5 - q) * (0.08 + (5 - q) * 0.02)))
      .clamp(1.3, 3.0);
  final repetitions = current.repetitions + 1;
  final interval = switch (repetitions) {
    1 => 1,
    2 => 6,
    _ => (current.intervalDays * ease).round().clamp(1, 3650),
  };
  return Sm2Result(
    state: Sm2State(
      ease: ease.toDouble(),
      intervalDays: interval,
      repetitions: repetitions,
      lapses: current.lapses,
    ),
    dueInDays: interval,
  );
}
