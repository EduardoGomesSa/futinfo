import 'package:flutter/material.dart';
import 'package:futinfo/src/models/match_model.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({
    super.key,
    required this.model,
  });

  final MatchModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo"),
      ),
      body: Text(model.homeTeam!.shortName!),
    );
  }
}
