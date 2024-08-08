import 'package:flutter/material.dart';
import 'package:futinfo/src/models/team_model.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({
    super.key,
    required this.model,
  });

  final TeamModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.shortName!),
      ),
    );
  }
}
