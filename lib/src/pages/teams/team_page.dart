import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:futinfo/src/core/widgets/match_widget.dart';
import 'package:futinfo/src/models/team_model.dart';
import 'package:get/get.dart';

class TeamPage extends StatelessWidget {
  TeamPage({
    super.key,
    required this.model,
  });

  final TeamModel model;
  final FutinfoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getTeamGames(model);
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
      ),
      body: GetX<FutinfoController>(
        init: controller,
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final teamGames = controller.team;

            if (teamGames.matches == null) {
              return const Center(
                child: Text("Nenhum jogo disponível"),
              );
            }
            return Column(
              children: [
                const Text("Jogos do Time"),
                Expanded(
                  child: ListView.builder(
                    itemCount: teamGames.matches!.length,
                    itemBuilder: (_, index) {
                      //return Text("aaaaa");
                      return MatchWidget(model: teamGames.matches![index]);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
