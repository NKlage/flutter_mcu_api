import 'package:flutter_marvel_api/src/models/data_container.dart';

import '../models.dart' show Creator;

/// Represents the DataContainer for Marvel Creators
class CreatorDataContainer extends DataContainer<List<Creator>> {
  /// Default Constructor
  CreatorDataContainer();

  /// Convert from JSON
  CreatorDataContainer.fromJson(Map<String, dynamic> json) {
    super.limit = json['limit'];
    super.offset = json['offset'];
    super.total = json['total'];
    super.count = json['count'];
    super.results = null == json['results']
        ? null
        : List<Creator>.from(
            json['results'].map((model) => Creator.fromJson(model)));
  }
}
