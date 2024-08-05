import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:futinfo/src/core/services/http_manager.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/core/utils/urls.dart';
import 'package:futinfo/src/models/round_model.dart';

class FutinfoRepository {
  final HttpManager httpManager;
  final AppUtils appUtils;

  FutinfoRepository({
    required this.httpManager,
    required this.appUtils,
  });

  Future getAll() async {
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
      var round = RoundModel.fromMap(RoundModel.convertMap(response));

      print("Entrou no IF -> ${response['message']}");

      return Future.value();
    } else {
      String message = response['error'] ??
          "Não foi possível buscar as informações. Tente novamente!";

      print("Erro -> ${response['message']}");

      return Future.value();
    }
  }
}
