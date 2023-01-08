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

  test('get character list should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.characterList);

    dioAdapter.onGet('/characters', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CharacterDataContainer> apiResponse =
        await mcuApi.characters.fetch();

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CharacterDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Character>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get comics by characterId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.characterComicList);

    const expectedCharacterId = 1011334;

    dioAdapter.onGet('/characters/$expectedCharacterId/comics', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<ComicDataContainer> apiResponse =
        await mcuApi.characters.comics(expectedCharacterId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<ComicDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Comic>>());
    expect(apiResponse.data?.results?.length, 12);
  });

  test('get events by characterId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.characterEventList);

    const expectedCharacterId = 1011334;

    dioAdapter.onGet('/characters/$expectedCharacterId/events', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<EventDataContainer> apiResponse =
        await mcuApi.characters.events(expectedCharacterId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<EventDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Event>>());
    expect(apiResponse.data?.results?.length, 1);
  });

  test('get series by characterId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.characterSeriesList);

    const expectedCharacterId = 1011334;

    dioAdapter.onGet('/characters/$expectedCharacterId/series', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<SeriesDataContainer> apiResponse =
        await mcuApi.characters.series(expectedCharacterId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<SeriesDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Serie>>());
    expect(apiResponse.data?.results?.length, 3);
  });

  test('get stories by characterId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.characterStoriesList);

    const expectedCharacterId = 1011334;

    dioAdapter.onGet('/characters/$expectedCharacterId/stories', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<StoryDataContainer> apiResponse =
        await mcuApi.characters.stories(expectedCharacterId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<StoryDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Story>>());
    expect(apiResponse.data?.results?.length, 20);
  });
}
