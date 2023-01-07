import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';

import 'endpoint.dart';

/// Endpoint for the characters of the Marvel API
class CharacterEndpoint extends Endpoint<CharacterDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  static const String _apiSegment = '/characters';

  /// Constructor [httpClient] can be passed optionally
  CharacterEndpoint(this.httpClient)
      : super(_apiSegment, httpClient, CharacterDataContainer.fromJson);

  /// Return Comic List from [characterId]
  Future<ApiResponse<ComicDataContainer>> comics(int characterId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$characterId/comics';
    return await super.fetchGeneric<ComicDataContainer>(
        url, ComicDataContainer.fromJson,
        args: args);
  }

  /// Return Event List from [characterId]
  Future<ApiResponse<EventDataContainer>> events(int characterId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$characterId/events';
    return await super.fetchGeneric<EventDataContainer>(
        url, EventDataContainer.fromJson,
        args: args);
  }

  /// Return Series List from [characterId]
  Future<ApiResponse<SeriesDataContainer>> series(int characterId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$characterId/series';
    return await super.fetchGeneric<SeriesDataContainer>(
        url, SeriesDataContainer.fromJson,
        args: args);
  }

  /// Return Story List from [characterId]
  Future<ApiResponse<StoryDataContainer>> stories(int characterId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$characterId/stories';
    return await super.fetchGeneric<StoryDataContainer>(
        url, StoryDataContainer.fromJson,
        args: args);
  }
}
