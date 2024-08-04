import 'dart:convert';

import 'package:futinfo/src/models/team_model.dart';
import 'package:futinfo/src/models/value_objects/score_model.dart';

class MatchModel {
  final int? id;
  final DateTime? utcDate;
  final String? status;
  final int? matchday;
  final String? stage;
  final DateTime? lastUpdated;
  final TeamModel? homeTeam;
  final TeamModel? awayTeam;
  final ScoreModel? score;

  MatchModel({
    required this.id,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.stage,
    required this.lastUpdated,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
  });

  factory MatchModel.fromMap(Map<String, dynamic> map) {
    return MatchModel(
      id: map['id'] != null ? map['id'] as int : null,
      utcDate: map['utcDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['utcDate'] as int)
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      matchday: map['matchday'] != null ? map['matchday'] as int : null,
      stage: map['stage'] != null ? map['stage'] as String : null,
      lastUpdated: map['lastUpdated'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'] as int)
          : null,
      homeTeam: map['homeTeam'] != null
          ? TeamModel.fromMap(map['homeTeam'] as Map<String, dynamic>)
          : null,
      awayTeam: map['awayTeam'] != null
          ? TeamModel.fromMap(map['awayTeam'] as Map<String, dynamic>)
          : null,
      score: map['score'] != null
          ? ScoreModel.fromMap(map['score'] as Map<String, dynamic>)
          : null,
    );
  }

  factory MatchModel.fromJson(String source) =>
      MatchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<MatchModel> fromList(list) {
    return List<MatchModel>.from(list.map((x) => MatchModel.fromMap(x)));
  }
}
