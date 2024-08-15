import 'package:flutter/material.dart';
import 'package:futinfo/src/models/team_model.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({super.key, required this.model});

  final TeamModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Text(model.shortName!),
      ),
    );
  }
}
