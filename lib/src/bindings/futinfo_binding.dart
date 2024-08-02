import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:futinfo/src/repositories/futinfo_repository.dart';
import 'package:get/get.dart';

class FutinfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FutinfoRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(FutinfoController(repository: Get.find(), appUtils: Get.find()));
  }
}
