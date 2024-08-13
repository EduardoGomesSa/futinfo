import 'package:flutter/material.dart';
import 'package:futinfo/src/models/player_model.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({super.key, required this.model});

  final PlayerModel model;

  String getAge(DateTime birthDay) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDay.year;

    if (currentDate.month < birthDay.month ||
        (currentDate.month == birthDay.month &&
            currentDate.day < birthDay.day)) {
      age--;
    }

    return age.toString();
  }

  String getPositionInPortuguese(String position) {
    switch (position) {
      case 'Goalkeeper':
        return 'Goleiro';
      case 'Defence':
        return 'Defensor';
      case 'Midfield':
        return 'Meio-campo';
      case 'Offence':
        return 'Atacante';
      case 'Centre-Back':
        return 'Zagueiro';
      default:
        return 'Indefinida';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 10),
      child: Card(
        margin: const EdgeInsets.only(left: 45, right: 45),
        color: Colors.white.withAlpha(100),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, size: 13,),
                      const SizedBox(width: 5),
                      Text(model.name!),
                    ],
                  ),
                  Row( 
                    children: [
                      const Icon(Icons.star, size: 13,),
                      const SizedBox(width: 5),
                      Text("${getAge(model.dateOfBirth!)} anos"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.sports_soccer, size: 13,),
                      const SizedBox(width: 5),
                      Text(getPositionInPortuguese(model.position!)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.local_activity, size: 13,),
                      const SizedBox(width: 5),
                      Text("${model.nationality}"),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
