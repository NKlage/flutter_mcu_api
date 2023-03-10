import '../models.dart' show SummaryList, CreatorSummary;

/// A resource list containing creators
class CreatorList extends SummaryList<List<CreatorSummary>> {
  /// Default Constructor
  CreatorList();

  /// Convert from JSON
  CreatorList.fromJson(Map<String, dynamic> json) {
    super.available = json['available'];
    super.returned = json['returned'];
    super.collectionUri = json['collectionURI'];
    super.items = null == json['items']
        ? null
        : List<CreatorSummary>.from(
            json['items'].map((model) => CreatorSummary.fromJson(model)));
  }
}
