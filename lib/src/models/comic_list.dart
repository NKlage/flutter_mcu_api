import 'comic_summary.dart';
import 'summary_list.dart';

class ComicList extends SummaryList<List<ComicSummary>> {
  ComicList();
  ComicList.fromJson(Map<String, dynamic> json) {
    super.available = json['available'];
    super.returned = json['returned'];
    super.collectionUri = json['collectionURI'];
    super.items = List<ComicSummary>.from(
        json['items'].map((model) => ComicSummary.fromJson(model)));
  }
}
