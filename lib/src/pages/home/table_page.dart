import 'package:flutter/material.dart';
import 'package:futinfo/src/controllers/futinfo_controller.dart';
import 'package:futinfo/src/core/widgets/logo_widget.dart';
import 'package:futinfo/src/models/table_model.dart';
import 'package:futinfo/src/models/table_scorer_model.dart';
import 'package:get/get.dart';

class TablePage extends StatelessWidget {
  TablePage({
    super.key,
    this.favoriteTeamsId = const [],
  });

  final List<int> favoriteTeamsId;

  final FutinfoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getTableLeague();
      controller.getTableScorers();
    });
    final columnLenght = MediaQuery.of(context).size.width * 0.038;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.showtableLeague.value ? "Classificação da Série A" : "Artilheiros da Série A")),
        actions: [
          Obx(() => IconButton(
                onPressed: () {
                  controller.toggleViewTable();
                },
                icon: Icon(controller.showtableLeague.value
                    ? Icons.sports_soccer_sharp
                    : Icons.table_chart),
              ))
        ],
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
                final tableScorers = controller.tableScorers.value;

                if (table == null ||
                    table.teamsTable == null ||
                    table.teamsTable!.isEmpty || tableScorers == null ||
                    tableScorers.scorers == null ||
                    tableScorers.scorers!.isEmpty) {
                  return const Center(
                    child: Text("Tabela indisponível no momento"),
                  );
                }
                return controller.showtableLeague.value
                    ? _buildTableLeague(table, columnLenght, context)
                    : _buildTableScorers(tableScorers, columnLenght, context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTableLeague(
      TableModel table, double columnLenght, BuildContext context) {
    return DataTable(
      columnSpacing: columnLenght,
      headingRowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.grey;
        }
        return Colors.black;
      }),
      columns: const [
        DataColumn(
            label: Text(
          'Pos',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'Time',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'Pts',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'J',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'V',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'E',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'D',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'GF',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'GS',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'SG',
          style: TextStyle(color: Colors.white),
        )),
      ],
      rows: List.generate(
        table.teamsTable!.length,
        (index) {
          Color rowColor = Colors.transparent;
          Color cellColor = Colors.transparent;
          Color favoriteTextColor =
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black;

          if (favoriteTeamsId.contains(table.teamsTable![index].team!.id)) {
            cellColor = Colors.yellow;
            if (Theme.of(context).brightness == Brightness.dark) {
              favoriteTextColor = Colors.black;
            }
          }
          if (index < 6) {
            rowColor = Colors.blue.withOpacity(0.2);
          } else if (index >= table.teamsTable!.length - 4) {
            rowColor = Colors.red.withOpacity(0.2);
          }

          return DataRow(
              color: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return rowColor; // Cor padrão
              }),
              cells: [
                DataCell(
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    padding: const EdgeInsets.only(
                        left: 10, right: 2, top: 10, bottom: 10),
                    child: Text(
                      "${table.teamsTable![index].position}°",
                      style: const TextStyle(color: Colors.white),
                    ),
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
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: cellColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          table.teamsTable![index].team!.tla!,
                          style: TextStyle(color: favoriteTextColor),
                        ),
                      ),
                    )
                  ],
                )),
                DataCell(Text(
                  table.teamsTable![index].points.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
                DataCell(Text(table.teamsTable![index].playedGames.toString())),
                DataCell(Text(table.teamsTable![index].won.toString())),
                DataCell(Text(table.teamsTable![index].draw.toString())),
                DataCell(Text(table.teamsTable![index].lost.toString())),
                DataCell(Text(table.teamsTable![index].goalsFor.toString())),
                DataCell(
                    Text(table.teamsTable![index].goalsAgainst.toString())),
                DataCell(
                    Text(table.teamsTable![index].goalDifference.toString())),
              ]);
        },
      ),
    );
  }

  Widget _buildTableScorers(
      TableScorerModel table, double columnLenght, BuildContext context) {
    return DataTable(
      columnSpacing: columnLenght,
      headingRowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.grey;
        }
        return Colors.black;
      }),
      columns: const [
        DataColumn(
            label: Text(
          'Pos',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'Jogador',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'Gols',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'Assists',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'Gols pênalti',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'Jogos',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text(
          'Time',
          style: TextStyle(color: Colors.white),
        )),
      ],
      rows: List.generate(
        table.scorers!.length,
        (index) {
          Color rowColor = Colors.transparent;
          Color cellColor = Colors.transparent;
          Color favoriteTextColor =
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black;

          return DataRow(
              color: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return rowColor; // Cor padrão
              }),
              cells: [
                DataCell(
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    padding: const EdgeInsets.only(
                        left: 10, right: 2, top: 10, bottom: 10),
                    child: Text(
                      "${index+1}°",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                DataCell(Text(
                  table.scorers![index].player!.name.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
                DataCell(Text(table.scorers![index].goals.toString())),
                DataCell(Text(table.scorers![index].assists.toString())),
                DataCell(Text(table.scorers![index].penalties.toString())),
                DataCell(Text(table.scorers![index].playedMatches.toString())),
                DataCell(Row(
                  children: [
                    LogoWidget(
                      model: table.scorers![index].team!,
                      size: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: cellColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          table.scorers![index].team!.tla!,
                          style: TextStyle(color: favoriteTextColor),
                        ),
                      ),
                    )
                  ],
                )),
              ]);
        },
      ),
    );
  }
}
