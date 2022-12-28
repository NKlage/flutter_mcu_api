import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';

class MarvelApi {
  final String publicApiKey;
  final String privateApiKey;
  Dio? httpClient;
  final String _baseUrl = 'https://gateway.marvel.com:443/v1/public';

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

  CharacterEndpoint get character => CharacterEndpoint(httpClient!);
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
