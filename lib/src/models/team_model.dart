import 'package:futinfo/src/models/coach_model.dart';
import 'package:futinfo/src/models/match_model.dart';
import 'package:futinfo/src/models/player_model.dart';
import 'package:get/get.dart';

class TeamModel {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;
  CoachModel? coach;
  List<MatchModel>? matches;
  List<PlayerModel>? players;
  RxBool isFavorite;

  TeamModel({
    this.id,
    this.name,
    this.shortName,
    this.tla,
    this.crest,
    this.coach,
    this.matches,
    this.players,
    bool isFavorite = false,
  }) : isFavorite = RxBool(isFavorite);

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      shortName: map['shortName'] != null ? map['shortName'] as String : null,
      tla: map['tla'] != null ? map['tla'] as String : null,
      crest: map['crest'] != null ? map['crest'] as String : null,
    );
  }

  TeamModel fromListMatches(Map<String, dynamic> map) {
    matches = map['matches'] != null
        ? List<MatchModel>.from(
            (map['matches'] as List<dynamic>).map<MatchModel?>(
              (x) => MatchModel.fromMap(x as Map<String, dynamic>),
            ),
          )
        : null;
    return this;
  }

  TeamModel fromListPlayers(Map<String, dynamic> map) {
    players = map['squad'] != null
        ? List<PlayerModel>.from(
            (map['squad'] as List<dynamic>).map<PlayerModel?>(
              (x) => PlayerModel.fromMap(x as Map<String, dynamic>),
            ),
          )
        : null;
    coach = map['coach'] != null
        ? CoachModel.fromMap(map['coach'] as Map<String, dynamic>)
        : null;
    return this;
  }

  void setIsFavorite(bool value) {
    isFavorite.value = value;
  }
}
