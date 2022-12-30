import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';

import 'endpoint.dart';

/// Endpoint for the stories of the Marvel API
class StoriesEndpoint extends Endpoint<StoryDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  /// Constructor [httpClient] can be passed optionally
  StoriesEndpoint(this.httpClient)
      : super('/stories', httpClient, StoryDataContainer.fromJson);
}
