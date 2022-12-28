/// Represents Website URL's
class Url {
  /// A text identifier for the URL.
  final String? type;

  /// A full URL (including scheme, domain, and path).
  final String? url;

  /// Default Constructor
  Url({this.type, this.url});

  /// Convert from JSON
  Url.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        url = json['url'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Url &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          url == other.url;

  @override
  int get hashCode => type.hashCode ^ url.hashCode;

  @override
  String toString() {
    return 'Url{type: $type, url: $url}';
  }
}
