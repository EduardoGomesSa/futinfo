import 'package:flutter/material.dart';
import 'package:futinfo/src/models/team_model.dart';
import 'package:futinfo/src/pages/teams/team_page.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.model});

  final TeamModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeamPage(model: model,),
          ),
        );
      },
      child: CircleAvatar(
        backgroundImage: NetworkImage(model.crest!),
        radius: 15,
      ),
    );
  }
}
