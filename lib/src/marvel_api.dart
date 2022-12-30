import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';
import 'package:flutter_marvel_api/src/endpoints/stories_endpoint.dart';

/// Handles the Marvel REST API
///
/// Requires the Marvel private and public keys (https://developer.marvel.com/documentation/getting_started)
class MarvelApi {
  /// Public API Key
  final String publicApiKey;

  /// Private API Key
  final String privateApiKey;

  /// Optional Dio HTTP Client
  Dio? httpClient;
  final String _baseUrl = 'https://gateway.marvel.com:443/v1/public';

  /// The [publicApiKey] and [privateApiKey] of the Marvel API are required.
  /// The DIO client adds the required apikey, ts (timestamp) and hash through an
  /// interceptor so that the data can be retrieved.
  /// see: https://developer.marvel.com/documentation/authorization
  MarvelApi(
      {required this.publicApiKey,
      required this.privateApiKey,
      this.httpClient}) {
    BaseOptions dioOptions = BaseOptions(baseUrl: _baseUrl);
    httpClient ??= Dio(dioOptions);
    httpClient?.interceptors.add(
      _DioMarvelApiInterceptor(
          publicApiKey: publicApiKey, privateApiKey: privateApiKey),
    );
  }

  /// Get the Marvel API Character Endpoint
  CharacterEndpoint get characters => CharacterEndpoint(httpClient!);

  /// Get the Marvel API Comic Endpoint
  ComicEndpoint get comics => ComicEndpoint(httpClient!);

  /// Get the Marvel API Creators Endpoint
  CreatorEndpoint get creators => CreatorEndpoint(httpClient!);

  /// Get the Marvel API Events Endpoint
  EventEndpoint get events => EventEndpoint(httpClient!);

  /// Get the Marvel API Series Endpoint
  SeriesEndpoint get series => SeriesEndpoint(httpClient!);

  /// Get the Marvel API Stories Endpoint
  StoriesEndpoint get stories => StoriesEndpoint(httpClient!);
}

class _DioMarvelApiInterceptor extends Interceptor {
  final String publicApiKey;
  final String privateApiKey;
  final Map<String, dynamic> _queryParameters = {
    'ts': '',
    'apikey': '',
    'hash': ''
  };

  _DioMarvelApiInterceptor({
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
