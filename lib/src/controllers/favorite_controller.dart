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
  List<TeamModel> teams = [];

  @override
  void onInit() {
    super.onInit();

    getAllFavorites();
  }

  controlFavorite(int id) async {
    isLoading.value = true;

    int saved = await repository.insert(id);
    print("Valor de SAVED: $saved");

    if (saved == 0) {
      appUtils.showToast(
          message: "Não foi possível favoritar este time. Tente novamente",
          isError: true);
    }
  }

  getAllFavorites() async {
    isLoading.value = true;

    List<int> ids = await repository.getAllId();
    print("Quantidade de dados salvos "+ ids.length.toString());

    if (ids.isNotEmpty) {
      ApiResult<List<TeamModel>> result =
          await futinfoRepository.getTeamsFavorites(ids);
      print("Antes do result");
      print(result);

      if (!result.isError) {
        teams = result.data!;
      } else {
        appUtils.showToast(message: result.message!, isError: true);
      }
    }
    isLoading.value = false;
  }
}
