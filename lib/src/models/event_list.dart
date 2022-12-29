import '../models.dart' show SummaryList, EventSummary;

/// A resource list containing events
class EventList extends SummaryList<List<EventSummary>> {
  /// Default Constructor
  EventList();

  /// Convert from JSON
  EventList.fromJson(Map<String, dynamic> json) {
    super.available = json['available'];
    super.returned = json['returned'];
    super.collectionUri = json['collectionURI'];
    super.items = List<EventSummary>.from(
        json['items'].map((model) => EventSummary.fromJson(model)));
  }
}
