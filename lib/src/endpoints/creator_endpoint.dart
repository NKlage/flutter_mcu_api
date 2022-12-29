import 'package:dio/dio.dart';

import '../models.dart' show CreatorDataContainer;
import 'endpoint.dart';

class CreatorEndpoint extends Endpoint<CreatorDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  ///
  CreatorEndpoint(this.httpClient)
      : super('/creators', httpClient, CreatorDataContainer.fromJson);
}
