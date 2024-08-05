import 'dart:convert';

import 'package:futinfo/src/models/area_model.dart';
import 'package:futinfo/src/models/competition_model.dart';
import 'package:futinfo/src/models/match_model.dart';
import 'package:futinfo/src/models/season_model.dart';

class RoundModel {
  final AreaModel? area;
  final CompetitionModel? competition;
  final SeasonModel? season;
  final List<MatchModel>? matches;

  RoundModel({
    required this.area,
    required this.competition,
    required this.season,
    required this.matches,
  });

  factory RoundModel.fromMap(Map<String, dynamic> map) {
    return RoundModel(
      area: map['matches'][0]['area'] != null
          ? AreaModel.fromMap(map['matches'][0]['area'])
          : null,
      competition: map['matches'][0]['competition'] != null
          ? CompetitionModel.fromMap(map['matches'][0]['competition'])
          : null,
      season: map['matches'][0]['season'] != null
          ? SeasonModel.fromMap(map['matches'][0]['season'])
          : null,
      matches: map['matches'] != null
          ? List<MatchModel>.from((map['matches'] as List<dynamic>)
              .map<MatchModel?>(
                  (x) => MatchModel.fromMap(x as Map<String, dynamic>)))
          : null,
    );
  }

  factory RoundModel.fromJson(String source) =>
      RoundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<RoundModel> fromList(list) {
    return List<RoundModel>.from(list.map((x) => RoundModel.fromMap(x)));
  }

  static Map<String, dynamic> convertMap(Map<dynamic, dynamic> originalMap) {
      return originalMap.map((key, value) => MapEntry(key.toString(), value));
    }
}
