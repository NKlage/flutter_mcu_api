import 'package:flutter_marvel_api/src/models/character.dart';

import 'data_container.dart';

class CharacterDataContainer extends DataContainer<List<Character>?> {
  CharacterDataContainer();

  CharacterDataContainer.fromJson(Map<String, dynamic> json) {
    super.limit = json['limit'];
    super.offset = json['offset'];
    super.total = json['total'];
    super.results = List<Character>.from(
        json['results'].map((model) => Character.fromJson(model)));
  }
}
