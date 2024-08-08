import 'package:flutter/material.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/core/widgets/logo_widget.dart';
import 'package:futinfo/src/models/match_model.dart';

class MatchPage extends StatelessWidget {
  MatchPage({
    super.key,
    required this.model,
  });

  final MatchModel model;
  final appUtils = AppUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Jogo"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
              child: Card(
                color: Colors.white.withAlpha(100),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Text(appUtils.formatDateTimeHour(model.utcDate!)),
                      Text(appUtils.formatDateTime(model.utcDate!)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LogoWidget(model: model.homeTeam!),
                          const SizedBox(width: 8),
                          Text("${model.homeTeam!.tla} "),
                          const SizedBox(width: 8),
                          model.score!.fullTime!.home != null
                              ? Text(model.score!.fullTime!.home.toString())
                              : const Text(" -"),
                          const SizedBox(width: 8),
                          const Text(" X "),
                          const SizedBox(width: 8),
                          model.score!.fullTime!.away != null
                              ? Text(model.score!.fullTime!.away.toString())
                              : const Text("- "),
                          const SizedBox(width: 8),
                          Text(" ${model.awayTeam!.tla!}"),
                          const SizedBox(width: 8),
                          LogoWidget(model: model.awayTeam!),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text("Placar"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
              child: Card(
                color: Colors.white.withAlpha(100),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      const Text("Primeiro Tempo"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LogoWidget(model: model.homeTeam!),
                          const SizedBox(width: 8),
                          Text("${model.homeTeam!.tla} "),
                          const SizedBox(width: 8),
                          model.score!.halfTime!.home != null
                              ? Text(model.score!.halfTime!.home.toString())
                              : const Text(" -"),
                          const SizedBox(width: 8),
                          const Text(" X "),
                          const SizedBox(width: 8),
                          model.score!.halfTime!.away != null
                              ? Text(model.score!.halfTime!.away.toString())
                              : const Text("- "),
                          const SizedBox(width: 8),
                          Text(" ${model.awayTeam!.tla!}"),
                          const SizedBox(width: 8),
                          LogoWidget(model: model.awayTeam!),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
              child: Card(
                color: Colors.white.withAlpha(100),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      const Text("Segundo Tempo"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LogoWidget(model: model.homeTeam!),
                          const SizedBox(width: 8),
                          Text("${model.homeTeam!.tla} "),
                          const SizedBox(width: 8),
                          model.score!.fullTime!.home != null
                              ? Text(model.score!.fullTime!.home.toString())
                              : const Text(" -"),
                          const SizedBox(width: 8),
                          const Text(" X "),
                          const SizedBox(width: 8),
                          model.score!.fullTime!.away != null
                              ? Text(model.score!.fullTime!.away.toString())
                              : const Text("- "),
                          const SizedBox(width: 8),
                          Text(" ${model.awayTeam!.tla!}"),
                          const SizedBox(width: 8),
                          LogoWidget(model: model.awayTeam!),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
