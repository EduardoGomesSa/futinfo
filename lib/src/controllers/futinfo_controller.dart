import 'dart:ffi';

import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/repositories/futinfo_repository.dart';
import 'package:get/get.dart';

class FutinfoController extends GetxController {
  final FutinfoRepository repository;
  final AppUtils appUtils;

  FutinfoController({
    required this.repository,
    required this.appUtils,
  });

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getInfos();
    repository.getAll();
  }

  getInfos() async {
    isLoading.value = true;

    var result = await repository.getAll();
  }
}
