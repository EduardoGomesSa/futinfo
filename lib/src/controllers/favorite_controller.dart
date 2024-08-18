import 'package:futinfo/src/core/utils/api_result.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/models/team_model.dart';
import 'package:futinfo/src/repositories/favorite_repository.dart';
import 'package:futinfo/src/repositories/futinfo_repository.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final FavoriteRepository repository;
  final FutinfoRepository futinfoRepository;
  final AppUtils appUtils;

  FavoriteController({
    required this.repository,
    required this.appUtils,
    required this.futinfoRepository,
  });

  RxBool isLoading = false.obs;
  RxList<TeamModel> teams = <TeamModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    getAllFavorites();
  }

  controlFavorite(TeamModel model) async {
    isLoading.value = true;

    var teamAlreadyFav = await repository.getById(model.id!);

    if (teamAlreadyFav == 0) {
      int saved = await repository.insert(model.id!);

      if (saved != 0) {
        model.setIsFavorite(true);
        teams.add(model);
        print("time adicionado $saved");
      } else {
        appUtils.showToast(
            message: "Não foi possível favoritar este time. Tente novamente!",
            isError: true);
      }
    } else {
      int removed = await repository.remove(model.id!);

      if (removed != 0) {
        model.setIsFavorite(false);
        teams.remove(model);
        print("time removido $removed");
      } else {
        appUtils.showToast(
            message:
                "Não foi possível desfavoritar este time. Tente novamente!",
            isError: true);
      }
    }

    isLoading.value = false;
  }

  getAllFavorites() async {
    try {
      isLoading.value = true;

      List<int> ids = await repository.getAllId();

      if (ids.isNotEmpty) {
        ApiResult<List<TeamModel>> result =
            await futinfoRepository.getTeamsFavorites(ids);

        if (!result.isError) {
          teams.assignAll(result.data!);
        } else {
          appUtils.showToast(message: result.message!, isError: true);
        }
      } else {
        teams.clear();
      }
    } finally {
      isLoading.value = false;
    }
  }

  checkIfIsFavorite(TeamModel model) async {
    var isFavorite = await repository.getById(model.id!);

    if (isFavorite > 0) {
      model.setIsFavorite(true);
    } else {
      model.setIsFavorite(false);
    }
  }

  //isFavorite()
}
