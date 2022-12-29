import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../models.dart';
import '../models/data_container.dart';

/// Generic Endpoint
abstract class Endpoint<T extends DataContainer> {
  /// API Segment e.g. /comics, /characters
  final String _apiSegment;

  /// HTTP Client
  final Dio _httpClient;

  /// Convert from JSON
  Function fromJson;

  /// Constructor
  Endpoint(this._apiSegment, this._httpClient, this.fromJson);

  /// Fetches a list of resources or a single resource if the optional [id] is specified.
  /// [args] are optional and are added to the HTTP request as queryParamters
  /// See: https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
  Future<ApiResponse<T>> fetch({int? id, Map<String, dynamic>? args}) async {
    try {
      String url = _apiSegment;

      if (null != id) {
        url = '$_apiSegment/$id';
      }

      final response = await _httpClient.get(url, queryParameters: args);

      if (HttpStatus.ok == response.statusCode && null != response.data) {
        Map<String, dynamic> result;
        if (response.data is String) {
          result = jsonDecode(response.data!);
        } else {
          result = response.data;
        }

        ApiResponse<T> apiResponse = ApiResponse(
          status: result['status'],
          code: result['code'],
          attributionText: result['attributionText'],
          attributionHTML: result['attributionHTML'],
          copyright: result['copyright'],
          data: fromJson(result['data']),
          etag: result['etag'],
        );
        return apiResponse;
      }

      return ApiResponse(
        code: response.statusCode,
        status: response.statusMessage,
      );
    } on DioError catch (dioError) {
      return ApiResponse(
        code: dioError.response?.statusCode,
        status:
            '${dioError.response?.statusMessage} ${dioError.response?.data['status']}',
      );
    } catch (e) {
      return ApiResponse(status: e.toString());
    }
  }
}
