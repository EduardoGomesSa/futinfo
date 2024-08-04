import 'dart:convert';

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

  factory ScoreModel.fromMap(Map<String, dynamic> map) {
    return ScoreModel(
      winner: map['winner'] != null ? map['winner'] as String : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      fullTime: map['fullTime'] != null ? FullTime.fromMap(map['fullTime'] as Map<String, dynamic>) : null,
      halfTime: map['halfTime'] != null ? HalfTime.fromMap(map['halfTime'] as Map<String, dynamic>) : null,
    );
  }
}

class FullTime {
  final String? home;
  final String? away;

  FullTime({
    required this.home,
    required this.away,
  });

  factory FullTime.fromMap(Map<String, dynamic> map) {
    return FullTime(
      home: map['home'] != null ? map['home'] as String : null,
      away: map['away'] != null ? map['away'] as String : null,
    );
  }

  factory FullTime.fromJson(String source) =>
      FullTime.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<FullTime> fromList(list) {
    return List<FullTime>.from(list.map((x) => FullTime.fromMap(x)));
  }
}

class HalfTime {
  final String? home;
  final String? away;

  HalfTime({
    required this.home,
    required this.away,
  });

  factory HalfTime.fromMap(Map<String, dynamic> map) {
    return HalfTime(
      home: map['home'] != null ? map['home'] as String : null,
      away: map['away'] != null ? map['away'] as String : null,
    );
  }

  factory HalfTime.fromJson(String source) =>
      HalfTime.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<HalfTime> fromList(list) {
    return List<HalfTime>.from(list.map((x) => HalfTime.fromMap(x)));
  }
}
