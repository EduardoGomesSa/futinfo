import 'package:flutter/material.dart';
import 'package:futinfo/src/models/match_model.dart';

class MatchWidget extends StatelessWidget {
  const MatchWidget({
    super.key,
    required this.model,
  });

  final MatchModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink,
      child: Column(
        children: [
          Text("Data: ${model.utcDate}"),
          // Text(
          //     "${model.homeTeam!.shortName} - ${model.score!.fullTime!.home} x ${model.score!.fullTime!.away} - ${model.awayTeam!.shortName}"),
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
              Text(model.score!.fullTime!.home.toString()),
              const SizedBox(width: 8),
              const Text(" X "),
              const SizedBox(width: 8),
              Text(model.score!.fullTime!.away.toString()),
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
