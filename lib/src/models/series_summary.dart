/// Represents a SeriesSummary
class SeriesSummary {
  /// The path to the individual series resource.
  final String? resourceUri;

  /// The canonical name of the series.
  final String? name;

  /// Default Constructor
  SeriesSummary({this.resourceUri, this.name});

  /// Convert from JSON
  SeriesSummary.fromJson(Map<String, dynamic> json)
      : resourceUri = json['resourceURI'],
        name = json['name'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesSummary &&
          runtimeType == other.runtimeType &&
          resourceUri == other.resourceUri &&
          name == other.name;

  @override
  int get hashCode => resourceUri.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'SeriesSummary{resourceUri: $resourceUri, name: $name}';
  }
}
