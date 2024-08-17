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
    final columnLenght = MediaQuery.of(context).size.width * 0.038;

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
                    child: Text("Tabela indisponível no momento"),
                  );
                }
                return DataTable(
                  columnSpacing: columnLenght,
                  headingRowColor: WidgetStateProperty.resolveWith<Color?>(
                              (Set states) {
                            return Colors.black;
                          }),
                  columns: const [
                    DataColumn(label: Text('Pos', style:  TextStyle(color: Colors.white),)),
                    DataColumn(label: Text('Time', style: TextStyle(color: Colors.white),)),
                    DataColumn(label: Text('Pts', style:  TextStyle(color: Colors.white),)),
                    DataColumn(label: Text('J', style: TextStyle(color: Colors.white),)),
                    DataColumn(label: Text('V', style: TextStyle(color: Colors.white),)),
                    DataColumn(label: Text('E', style: TextStyle(color: Colors.white),)),
                    DataColumn(label: Text('D', style: TextStyle(color: Colors.white),)),
                    DataColumn(label: Text('GF', style: TextStyle(color: Colors.white),)),
                    DataColumn(label: Text('GS', style: TextStyle(color: Colors.white),)),
                    DataColumn(label: Text('SG', style: TextStyle(color: Colors.white),)),
                  ],
                  rows: List.generate(
                    table.teamsTable!.length,
                    (index) {
                      final team = table.teamsTable![index];
                      Color rowColor = Colors.transparent;

                      if (index < 6) {
                        rowColor = Colors.blue.withOpacity(0.2);
                      } else if (index >= table.teamsTable!.length - 4) {
                        rowColor = Colors.red.withOpacity(0.2);
                      }

                      return DataRow(
                          color: WidgetStateProperty.resolveWith<Color?>(
                              (Set states) {
                            return rowColor;
                          }),
                          cells: [
                            DataCell(
                              Container(
                                width: double.infinity,
                                color: Colors.black,
                                padding: const EdgeInsets.only(left: 8, right: 1, top: 14, bottom: 10),
                                child: Text(
                                    "${table.teamsTable![index].position}°", style: const TextStyle(color: Colors.white),),
                              ),
                            ),
                            DataCell(Row(
                              children: [
                                LogoWidget(
                                  model: table.teamsTable![index].team!,
                                  size: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child:
                                      Text(table.teamsTable![index].team!.tla!),
                                )
                              ],
                            )),
                            DataCell(Text(
                              table.teamsTable![index].points.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            DataCell(Text(table.teamsTable![index].playedGames
                                .toString())),
                            DataCell(
                                Text(table.teamsTable![index].won.toString())),
                            DataCell(
                                Text(table.teamsTable![index].draw.toString())),
                            DataCell(
                                Text(table.teamsTable![index].lost.toString())),
                            DataCell(Text(
                                table.teamsTable![index].goalsFor.toString())),
                            DataCell(Text(table.teamsTable![index].goalsAgainst
                                .toString())),
                            DataCell(Text(table
                                .teamsTable![index].goalDifference
                                .toString())),
                          ]);
                    },
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
