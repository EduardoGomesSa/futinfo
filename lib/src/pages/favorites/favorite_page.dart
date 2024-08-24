import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/favorite_controller.dart';
import 'package:futinfo/src/core/widgets/team_widget.dart';
import 'package:futinfo/src/pages/home/table_page.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final FavoriteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.getAllFavorites();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus times favoritos"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TablePage(
                      favoriteTeamsId:
                          controller.teams.map((team) => team.id as int).toList(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.table_chart)),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.teams.isEmpty) {
          return const Center(
            child: Text("Nenhum time favorito ainda"),
          );
        } else {
          var favoriteTeams = controller.teams;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: favoriteTeams.length,
            itemBuilder: (_, index) {
              return TeamWidget(
                model: favoriteTeams[index],
                controller: controller,
              );
            },
          );
        }
      }),
    );
  }
}
