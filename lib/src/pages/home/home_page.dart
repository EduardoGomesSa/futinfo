import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:futinfo/src/controllers/theme_controller.dart';
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
  final ThemeController themeController = Get.find();

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
        title: GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) => Stack(
              children: [
                Positioned(
                  top: kToolbarHeight + 10,
                  left: 0,
                  right: 0,
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(controller.round.competition != null
                    ? controller.round.competition!.name!
                    : "Campeonato Brasileiro Série A"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          child: Text(controller.round.competition != null
              ? controller.round.competition!.name!
              : "Campeonato Brasileiro Série A"),
        ),
        actions: [
          Obx(
            () => IconButton(
                onPressed: () {
                  themeController.toggleTheme();
                },
                icon: Icon(themeController.themeMode.value == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode)),
          ),
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
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: currentRoundMatches.length,
                      itemBuilder: (_, index) {
                        int roundGroup = controller.selectedRound.value ??
                            controller.round.season!.currentMatchday!;
                        roundGroup += (index ~/ 10);
                        if (index % 10 == 0) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                            child: Divider(
                                          color: Colors.black38,
                                          thickness: 2,
                                        )),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            "Rodada $roundGroup",
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        const Expanded(
                                            child: Divider(
                                          color: Colors.black38,
                                          thickness: 2,
                                        )),
                                      ],
                                    ),
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
