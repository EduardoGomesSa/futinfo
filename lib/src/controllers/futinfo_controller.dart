import 'package:flutter/material.dart';
import 'package:futinfo/src/core/utils/api_result.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/models/round_model.dart';
import 'package:futinfo/src/models/table_model.dart';
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
  RoundModel round = RoundModel();
  var table = Rx<TableModel?>(null);
  var selectedRound = 1.obs;

  @override
  void onInit() {
    super.onInit();

    getAllRounds();
  }

  getAllRounds() async {
    isLoading.value = true;

    ApiResult<RoundModel> result = await repository.getAllRounds();

    if (!result.isError) {
      round = result.data!;
      selectedRound.value = round.season!.currentMatchday!;
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  getTableLeague() async {
    isLoading.value = true;

    ApiResult<TableModel> result = await repository.getTableLeague();

    if (!result.isError) {
      table.value = result.data!;
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}
