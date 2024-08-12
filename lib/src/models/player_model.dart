class PlayerModel {
  int? id;
  String? name;
  String? position;
  DateTime? dateOfBirth;
  String? nationality;

  PlayerModel({
    this.id,
    this.name,
    this.position,
    this.dateOfBirth,
    this.nationality,
  });

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      position: map['position'] != null ? map['position'] as String : null,
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      nationality:
          map['nationality'] != null ? map['nationality'] as String : null,
    );
  }
}
