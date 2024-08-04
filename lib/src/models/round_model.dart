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
}
