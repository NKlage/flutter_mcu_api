import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/src/endpoints/endpoint.dart';

import '../models.dart';

/// Endpoint for the comics of the Marvel API
class SeriesEndpoint extends Endpoint<SeriesDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  /// Constructor
  SeriesEndpoint(this.httpClient)
      : super('/series', httpClient, SeriesDataContainer.fromJson);
}
