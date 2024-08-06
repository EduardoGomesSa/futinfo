import 'package:flutter/material.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/models/match_model.dart';
import 'package:futinfo/src/pages/matches/match_page.dart';

class MatchWidget extends StatelessWidget {
  MatchWidget({
    super.key,
    required this.model,
  });

  final MatchModel model;
  final appUltils = AppUtils();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatchPage(model: model),
          ),
        );
      },
      child: Card(
        color: Colors.pink,
        child: Column(
          children: [
            Text(appUltils.formatDateTimeHour(model.utcDate!)),
            Text(appUltils.formatDateTime(model.utcDate!)),
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
      ),
    );
  }
}
