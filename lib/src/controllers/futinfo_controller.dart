import 'package:flutter/material.dart';
import 'package:futinfo/src/core/utils/api_result.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/models/round_model.dart';
import 'package:futinfo/src/models/table_model.dart';
import 'package:futinfo/src/models/team_model.dart';
import 'package:futinfo/src/repositories/futinfo_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FutinfoController extends GetxController {
  final FutinfoRepository repository;
  final AppUtils appUtils;

  FutinfoController({
    required this.repository,
    required this.appUtils,
  }) {
    DateTime currentDate = DateTime.now();
    startDate.value = DateFormat('yyyy-MM-dd').format(
        DateTime(currentDate.year, currentDate.month - 1, currentDate.day));
    lastDate.value = DateFormat('yyyy-MM-dd').format(
        DateTime(currentDate.year, currentDate.month + 1, currentDate.day));
  }

  RxBool isLoading = false.obs;
  RoundModel round = RoundModel();
  var table = Rx<TableModel?>(null);
  Rxn<int> selectedRound = Rxn<int>();
  TeamModel team = TeamModel();
  var showMatches = true.obs;

  var startDate = ''.obs;
  var lastDate = ''.obs;

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
      //selectedRound.value = round.season!.currentMatchday!;
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

  getTeamGames(TeamModel model) async {
    isLoading.value = true;

    ApiResult<TeamModel> result =
        await repository.getTeamGames(model, startDate.value, lastDate.value);

    if (!result.isError) {
      team = result.data!;
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  getTeamPlayers(TeamModel model) async {
    isLoading.value = true;

    ApiResult<TeamModel> result = await repository.getTeamPlayers(model);

    if (!result.isError) {
      team = result.data!;
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  Future<void> selectStartDate(BuildContext context, TeamModel model) async {
    DateTime initialDate = DateTime.parse(startDate.value);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2024, 3, 1),
      lastDate: DateTime(2024, 12, 31),
    );

    if (picked != null) {
      startDate.value = "${picked.toLocal()}".split(' ')[0];
      getTeamGames(model);
    }
  }

  Future<void> selectEndDate(BuildContext context, TeamModel model) async {
    DateTime initialDate = DateTime.parse(lastDate.value);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2024, 1, 1),
      lastDate: DateTime(2024, 12, 31),
    );

    if (picked != null) {
      lastDate.value = "${picked.toLocal()}".split(' ')[0];
      getTeamGames(model);
    }
  }

  void toggleView() {
    showMatches.value = !showMatches.value;
  }
}
