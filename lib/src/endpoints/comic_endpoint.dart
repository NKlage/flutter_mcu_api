import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/src/endpoints/endpoint.dart';

import '../models.dart';

/// Endpoint for the comics of the Marvel API
class ComicEndpoint extends Endpoint<ComicDataContainer> {
  /// URL segment for the comics
  final String apiSegment = '/comics';

  /// DIO HttpClient
  final Dio httpClient;

  /// Constructor
  ComicEndpoint(this.httpClient)
      : super('/comics', httpClient, ComicDataContainer.fromJson);
}
