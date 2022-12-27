class Url {
  final String? type;
  final String? url;

  Url({this.type, this.url});

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
