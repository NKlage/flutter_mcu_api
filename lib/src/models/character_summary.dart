/// Represents a CharacterSummary
class CharacterSummary {
  /// The path to the individual character resource.
  final String? resourceUri;

  /// The full name of the character.
  final String? name;

  ///  The role of the creator in the parent entity.
  final String? role;

  /// Default Constructor
  CharacterSummary({this.resourceUri, this.name, this.role});

  /// Convert from JSON
  CharacterSummary.fromJson(Map<String, dynamic> json)
      : resourceUri = json['resourceURI'],
        name = json['name'],
        role = json['role'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterSummary &&
          runtimeType == other.runtimeType &&
          resourceUri == other.resourceUri &&
          name == other.name &&
          role == other.role;

  @override
  int get hashCode => resourceUri.hashCode ^ name.hashCode ^ role.hashCode;

  @override
  String toString() {
    return 'CharacterSummary{resourceUri: $resourceUri, name: $name, role: $role}';
  }
}
