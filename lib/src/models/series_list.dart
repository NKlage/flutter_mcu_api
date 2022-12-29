import '../models.dart' show SummaryList, SeriesSummary;

/// A resource list containing series
class SeriesList extends SummaryList<List<SeriesSummary>> {
  /// Default Constructor
  SeriesList();

  /// Convert from JSON
  SeriesList.fromJson(Map<String, dynamic> json) {
    super.available = json['available'];
    super.returned = json['returned'];
    super.collectionUri = json['collectionURI'];
    super.items = List<SeriesSummary>.from(
        json['items'].map((model) => SeriesSummary.fromJson(model)));
  }
}
