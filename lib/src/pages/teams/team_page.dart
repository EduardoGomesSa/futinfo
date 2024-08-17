import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/favorite_controller.dart';
import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:futinfo/src/core/widgets/match_widget.dart';
import 'package:futinfo/src/core/widgets/player_widget.dart';
import 'package:futinfo/src/models/team_model.dart';
import 'package:get/get.dart';

class TeamPage extends StatelessWidget {
  TeamPage({
    super.key,
    required this.model,
  });

  final TeamModel model;
  final FutinfoController controller = Get.find();
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getTeamGames(model);
      controller.getTeamPlayers(model);
      favoriteController.checkIfIsFavorite(model);
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(model.crest!),
                radius: 15,
              ),
            ),
            Text(model.shortName!)
          ],
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed: controller.toggleView,
              icon: Icon(
                  controller.showMatches.value ? Icons.group : Icons.games),
            ),
          ),
          Obx(
            () => IconButton(
              onPressed: () {
                favoriteController.controlFavorite(model);
              },
              icon: Icon(model.isFavorite.value
                  ? Icons.star
                  : Icons.star_border_outlined),
            ),
          ),
        ],
      ),
      body: GetX<FutinfoController>(
        init: controller,
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final team = controller.team;

            if (team.matches == null) {
              return const Center(
                child: Text("Nenhuma informação disponível"),
              );
            }
            return Column(
              children: [
                Expanded(child: Obx(() {
                  return controller.showMatches.value
                      ? _buildMatchesList(team)
                      : _buildPlayersList(team);
                })),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildMatchesList(TeamModel team) {
    return ListView.builder(
      itemCount: team.matches!.length,
      itemBuilder: (_, index) {
        if (index == 0) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Jogos do time"),
              ),
              MatchWidget(model: team.matches![index]),
            ],
          );
        }
        return MatchWidget(model: team.matches![index]);
      },
    );
  }

  Widget _buildPlayersList(TeamModel team) {
    if (team.players == null) {
      return const Center(
        child: Text("Elenco não disponível no momento"),
      );
    }
    return ListView.builder(
      itemCount: team.players!.length,
      itemBuilder: (_, index) {
        if (index == 0) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Elenco do time"),
              ),
              PlayerWidget(model: team.players![index]),
            ],
          );
        }
        return PlayerWidget(model: team.players![index]);
      },
    );
  }
}
