import 'package:flutter/material.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:futinfo/src/core/widgets/logo_widget.dart';
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
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
        child: Card(
          color: Colors.white.withAlpha(100),
          child: Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(appUltils.formatDateTimeHour(model.utcDate!), style: const TextStyle(fontSize: 18)),
                ),
                Text(appUltils.formatDateTime(model.utcDate!), style: const TextStyle(fontSize: 14, color: Colors.black54)),
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
    );
  }
}
