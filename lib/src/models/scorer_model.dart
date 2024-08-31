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
      
    );
  }
}
