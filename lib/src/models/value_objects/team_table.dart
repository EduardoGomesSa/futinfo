import 'package:futinfo/src/models/team_model.dart';

class TeamTable {
  int? position;
  TeamModel? team;
  int? playGames;
  int? won;
  int? draw;
  int? lost;
  int? points;
  int? goalsFor;
  int? goalsAgainst;
  int? goalDifference;

  TeamTable({
    this.position,
    this.team,
    this.playGames,
    this.won,
    this.draw,
    this.lost,
    this.points,
    this.goalsFor,
    this.goalsAgainst,
    this.goalDifference,
  });

  factory TeamTable.fromMap(Map<String, dynamic> map) {
    return TeamTable(
      position: map['position'] != null ? map['position'] as int : null,
      team: map['team'] != null ? TeamModel.fromMap(map['team'] as Map<String, dynamic>) : null,
      playGames: map['playGames'] != null ? map['playGames'] as int : null,
      won: map['won'] != null ? map['won'] as int : null,
      draw: map['draw'] != null ? map['draw'] as int : null,
      lost: map['lost'] != null ? map['lost'] as int : null,
      points: map['points'] != null ? map['points'] as int : null,
      goalsFor: map['goalsFor'] != null ? map['goalsFor'] as int : null,
      goalsAgainst: map['goalsAgainst'] != null ? map['goalsAgainst'] as int : null,
      goalDifference: map['goalDifference'] != null ? map['goalDifference'] as int : null,  
    );
  }
}
