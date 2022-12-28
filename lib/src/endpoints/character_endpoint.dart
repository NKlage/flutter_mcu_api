import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';

class CharacterEndpoint {
  final String _apiSegment = '/characters';
  final Dio httpClient;

  CharacterEndpoint(this.httpClient);

  Future<ApiResponse<CharacterDataContainer>> fetch(
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

        ApiResponse<CharacterDataContainer> apiResponse = ApiResponse(
          status: result['status'],
          code: result['code'],
          attributionText: result['attributionText'],
          attributionHTML: result['attributionHTML'],
          copyright: result['copyright'],
          data: CharacterDataContainer.fromJson(result['data']),
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
