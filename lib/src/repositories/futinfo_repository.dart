import 'package:futinfo/src/core/services/http_manager.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/core/utils/urls.dart';

class FutinfoRepository {
  final HttpManager httpManager;
  final AppUtils appUtils;

  FutinfoRepository({
    required this.httpManager,
    required this.appUtils,
  });

  Future getAll({required token}) async {
    const String endpoint = "${Url.base}";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      List list = response['data'];

      return Future.value();
    } else {
      String message = response['error'] ??
          "Não foi possível buscar as informações. Tente novamente!";

      return Future.value();
    }
  }
}
