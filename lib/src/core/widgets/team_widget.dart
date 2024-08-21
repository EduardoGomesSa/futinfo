import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/favorite_controller.dart';
import 'package:futinfo/src/core/widgets/favorite_icon_widget.dart';
import 'package:futinfo/src/core/widgets/logo_widget.dart';
import 'package:futinfo/src/models/team_model.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    super.key,
    required this.model,
    required this.controller,
  });

  final TeamModel model;
  final FavoriteController controller;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.checkIfIsFavorite(model);
    });
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: Colors.white.withAlpha(100),
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: LogoWidget(model: model),
                    ),
                    Text(model.shortName!),
                  ],
                ),
                
                FavoriteIconWidget(controller: controller, model: model, alreadyFavorite: true,),
              ],
            )),
      ),
    );
  }
}
