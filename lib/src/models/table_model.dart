import 'package:futinfo/src/models/value_objects/team_table.dart';

class TableModel {
  List<TeamTable>? teamsTable;

  TableModel({this.teamsTable});

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      teamsTable: map['table'] != null
          ? List<TeamTable>.from((map['table'] as List<dynamic>)
              .map<TeamTable?>(
                  (x) => TeamTable.fromMap(x as Map<String, dynamic>)))
          : null,
    );
  }
}
