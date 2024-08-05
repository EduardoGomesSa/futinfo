import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final FutinfoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async => controller.getAllRounds(),
        child: GetX<FutinfoController>(
          init: controller,
          builder: (controller) {
            if (controller.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.round.matches!.length,
                itemBuilder: (_, index) {
                  return Text(
                      "${controller.round.matches![index].homeTeam!.name} x ${controller.round.matches![index].awayTeam!.name}");
                },
              );
            }
          },
        ),
      ),
    );
  }
}
