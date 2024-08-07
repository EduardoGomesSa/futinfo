import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:futinfo/src/core/widgets/match_widget.dart';
import 'package:futinfo/src/models/match_model.dart';
import 'package:futinfo/src/models/round_model.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final FutinfoController controller = Get.find();

  List<MatchModel> getMatchesForRound(RoundModel round, [int? roundNumber]) {
    int targetRound = roundNumber ?? round.season!.currentMatchday!;

    return round.matches!
        .where((match) => match.matchday == targetRound)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          PopupMenuButton<int>(
              icon: const Icon(Icons.list),
              onSelected: (selectedRound) {
                controller.selectedRound.value = selectedRound;
              },
              itemBuilder: (BuildContext context) {
                return List.generate(38, (index) => index + 1)
                    .map(
                      (round) => PopupMenuItem(
                        value: round,
                        child: Text('Rodada $round'),
                      ),
                    )
                    .toList();
              })
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async => controller.getAllRounds(),
        child: GetX<FutinfoController>(
          init: controller,
          builder: (controller) {
            if (controller.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final currentRoundMatches = getMatchesForRound(
                  controller.round, controller.selectedRound.value);
              return Column(
                children: [
                  Text(
                    controller.round.competition!.name!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: currentRoundMatches.length,
                      itemBuilder: (_, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("Rodada ${controller.selectedRound.value}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            ),
                          );
                        }
                        return MatchWidget(model: currentRoundMatches[index]);
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
