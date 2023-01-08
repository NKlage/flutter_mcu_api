import 'package:dio/dio.dart';
import 'package:flutter_mcu_api/flutter_mcu_api.dart';

import 'endpoint.dart';

/// Endpoint for the stories of the Marvel API
class StoriesEndpoint extends Endpoint<StoryDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;
  static const String _apiSegment = '/stories';

  /// Constructor [httpClient] can be passed optionally
  StoriesEndpoint(this.httpClient)
      : super(_apiSegment, httpClient, StoryDataContainer.fromJson);

  /// Return Character List from [storyId]
  Future<ApiResponse<CharacterDataContainer>> characters(int storyId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$storyId/characters';
    return await super.fetchGeneric<CharacterDataContainer>(
        url, CharacterDataContainer.fromJson,
        args: args);
  }

  /// Return Comic List from [storyId]
  Future<ApiResponse<ComicDataContainer>> comics(int storyId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$storyId/comics';
    return await super.fetchGeneric<ComicDataContainer>(
        url, ComicDataContainer.fromJson,
        args: args);
  }

  /// Return Creator List from [storyId]
  Future<ApiResponse<CreatorDataContainer>> creators(int storyId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$storyId/creators';
    return await super.fetchGeneric<CreatorDataContainer>(
        url, CreatorDataContainer.fromJson,
        args: args);
  }

  /// Return Event List from [storyId]
  Future<ApiResponse<EventDataContainer>> events(int storyId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$storyId/events';
    return await super.fetchGeneric<EventDataContainer>(
        url, EventDataContainer.fromJson,
        args: args);
  }

  /// Return Series List from [storyId]
  Future<ApiResponse<SeriesDataContainer>> series(int storyId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$storyId/series';
    return await super.fetchGeneric<SeriesDataContainer>(
        url, SeriesDataContainer.fromJson,
        args: args);
  }
}
