import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/src/endpoints/endpoint.dart';

import '../models.dart';

/// Endpoint for the comics of the Marvel API
class SeriesEndpoint extends Endpoint<SeriesDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;
  static const String _apiSegment = '/series';

  /// Constructor
  SeriesEndpoint(this.httpClient)
      : super(_apiSegment, httpClient, SeriesDataContainer.fromJson);

  /// Return Character List from [seriesId]
  Future<ApiResponse<CharacterDataContainer>> characters(int seriesId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$seriesId/characters';
    return await super.fetchGeneric<CharacterDataContainer>(
        url, CharacterDataContainer.fromJson,
        args: args);
  }

  /// Return Comic List from [seriesId]
  Future<ApiResponse<ComicDataContainer>> comics(int seriesId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$seriesId/comics';
    return await super.fetchGeneric<ComicDataContainer>(
        url, ComicDataContainer.fromJson,
        args: args);
  }

  /// Return Creator List from [seriesId]
  Future<ApiResponse<CreatorDataContainer>> creators(int seriesId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$seriesId/creators';
    return await super.fetchGeneric<CreatorDataContainer>(
        url, CreatorDataContainer.fromJson,
        args: args);
  }

  /// Return Event List from [seriesId]
  Future<ApiResponse<EventDataContainer>> events(int seriesId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$seriesId/events';
    return await super.fetchGeneric<EventDataContainer>(
        url, EventDataContainer.fromJson,
        args: args);
  }

  /// Return Story List from [seriesId]
  Future<ApiResponse<StoryDataContainer>> stories(int seriesId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$seriesId/stories';
    return await super.fetchGeneric<StoryDataContainer>(
        url, StoryDataContainer.fromJson,
        args: args);
  }
}
