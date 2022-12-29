import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';

import 'endpoint.dart';

/// Endpoint for the characters of the Marvel API
class CharacterEndpoint extends Endpoint<CharacterDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  /// Constructor [httpClient] can be passed optionally
  CharacterEndpoint(this.httpClient)
      : super('/characters', httpClient, CharacterDataContainer.fromJson);
}
