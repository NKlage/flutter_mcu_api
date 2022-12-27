class SeriesSummary {
  final String? resourceUri;
  final String? name;

  SeriesSummary({this.resourceUri, this.name});

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
