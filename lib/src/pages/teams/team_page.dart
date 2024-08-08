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
        title: Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(backgroundImage: NetworkImage(model.crest!),radius: 15,),
          ),
          Text(model.shortName!)
        ],),
      ),
    );
  }
}
