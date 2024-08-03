class ScoreModel {
  final String? winner;
  final String? duration;
  final FullTime? fullTime;
  final HalfTime? halfTime;

  ScoreModel({
    required this.winner,
    required this.duration,
    required this.fullTime,
    required this.halfTime,
  });
}

class FullTime {
  final String? home;
  final String? away;

  FullTime({
    required this.home,
    required this.away,
  });
}

class HalfTime {
  final String? home;
  final String? away;

  HalfTime({
    required this.home,
    required this.away,
  });
}
