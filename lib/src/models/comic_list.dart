import '../models.dart' show SummaryList, ComicSummary;

/// A resource list containing comics
class ComicList extends SummaryList<List<ComicSummary>> {
  /// Default Constructor
  ComicList();

  /// Convert from JSON
  ComicList.fromJson(Map<String, dynamic> json) {
    super.available = json['available'];
    super.returned = json['returned'];
    super.collectionUri = json['collectionURI'];
    super.items = List<ComicSummary>.from(
        json['items'].map((model) => ComicSummary.fromJson(model)));
  }
}
