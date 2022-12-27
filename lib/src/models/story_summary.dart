class StorySummary {
  final String? resourceUri;
  final String? name;
  final String? type;

  StorySummary({this.resourceUri, this.name, this.type});

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
