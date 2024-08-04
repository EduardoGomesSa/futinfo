import 'dart:convert';

class AreaModel {
  final int? id;
  final String? name;
  final String? code;
  final String? flag;

  AreaModel({
    required this.id,
    required this.name,
    required this.code,
    required this.flag,
  });

  factory AreaModel.fromMap(Map<String, dynamic> map) {
    return AreaModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      flag: map['flag'] != null ? map['flag'] as String : null,
    );
  }

  factory AreaModel.fromJson(String source) =>
      AreaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<AreaModel> fromList(list) {
    return List<AreaModel>.from(list.map((x) => AreaModel.fromMap(x)));
  }
}
