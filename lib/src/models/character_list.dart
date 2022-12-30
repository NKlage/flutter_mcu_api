import '../models.dart' show SummaryList, CharacterSummary;

/// A resource list containing characters
class CharacterList extends SummaryList<List<CharacterSummary>> {
  /// Default Constructor
  CharacterList();

  /// Convert from JSON
  CharacterList.fromJson(Map<String, dynamic> json) {
    super.available = json['available'];
    super.returned = json['returned'];
    super.collectionUri = json['collectionURI'];
    super.items = null == json['items']
        ? null
        : List<CharacterSummary>.from(
            json['items'].map((model) => CharacterSummary.fromJson(model)));
  }
}
