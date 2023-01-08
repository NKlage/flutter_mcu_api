/// Represents a Date e.g. ComicDate
class DateSummary {
  /// A description of the date (e.g. onsale date, FOC date).
  final String? type;

  /// The date.
  final DateTime? date;

  /// Default Constructor
  DateSummary({this.type, this.date});

  /// Convert from JSON
  DateSummary.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        date = null == json['date'] ? null : DateTime.tryParse(json['date']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateSummary &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          date == other.date;

  @override
  int get hashCode => type.hashCode ^ date.hashCode;

  @override
  String toString() {
    return 'DateSummary{type: $type, date: $date}';
  }
}
