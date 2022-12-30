/// Represents a Image
class ImageSummary {
  /// The directory path of to the image.
  String? path;

  /// The file extension for the image.
  String? extension;

  /// Default Constructor
  ImageSummary({this.path, this.extension});

  /// Convert from JSON
  ImageSummary.fromJson(Map<String, dynamic> json)
      : path = json['path'],
        extension = json['extension'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageSummary &&
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
