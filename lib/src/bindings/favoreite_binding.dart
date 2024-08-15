import 'package:futinfo/src/controllers/favorite_controller.dart';
import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:futinfo/src/core/services/http_manager.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/repositories/favorite_repository.dart';
import 'package:futinfo/src/repositories/futinfo_repository.dart';
import 'package:get/get.dart';

class FavoreiteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppUtils());
    Get.put(FavoriteRepository());
    Get.put(HttpManager());
    Get.put(FutinfoRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(FutinfoController(repository: Get.find(), appUtils: Get.find()));
    Get.put(FavoriteController(
        repository: Get.find(),
        appUtils: Get.find(),
        futinfoRepository: Get.find()));
  }
}
