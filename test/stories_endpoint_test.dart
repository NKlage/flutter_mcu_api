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

  test('get series list should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.storiesList);

    dioAdapter.onGet('/stories', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<StoryDataContainer> apiResponse =
        await mcuApi.stories.fetch();

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<StoryDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Story>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get characters from storyId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.storiesCharacterList);

    const expectedStoryId = 236;

    dioAdapter.onGet('/stories/$expectedStoryId/characters', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CharacterDataContainer> apiResponse =
        await mcuApi.stories.characters(expectedStoryId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CharacterDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Character>>());
    expect(apiResponse.data?.results?.length, 1);
  });

  test('get comics from storyId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.storiesComicList);

    const expectedStoryId = 236;

    dioAdapter.onGet('/stories/$expectedStoryId/comics', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<ComicDataContainer> apiResponse =
        await mcuApi.stories.comics(expectedStoryId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<ComicDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Comic>>());
    expect(apiResponse.data?.results?.length, 1);
  });

  test('get creators from storyId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.storiesCreatorList);

    const expectedStoryId = 236;

    dioAdapter.onGet('/stories/$expectedStoryId/creators', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CreatorDataContainer> apiResponse =
        await mcuApi.stories.creators(expectedStoryId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CreatorDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Creator>>());
    expect(apiResponse.data?.results?.length, 2);
  });

  test('get events from storyId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.storiesEventList);

    const expectedStoryId = 563;

    dioAdapter.onGet('/stories/$expectedStoryId/events', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<EventDataContainer> apiResponse =
        await mcuApi.stories.events(expectedStoryId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<EventDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Event>>());
    expect(apiResponse.data?.results?.length, 1);
  });

  test('get series from storyId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.storiesSeriesList);

    const expectedStoryId = 563;

    dioAdapter.onGet('/stories/$expectedStoryId/series', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<SeriesDataContainer> apiResponse =
        await mcuApi.stories.series(expectedStoryId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<SeriesDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Serie>>());
    expect(apiResponse.data?.results?.length, 2);
  });
}
