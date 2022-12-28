/// Represents a EventSummary
class EventSummary {
  /// The path to the individual event resource.
  final String? resourceUri;

  /// The name of the event.
  final String? name;

  /// Default Constructor
  EventSummary({this.resourceUri, this.name});

  /// Convert from JSON
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
