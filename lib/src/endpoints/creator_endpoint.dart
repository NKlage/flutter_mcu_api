import 'package:dio/dio.dart';

import '../models.dart';
import 'endpoint.dart';

/// Endpoint for the creator of the Marvel API
class CreatorEndpoint extends Endpoint<CreatorDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  static const String _apiSegment = '/creators';

  /// Default Constructor
  CreatorEndpoint(this.httpClient)
      : super(_apiSegment, httpClient, CreatorDataContainer.fromJson);

  /// Return Comic List from [creatorId]
  Future<ApiResponse<ComicDataContainer>> comics(int creatorId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$creatorId/comics';
    return await super.fetchGeneric<ComicDataContainer>(
        url, ComicDataContainer.fromJson,
        args: args);
  }

  /// Return Event List from [creatorId]
  Future<ApiResponse<EventDataContainer>> events(int creatorId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$creatorId/events';
    return await super.fetchGeneric<EventDataContainer>(
        url, EventDataContainer.fromJson,
        args: args);
  }

  /// Return Series List from [creatorId]
  Future<ApiResponse<SeriesDataContainer>> series(int creatorId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$creatorId/series';
    return await super.fetchGeneric<SeriesDataContainer>(
        url, SeriesDataContainer.fromJson,
        args: args);
  }

  /// Return Stories List from [creatorId]
  Future<ApiResponse<StoryDataContainer>> stories(int creatorId,
      {Map<String, dynamic>? args}) async {
    final url = '$_apiSegment/$creatorId/stories';
    return await super.fetchGeneric<StoryDataContainer>(
        url, StoryDataContainer.fromJson,
        args: args);
  }
}
