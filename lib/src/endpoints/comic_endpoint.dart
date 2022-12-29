import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../models.dart';

/// Endpoint for the comics of the Marvel API
class ComicEndpoint {
  /// URL segment for the comics
  final String _apiSegment = '/comics';

  /// DIO HttpClient
  final Dio httpClient;

  /// Constructor
  ComicEndpoint(this.httpClient);

  /// Fetches a list of comics or a single character if the optional [id] is specified.
  /// [args] are optional and are added to the HTTP request as queryParamters
  /// See: https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
  Future<ApiResponse<ComicDataContainer>> fetch(
      {int? id, Map<String, dynamic>? args}) async {
    try {
      String url = _apiSegment;

      if (null != id) {
        url = '$_apiSegment/$id';
      }

      final response = await httpClient.get(url, queryParameters: args);

      if (HttpStatus.ok == response.statusCode && null != response.data) {
        Map<String, dynamic> result;
        if (response.data is String) {
          result = jsonDecode(response.data!);
        } else {
          result = response.data;
        }

        ApiResponse<ComicDataContainer> apiResponse = ApiResponse(
          status: result['status'],
          code: result['code'],
          attributionText: result['attributionText'],
          attributionHTML: result['attributionHTML'],
          copyright: result['copyright'],
          data: ComicDataContainer.fromJson(result['data']),
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
