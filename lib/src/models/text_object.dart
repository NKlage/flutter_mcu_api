/// A set of descriptive text blurbs
class TextObject {
  /// The canonical type of the text object (e.g. solicit text, preview text, etc.).
  final String? type;

  /// The IETF language tag denoting the language the text object is written in.
  final String? language;

  /// The text.
  final String? text;

  /// Default Constructor
  TextObject({this.type, this.language, this.text});

  /// Convert from Json
  TextObject.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        language = json['language'],
        text = json['text'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextObject &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          language == other.language &&
          text == other.text;

  @override
  int get hashCode => type.hashCode ^ language.hashCode ^ text.hashCode;

  @override
  String toString() {
    return 'TextObject{type: $type, language: $language, text: $text}';
  }
}
