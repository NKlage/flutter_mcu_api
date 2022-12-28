import 'package:flutter_marvel_api/src/models/character.dart';

import 'data_container.dart';

/// Represents the DataContainer for Marvel Characters
class CharacterDataContainer extends DataContainer<List<Character>?> {
  /// Default Constructor
  CharacterDataContainer();

  /// Convert from JSON
  CharacterDataContainer.fromJson(Map<String, dynamic> json) {
    super.limit = json['limit'];
    super.offset = json['offset'];
    super.total = json['total'];
    super.results = List<Character>.from(
        json['results'].map((model) => Character.fromJson(model)));
  }

  @override
  String toString() {
    return super.toString();
  }
}
