import 'dart:convert';

class CompetitionModel {
  final int? id;
  final String? name;
  final String? code;
  final String? type;
  final String? emblem;

  CompetitionModel({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
  });

  factory CompetitionModel.fromMap(Map<String, dynamic> map) {
    return CompetitionModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      emblem: map['emblem'] != null ? map['emblem'] as String : null,
    );
  }

  factory CompetitionModel.fromJson(String source) =>
      CompetitionModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  static List<CompetitionModel> fromList(list) {
    return List<CompetitionModel>.from(
        list.map((x) => CompetitionModel.fromMap(x)));
  }
}
