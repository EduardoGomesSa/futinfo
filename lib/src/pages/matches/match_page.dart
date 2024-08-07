import 'package:flutter/material.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
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
            Text(appUtils.formatDateTimeHour(model.utcDate!)),
            Text(appUtils.formatDateTime(model.utcDate!)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(model.homeTeam!.crest!),
                  radius: 15,
                ),
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
                CircleAvatar(
                  backgroundImage: NetworkImage(model.awayTeam!.crest!),
                  radius: 15,
                ),
              ],
            )
          ],
        ),
    );
  }
}
