import '../models.dart' show Story;
import 'data_container.dart';

/// Represents the DataContainer for Marvel Stories
class StoryDataContainer extends DataContainer<List<Story>> {
  /// Default Constructor
  StoryDataContainer();

  /// Convert fron JSON
  StoryDataContainer.fromJson(Map<String, dynamic> json) {
    super.limit = json['limit'];
    super.offset = json['offset'];
    super.total = json['total'];
    super.count = json['count'];
    super.results = null == json['results']
        ? null
        : List<Story>.from(
            json['results'].map((model) => Story.fromJson(model)));
  }
}
