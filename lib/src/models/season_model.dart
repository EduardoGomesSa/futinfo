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
}
