import 'package:dio/dio.dart';

import '../models.dart';
import 'endpoint.dart';

/// Endpoint for the event of the API
class EventEndpoint extends Endpoint<EventDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  static const String _apiSegment = '/events';

  /// Default Constructor
  EventEndpoint(this.httpClient)
      : super(_apiSegment, httpClient, EventDataContainer.fromJson);

  /// Return Character List from [eventId]
  Future<ApiResponse<CharacterDataContainer>> characters(int eventId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$eventId/characters';
    return await super.fetchGeneric<CharacterDataContainer>(
        url, CharacterDataContainer.fromJson,
        args: args);
  }

  /// Return Comic List from [eventId]
  Future<ApiResponse<ComicDataContainer>> comics(int eventId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$eventId/comics';
    return await super.fetchGeneric<ComicDataContainer>(
        url, ComicDataContainer.fromJson,
        args: args);
  }

  /// Return Creator List from [eventId]
  Future<ApiResponse<CreatorDataContainer>> creators(int eventId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$eventId/creators';
    return await super.fetchGeneric<CreatorDataContainer>(
        url, CreatorDataContainer.fromJson,
        args: args);
  }

  /// Return Series List from [eventId]
  Future<ApiResponse<SeriesDataContainer>> series(int eventId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$eventId/series';
    return await super.fetchGeneric<SeriesDataContainer>(
        url, SeriesDataContainer.fromJson,
        args: args);
  }

  /// Return Story List from [eventId]
  Future<ApiResponse<StoryDataContainer>> stories(int eventId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$eventId/stories';
    return await super.fetchGeneric<StoryDataContainer>(
        url, StoryDataContainer.fromJson,
        args: args);
  }
}
