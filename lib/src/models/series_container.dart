import '../models.dart' show Serie;
import 'data_container.dart';

/// Represents the DataContainer for Series
class SeriesDataContainer extends DataContainer<List<Serie>?> {
  /// Default Constructor
  SeriesDataContainer();

  /// Convert fron JSON
  SeriesDataContainer.fromJson(Map<String, dynamic> json) {
    super.limit = json['limit'];
    super.offset = json['offset'];
    super.total = json['total'];
    super.count = json['count'];
    super.results = null == json['results']
        ? null
        : List<Serie>.from(
            json['results'].map((model) => Serie.fromJson(model)));
  }
}
