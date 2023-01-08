import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mcu_api/flutter_mcu_api.dart';

/// Handles the REST API
///
/// Requires the private and public keys (https://developer.marvel.com/documentation/getting_started)
class McuApi {
  /// Public API Key
  final String publicApiKey;

  /// Private API Key
  final String privateApiKey;

  /// Optional Dio HTTP Client
  Dio? httpClient;
  final String _baseUrl = 'https://gateway.marvel.com:443/v1/public';

  /// The [publicApiKey] and [privateApiKey] of the MCU API are required.
  /// The DIO client adds the required apikey, ts (timestamp) and hash through an
  /// interceptor so that the data can be retrieved.
  /// see: https://developer.marvel.com/documentation/authorization
  McuApi(
      {required this.publicApiKey,
      required this.privateApiKey,
      this.httpClient}) {
    BaseOptions dioOptions = BaseOptions(baseUrl: _baseUrl);
    httpClient ??= Dio(dioOptions);
    httpClient?.interceptors.add(
      _DioMcuApiInterceptor(
          publicApiKey: publicApiKey, privateApiKey: privateApiKey),
    );
  }

  /// Get the API Character Endpoint
  CharacterEndpoint get characters => CharacterEndpoint(httpClient!);

  /// Get the API Comic Endpoint
  ComicEndpoint get comics => ComicEndpoint(httpClient!);

  /// Get the API Creators Endpoint
  CreatorEndpoint get creators => CreatorEndpoint(httpClient!);

  /// Get the API Events Endpoint
  EventEndpoint get events => EventEndpoint(httpClient!);

  /// Get the API Series Endpoint
  SeriesEndpoint get series => SeriesEndpoint(httpClient!);

  /// Get the API Stories Endpoint
  StoriesEndpoint get stories => StoriesEndpoint(httpClient!);
}

class _DioMcuApiInterceptor extends Interceptor {
  final String publicApiKey;
  final String privateApiKey;
  final Map<String, dynamic> _queryParameters = {
    'ts': '',
    'apikey': '',
    'hash': ''
  };

  _DioMcuApiInterceptor({
    required this.publicApiKey,
    required this.privateApiKey,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = _calculateHash(timestamp);

    _queryParameters['ts'] = timestamp;
    _queryParameters['apikey'] = publicApiKey;
    _queryParameters['hash'] = hash;

    _queryParameters.forEach((key, value) {
      options.queryParameters[key] = value;
    });

    return super.onRequest(options, handler);
  }

  String _calculateHash(int timestamp) {
    return md5
        .convert(utf8.encode('$timestamp$privateApiKey$publicApiKey'))
        .toString();
  }
}
