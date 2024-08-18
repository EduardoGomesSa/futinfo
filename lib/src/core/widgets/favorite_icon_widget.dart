import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/favorite_controller.dart';
import 'package:futinfo/src/models/team_model.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    super.key,
    required this.controller,
    required this.model,
    this.alreadyFavorite = false,
  });

  final FavoriteController controller;
  final TeamModel model;
  final bool alreadyFavorite;

  @override
  Widget build(BuildContext context) {
    if (alreadyFavorite) {
      return IconButton(
          onPressed: () {
            controller.controlFavorite(model);
          },
          icon: Icon(Icons.delete, color: Colors.red.shade300,));
    }

    return Obx(() {
      return IconButton(
        onPressed: () {
          controller.controlFavorite(model);
        },
        icon: Icon(model.isFavorite.value ? Icons.star : Icons.star_border, color: Colors.yellow),
      );
    });
  }
}
