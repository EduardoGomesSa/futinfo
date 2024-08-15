import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/favorite_controller.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final FavoriteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllFavorites();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: GetX<FavoriteController>(
        init: controller,
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var favoriteTeams = controller.teams;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: favoriteTeams.length,
              itemBuilder: (_, index) {
                return Text(favoriteTeams[index].name!);
              },
            );
          }
        },
      ),
    );
  }
}
