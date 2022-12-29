import 'package:dio/dio.dart';

import '../models.dart';
import 'endpoint.dart';

/// Endpoint for the event of the Marvel API
class EventEndpoint extends Endpoint<EventDataContainer> {
  /// DIO HttpClient
  final Dio httpClient;

  /// Default Constructor
  EventEndpoint(this.httpClient)
      : super('/events', httpClient, EventDataContainer.fromJson);
}
