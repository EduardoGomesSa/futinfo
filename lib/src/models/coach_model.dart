class CoachModel {
  int? id;
  String? firstName;
  String? lastName;
  String? name;
  DateTime? dateOfBirth;
  String? nationality;
  Contract? contract;

  CoachModel({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.dateOfBirth,
    this.nationality,
    this.contract,
  });

  factory CoachModel.fromMap(Map<String, dynamic> map) {
    return CoachModel(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      dateOfBirth: map['dateOfBirth'] != null ? DateTime.parse(map['dateOfBirth']) : null,
      nationality: map['nationality'] != null ? map['nationality'] as String : null,
      contract: map['contract'] != null ? Contract.fromMap(map['contract'] as Map<String, dynamic>) : null,       
    );
  }
}

class Contract {
  String? start;
  String? until;

  Contract({
    this.start,
    this.until,
  });

  factory Contract.fromMap(Map<String, dynamic> map) {
    return Contract(
      start: map['start'] != null ? map['start'] as String : null,
      until: map['until'] != null ? map['until'] as String : null,
    );
  }
}
