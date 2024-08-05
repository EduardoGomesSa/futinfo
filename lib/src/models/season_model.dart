import 'dart:convert';

class SeasonModel {
  final int? id;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? currentMatchday;
  final String? winner;

  SeasonModel({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  factory SeasonModel.fromMap(Map<String, dynamic> map) {
    return SeasonModel(
      id: map['id'] != null ? map['id'] as int : null,
      startDate: map['startDate'] != null ? DateTime.parse(map['startDate']) : null,
      endDate: map['endDate'] != null
          ? DateTime.parse(map['endDate'])
          : null,
      currentMatchday:
          map['currentMatchday'] != null ? map['currentMatchday'] as int : null,
      winner: map['winner'] != null ? map['winner'] as String : null,
    );
  }

  factory SeasonModel.fromJson(String source) =>
      SeasonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<SeasonModel> fromList(list) {
    return List<SeasonModel>.from(list.map((x) => SeasonModel.fromMap(x)));
  }
}
