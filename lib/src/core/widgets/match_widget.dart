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
              Text(model.homeTeam!.shortName!),
              const Text("X"),
              Text(model.awayTeam!.shortName!),
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
