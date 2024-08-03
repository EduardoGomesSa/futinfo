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
}
