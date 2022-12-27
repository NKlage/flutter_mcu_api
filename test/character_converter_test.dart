import 'dart:convert';

import 'package:flutter_marvel_api/flutter_marvel_api.dart';
import 'package:flutter_marvel_api/src/models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api_responses/api_responses.dart';

void main() {
  test('should convert character response', () async {
    final response =
        await ApiResponses.jsonResponse(ApiResponses.characterList);

    final result = jsonDecode(response);

    ApiResponse<CharacterDataContainer> characterResponse = ApiResponse(
        code: result['code'],
        status: result['status'],
        copyright: result['copyright'],
        attributionText: result['attributionText'],
        attributionHTML: result['attributionHTML'],
        data: CharacterDataContainer.fromJson(result['data']),
        etag: result['etag']);

    expect(response.isNotEmpty, true);
  });
}
