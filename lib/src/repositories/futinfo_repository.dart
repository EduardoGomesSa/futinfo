import 'package:futinfo/src/core/services/http_manager.dart';
import 'package:futinfo/src/core/utils/api_result.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/core/utils/urls.dart';
import 'package:futinfo/src/models/round_model.dart';
import 'package:futinfo/src/models/table_model.dart';

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
    final response = await httpManager
        .request(url: endpoint, method: HttpMethods.get, headers: {
      'X-Auth-Token': 'b14e6d13a40e46248146f1b73e00b529',
    });

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

  static Map<String, dynamic> convertMap(Map<dynamic, dynamic> originalMap) {
    return originalMap.map((key, value) => MapEntry(key.toString(), value));
  }
}
