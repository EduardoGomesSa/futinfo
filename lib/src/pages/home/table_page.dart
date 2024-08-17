import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:futinfo/src/core/widgets/logo_widget.dart';
import 'package:get/get.dart';

class TablePage extends StatelessWidget {
  TablePage({super.key});

  final FutinfoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getTableLeague();
    });
    final columnLenght = MediaQuery.of(context).size.width * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabela Brasileirão Série A"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GetX<FutinfoController>(
            init: controller,
            builder: (controller) {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final table = controller.table.value;

                if (table == null ||
                    table.teamsTable == null ||
                    table.teamsTable!.isEmpty) {
                  return const Center(
                    child: Text("Nenhuma tabela disponível"),
                  );
                }
                return DataTable(
                  columnSpacing: columnLenght,
                  columns: const [
                    DataColumn(label: Text('Pos')),
                    DataColumn(label: Text('Time')),
                    DataColumn(label: Text('Pts')),
                    DataColumn(label: Text('J')),
                    DataColumn(label: Text('V')),
                    DataColumn(label: Text('E')),
                    DataColumn(label: Text('D')),
                    DataColumn(label: Text('GF')),
                    DataColumn(label: Text('GS')),
                    DataColumn(label: Text('SG')),
                  ],
                  rows: List.generate(
                    table.teamsTable!.length,
                    (index) => DataRow(cells: [
                      DataCell(Text("${table.teamsTable![index].position}°")),
                      DataCell(Row(
                        children: [
                          LogoWidget(
                            model: table.teamsTable![index].team!,
                            size: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(table.teamsTable![index].team!.tla!),
                          )
                        ],
                      )),
                      DataCell(
                          Text(table.teamsTable![index].points.toString())),
                      DataCell(Text(
                          table.teamsTable![index].playedGames.toString())),
                      DataCell(Text(table.teamsTable![index].won.toString())),
                      DataCell(Text(table.teamsTable![index].draw.toString())),
                      DataCell(Text(table.teamsTable![index].lost.toString())),
                      DataCell(
                          Text(table.teamsTable![index].goalsFor.toString())),
                      DataCell(Text(
                          table.teamsTable![index].goalsAgainst.toString())),
                      DataCell(Text(
                          table.teamsTable![index].goalDifference.toString())),
                    ]),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
