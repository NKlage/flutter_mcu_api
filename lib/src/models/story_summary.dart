/// Represents a StorySummary
class StorySummary {
  /// The path to the individual story resource.
  final String? resourceUri;

  /// The canonical name of the story.
  final String? name;

  /// The type of the story (interior or cover).
  final String? type;

  /// Default Constructor
  StorySummary({this.resourceUri, this.name, this.type});

  /// Convert from JSON
  StorySummary.fromJson(Map<String, dynamic> json)
      : resourceUri = json['resourceURI'],
        name = json['name'],
        type = json['type'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StorySummary &&
          runtimeType == other.runtimeType &&
          resourceUri == other.resourceUri &&
          name == other.name &&
          type == other.type;

  @override
  int get hashCode => resourceUri.hashCode ^ name.hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'StorySummary{resourceUri: $resourceUri, name: $name, type: $type}';
  }
}
