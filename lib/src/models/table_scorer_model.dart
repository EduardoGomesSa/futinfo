import 'package:futinfo/src/models/value_objects/scorer.dart';

class TableScorerModel {
  List<Scorer>? scorers;

  TableScorerModel({this.scorers});

  factory TableScorerModel.fromMap(Map<String, dynamic> map) {
    return TableScorerModel(
        scorers: map['scorers'] != null
            ? List<Scorer>.from((map['scorers'] as List<dynamic>).map<Scorer?>(
                (scorer) =>
                    Scorer.fromMap(scorer as Map<String, dynamic>)))
            : null);
  }
}
