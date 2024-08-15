import 'package:futinfo/src/core/services/http_manager.dart';
import 'package:futinfo/src/core/utils/api_result.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/core/utils/urls.dart';
import 'package:futinfo/src/models/round_model.dart';
import 'package:futinfo/src/models/table_model.dart';
import 'package:futinfo/src/models/team_model.dart';

class FutinfoRepository {
  final HttpManager httpManager;
  final AppUtils appUtils;

  FutinfoRepository({
    required this.httpManager,
    required this.appUtils,
  });

  Future<ApiResult<RoundModel>> getAllRounds() async {
    //await dotenv.load();

    const String endpoint = Url.matches;
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'X-Auth-Token': 'b14e6d13a40e46248146f1b73e00b529',
      },
    );

    if (response['matches'] != null) {
      var rounds = RoundModel.fromMap(convertMap(response));

      return ApiResult<RoundModel>(data: rounds);
    } else {
      return ApiResult<RoundModel>(
        message: "Erro ao buscar as rodadas de jogos. Tente novamente!",
        isError: true,
      );
    }
  }

  Future<ApiResult<TableModel>> getTableLeague() async {
    const String endpoint = Url.leagueTable;
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'X-Auth-Token': 'b14e6d13a40e46248146f1b73e00b529',
      },
    );

    if (response['standings'] != null) {
      var table = TableModel.fromMap(response['standings'][0]);

      return ApiResult<TableModel>(data: table);
    } else {
      return ApiResult<TableModel>(
        isError: true,
        message: "Erro ao buscar a tabela de classificação. Tente novamente",
      );
    }
  }

  Future<ApiResult<TeamModel>> getTeamGames(TeamModel team) async {
    String endpoint =
        "${Url.teamMatches}/${team.id}/matches?dateFrom=2024-04-14&dateTo=2024-05-08";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'X-Auth-Token': 'b14e6d13a40e46248146f1b73e00b529',
      },
    );

    if (response['matches'] != null) {
      var teamWithGames = team.fromListMatches(convertMap(response));

      return ApiResult<TeamModel>(data: teamWithGames);
    } else {
      return ApiResult<TeamModel>(
          message: "Erro ao buscar jogos desse time. Tente novamente!",
          isError: true);
    }
  }

  Future<ApiResult<TeamModel>> getTeamPlayers(TeamModel team) async {
    String endpoint = "${Url.teamPlayers}/${team.id}";

    final response = await httpManager
        .request(url: endpoint, method: HttpMethods.get, headers: {
      'X-Auth-Token': 'b14e6d13a40e46248146f1b73e00b529',
    });

    if (response['squad'] != null) {
      var teamWithPlayers = team.fromListPlayers(convertMap(response));
      print(teamWithPlayers);

      return ApiResult<TeamModel>(data: teamWithPlayers);
    } else {
      return ApiResult<TeamModel>(
          message: 'Erro ao buscar jogadores do time. Tente novamente!',
          isError: true);
    }
  }

  Future<ApiResult<List<TeamModel>>> getTeamsFavorites(List<int> ids) async {
    String endpoint = Url.team;
    List<TeamModel> listTeams = [];

    for (int i = 0; i < ids.length; i++) {
      var response = await httpManager.request(
        url: "$endpoint/${ids[i]}",
        method: HttpMethods.get,
        headers: {
          'X-Auth-Token': 'b14e6d13a40e46248146f1b73e00b529',
        },
      );
      print(response);

      if (response['squad'] != null) {
        var team = TeamModel.fromMap(convertMap(response));

        listTeams.add(team);
      }
    }

    print("Quanrtidade de teams retornados ${listTeams.length}");

    if (listTeams.isNotEmpty) {
      return ApiResult<List<TeamModel>>(data: listTeams);
    } else {
      return ApiResult<List<TeamModel>>(
          message:
              "Não foi possível buscar os times favoritos. Tente novamente!",
          isError: true);
    }
  }

  static Map<String, dynamic> convertMap(Map<dynamic, dynamic> originalMap) {
    return originalMap.map((key, value) => MapEntry(key.toString(), value));
  }
}
