import 'dart:convert';

import 'package:futinfo/src/models/match_model.dart';

class TeamModel {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;
  List<MatchModel>? matches;

  TeamModel({
    this.id,
    this.name,
    this.shortName,
    this.tla,
    this.crest,
    this.matches,
  });

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
    return TeamModel(
        matches: map['matches'] != null
            ? List<MatchModel>.from(
                (map['matches'] as List<dynamic>).map<MatchModel?>(
                  (x) => MatchModel.fromMap(x as Map<String, dynamic>),
                ),
              )
            : null);
  }

  factory TeamModel.fromJson(String source) =>
      TeamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<TeamModel> fromList(list) {
    return List<TeamModel>.from(list.map((x) => TeamModel.fromMap(x)));
  }
}
