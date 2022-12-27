import 'package:flutter_marvel_api/src/models/event_summary.dart';
import 'package:flutter_marvel_api/src/models/summary_list.dart';

class EventList extends SummaryList<List<EventSummary>> {
  EventList.fromJson(Map<String, dynamic> json) {
    super.available = json['available'];
    super.returned = json['returned'];
    super.collectionUri = json['collectionURI'];
    super.items = List<EventSummary>.from(
        json['items'].map((model) => EventSummary.fromJson(model)));
  }
}
