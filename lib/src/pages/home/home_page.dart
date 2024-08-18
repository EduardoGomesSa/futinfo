import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:futinfo/src/core/widgets/match_widget.dart';
import 'package:futinfo/src/models/match_model.dart';
import 'package:futinfo/src/models/round_model.dart';
import 'package:futinfo/src/pages/home/table_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final FutinfoController controller = Get.find();

  List<MatchModel> getMatchesForRound(RoundModel round, {int? roundNumber}) {
    if (roundNumber != null) {
      return round.matches!
          .where((match) => match.matchday == roundNumber)
          .toList();
    }

    int currentMatchday = round.season!.currentMatchday!;
    controller.selectedRound.value = currentMatchday;

    return round.matches!
        .where((match) =>
            match.matchday == currentMatchday ||
            match.matchday == currentMatchday + 1 ||
            match.matchday == currentMatchday + 2)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TablePage()));
              },
              icon: const Icon(Icons.table_chart)),
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
        onRefresh: () async {
          controller.selectedRound.value = null;
          controller.getAllRounds();
        },
        child: GetX<FutinfoController>(
          init: controller,
          builder: (controller) {
            if (controller.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final currentRoundMatches = getMatchesForRound(controller.round,
                  roundNumber: controller.selectedRound.value);
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
                        int roundGroup =
                            (index ~/ 10) + controller.selectedRound.value! !=
                                    false
                                ? controller.selectedRound.value!
                                : controller.round.season!.currentMatchday!;
                        if (index % 10 == 0) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Text(
                                    "Rodada ${roundGroup++}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              MatchWidget(model: currentRoundMatches[index]),
                            ],
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
