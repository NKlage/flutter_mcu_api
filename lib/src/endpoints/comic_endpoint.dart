import 'package:dio/dio.dart';
import 'package:flutter_mcu_api/src/endpoints/endpoint.dart';

import '../models.dart';

/// Endpoint for the comics of the API
class ComicEndpoint extends Endpoint<ComicDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  static const String _apiSegment = '/comics';

  /// Constructor
  ComicEndpoint(this.httpClient)
      : super(_apiSegment, httpClient, ComicDataContainer.fromJson);

  /// Return Character List from [comicId]
  Future<ApiResponse<CharacterDataContainer>> characters(int comicId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$comicId/characters';
    return await super.fetchGeneric<CharacterDataContainer>(
        url, CharacterDataContainer.fromJson,
        args: args);
  }

  /// Return Creator List from [comicId]
  Future<ApiResponse<CreatorDataContainer>> creators(int comicId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$comicId/creators';
    return await super.fetchGeneric<CreatorDataContainer>(
        url, CreatorDataContainer.fromJson,
        args: args);
  }

  /// Return Events List from [comicId]
  Future<ApiResponse<EventDataContainer>> events(int comicId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$comicId/events';
    return await super.fetchGeneric<EventDataContainer>(
        url, EventDataContainer.fromJson,
        args: args);
  }

  /// Return Story List from [comicId]
  Future<ApiResponse<StoryDataContainer>> stories(int comicId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$comicId/stories';
    return await super.fetchGeneric<StoryDataContainer>(
        url, StoryDataContainer.fromJson,
        args: args);
  }
}
