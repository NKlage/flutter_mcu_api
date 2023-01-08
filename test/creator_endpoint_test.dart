import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_mcu_api/flutter_mcu_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'api_responses/api_responses.dart';
import 'helpers/marvel_api_query_params_matcher.dart';

void main() {
  const String baseUrl = 'https://unit.test';
  Map<String, dynamic> defaultApiQueryParameters = {
    'apikey': 'set by interceptor',
    'ts': 'set by interceptor',
    'hash': 'set by interceptor'
  };
  late final Dio dio;
  late final DioAdapter dioAdapter;
  late McuApi mcuApi;

  setUpAll(() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dioAdapter =
        DioAdapter(dio: dio, matcher: const McuApiQueryParamsMatcher());
    mcuApi = McuApi(
        publicApiKey: 'publicApiKey',
        privateApiKey: 'privateApiKey',
        httpClient: dio);
  });

  test('get creator list should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.creatorList);

    dioAdapter.onGet('/creators', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CreatorDataContainer> apiResponse =
        await mcuApi.creators.fetch();

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CreatorDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Creator>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get comics from creatorId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.creatorComicList);
    const expectedCreatorId = 13970;

    dioAdapter.onGet('/creators/$expectedCreatorId/comics', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<ComicDataContainer> apiResponse =
        await mcuApi.creators.comics(expectedCreatorId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<ComicDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Comic>>());
    expect(apiResponse.data?.results?.length, 4);
  });

  test('get events from creatorId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.creatorEventList);
    const expectedCreatorId = 2707;

    dioAdapter.onGet('/creators/$expectedCreatorId/events', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<EventDataContainer> apiResponse =
        await mcuApi.creators.events(expectedCreatorId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<EventDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Event>>());
    expect(apiResponse.data?.results?.length, 1);
  });

  test('get series from creatorId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.creatorSeriesList);
    const expectedCreatorId = 2707;

    dioAdapter.onGet('/creators/$expectedCreatorId/series', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<SeriesDataContainer> apiResponse =
        await mcuApi.creators.series(expectedCreatorId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<SeriesDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Serie>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get stories from creatorId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.creatorStoriesList);
    const expectedCreatorId = 2707;

    dioAdapter.onGet('/creators/$expectedCreatorId/stories', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<StoryDataContainer> apiResponse =
        await mcuApi.creators.stories(expectedCreatorId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<StoryDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Story>>());
    expect(apiResponse.data?.results?.length, 20);
  });
}
