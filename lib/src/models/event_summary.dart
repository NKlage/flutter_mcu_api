class EventSummary {
  final String? resourceUri;
  final String? name;

  EventSummary(this.resourceUri, this.name);

  EventSummary.fromJson(Map<String, dynamic> json)
      : resourceUri = json['resourceURI'],
        name = json['name'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventSummary &&
          runtimeType == other.runtimeType &&
          resourceUri == other.resourceUri &&
          name == other.name;

  @override
  int get hashCode => resourceUri.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'EventSummary{resourceUri: $resourceUri, name: $name}';
  }
}
