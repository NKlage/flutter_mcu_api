import 'package:dio/dio.dart';

import '../models.dart' show CreatorDataContainer;
import 'endpoint.dart';

/// Endpoint for the creator of the Marvel API
class CreatorEndpoint extends Endpoint<CreatorDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  /// Default Constructor
  CreatorEndpoint(this.httpClient)
      : super('/creators', httpClient, CreatorDataContainer.fromJson);
}
