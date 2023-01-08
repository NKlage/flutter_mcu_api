import '../models.dart' show Event;
import 'data_container.dart';

/// Represents the DataContainer for Events
class EventDataContainer extends DataContainer<List<Event>?> {
  /// Default Constructor
  EventDataContainer();

  /// Convert from JSON
  EventDataContainer.fromJson(Map<String, dynamic> json) {
    super.limit = json['limit'];
    super.offset = json['offset'];
    super.total = json['total'];
    super.count = json['count'];
    super.results = null == json['results']
        ? null
        : List<Event>.from(
            json['results'].map((model) => Event.fromJson(model)));
  }
}
