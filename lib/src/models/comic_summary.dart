class ComicSummary {
  final String? resourceUri;
  final String? name;

  ComicSummary({this.resourceUri, this.name});

  ComicSummary.fromJson(Map<String, dynamic> json)
      : resourceUri = json['resourceURI'],
        name = json['name'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComicSummary &&
          runtimeType == other.runtimeType &&
          resourceUri == other.resourceUri &&
          name == other.name;

  @override
  int get hashCode => resourceUri.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'ComicSummary{resourceUri: $resourceUri, name: $name}';
  }
}
