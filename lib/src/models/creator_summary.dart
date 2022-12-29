/// Represents a Creator Summary
class CreatorSummary {
  /// The path to the individual creator resource.
  final String? resourceUri;

  /// The full name of the creator.
  final String? name;

  /// The role of the creator in the parent entity.
  final String? role;

  /// Default Constructor
  CreatorSummary({this.resourceUri, this.name, this.role});

  /// Convert from JSON
  CreatorSummary.fromJson(Map<String, dynamic> json)
      : resourceUri = json['resourceURI'],
        name = json['name'],
        role = json['role'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatorSummary &&
          runtimeType == other.runtimeType &&
          resourceUri == other.resourceUri &&
          name == other.name &&
          role == other.role;

  @override
  int get hashCode => resourceUri.hashCode ^ name.hashCode ^ role.hashCode;

  @override
  String toString() {
    return 'CreatorSummary{resourceUri: $resourceUri, name: $name, role: $role}';
  }
}
