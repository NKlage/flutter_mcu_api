class Image {
  String? path;
  String? extension;

  Image({this.path, this.extension});

  Image.fromJson(Map<String, dynamic> json)
      : path = json['path'],
        extension = json['extension'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Image &&
          runtimeType == other.runtimeType &&
          path == other.path &&
          extension == other.extension;

  @override
  int get hashCode => path.hashCode ^ extension.hashCode;

  @override
  String toString() {
    return 'Image{path: $path, extension: $extension}';
  }
}
