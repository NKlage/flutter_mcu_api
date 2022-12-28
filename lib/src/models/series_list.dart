import 'package:flutter_marvel_api/src/models/series_summary.dart';
import 'package:flutter_marvel_api/src/models/summary_list.dart';

class SeriesList extends SummaryList<List<SeriesSummary>> {
  SeriesList();

  SeriesList.fromJson(Map<String, dynamic> json) {
    super.available = json['available'];
    super.returned = json['returned'];
    super.collectionUri = json['collectionURI'];
    super.items = List<SeriesSummary>.from(
        json['items'].map((model) => SeriesSummary.fromJson(model)));
  }
}
