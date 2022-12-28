/// Represents a ComicSummary
class ComicSummary {
  /// The path to the individual comic resource.
  final String? resourceUri;

  /// The canonical name of the comic
  final String? name;

  /// Default Constructor
  ComicSummary({this.resourceUri, this.name});

  /// Convert from JSON
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
