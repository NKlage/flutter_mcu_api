import 'package:flutter_marvel_api/src/models/data_container.dart';

import '../models.dart' show Serie;

/// Represents the DataContainer for Marvel Series
class SeriesDataContainer extends DataContainer<List<Serie>?> {
  /// Default Constructor
  SeriesDataContainer();

  /// Convert fron JSON
  SeriesDataContainer.fromJson(Map<String, dynamic> json) {
    super.limit = json['limit'];
    super.offset = json['offset'];
    super.total = json['total'];
    super.count = json['count'];
    super.results =
        List<Serie>.from(json['results'].map((model) => Serie.fromJson(model)));
  }
}
