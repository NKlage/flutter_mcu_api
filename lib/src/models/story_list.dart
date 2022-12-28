import '../../flutter_marvel_api.dart';
import 'summary_list.dart';

/// A resource list containing stories
class StoryList extends SummaryList<List<StorySummary>> {
  /// Default Constructor
  StoryList();

  /// Convert from JSON
  StoryList.fromJson(Map<String, dynamic> json) {
    super.available = json['available'];
    super.returned = json['returned'];
    super.collectionUri = json['collectionURI'];
    super.items = List<StorySummary>.from(
        json['items'].map((model) => StorySummary.fromJson(model)));
  }
}
