import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  Future getAll() async {
    await dotenv.load();

    const String endpoint = "${Url.base}";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'X-Auth-Token': dotenv.env['API_TOKEN'] ?? '',
      },
    );

    if (response['data'] != null) {
      print('chamou');
      print(response['data']);
      List list = response['data'];

      return Future.value();
    } else {
      String message = response['error'] ??
          "Não foi possível buscar as informações. Tente novamente!";

      return Future.value();
    }
  }
}
