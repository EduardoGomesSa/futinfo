import 'package:futinfo/src/models/player_model.dart';
import 'package:futinfo/src/models/team_model.dart';

class ScorerModel {
  PlayerModel? player;
  TeamModel? team;
  int? playedMatches;
  int? goals;
  int? assists;
  int? penalties;

  ScorerModel({
    this.player,
    this.team,
    this.playedMatches,
    this.goals,
    this.assists,
    this.penalties,
  });

  factory ScorerModel.fromMap(Map<String, dynamic> map) {
    return ScorerModel(
      player: map['player'] != null ? PlayerModel.fromMap(map['player']  as Map<String, dynamic>) : null,
      team: map['team'] != null ? TeamModel.fromMap(map['team'] as Map<String, dynamic>) : null,
      playedMatches: map['playedMatches'] != null ? map['playedMatches'] as int : null,
      goals: map['goals'] != null ? map['goals'] as int : null,
      assists: map['assists'] != null ? map['assists'] as int : null,
      penalties: map['penalties'] != null ? map['penalties'] as int : null,
    );
  }
}
