import '../models.dart' show Comic;
import 'data_container.dart';

/// Represents the DataContainer for Marvel Comics
class ComicDataContainer extends DataContainer<List<Comic>?> {
  /// Default Constructor
  ComicDataContainer();

  /// Convert from JSON
  ComicDataContainer.fromJson(Map<String, dynamic> json) {
    super.offset = json['offset'];
    super.limit = json['limit'];
    super.total = json['total'];
    super.count = json['count'];
    super.results =
        List<Comic>.from(json['results'].map((model) => Comic.fromJson(model)));
  }
}
