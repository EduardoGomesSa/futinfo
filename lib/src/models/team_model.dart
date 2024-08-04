import 'dart:convert';

class TeamModel {
  final int? id;
  final String? name;
  final String? shortName;
  final String? tla;
  final String? crest;

  TeamModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
  });

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      shortName: map['shortName'] != null ? map['shortName'] as String : null,
      tla: map['tla'] != null ? map['tla'] as String : null,
      crest: map['crest'] != null ? map['crest'] as String : null,
    );
  }

  factory TeamModel.fromJson(String source) =>
      TeamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<TeamModel> fromList(list) {
    return List<TeamModel>.from(list.map((x) => TeamModel.fromMap(x)));
  }
}
