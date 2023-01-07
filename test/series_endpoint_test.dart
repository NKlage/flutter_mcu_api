import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';
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
  late MarvelApi marvelApi;

  setUpAll(() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dioAdapter =
        DioAdapter(dio: dio, matcher: const MarvelApiQueryParamsMatcher());
    marvelApi = MarvelApi(
        publicApiKey: 'publicApiKey',
        privateApiKey: 'privateApiKey',
        httpClient: dio);
  });

  test('get series list should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.seriesList);

    dioAdapter.onGet('/series', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<SeriesDataContainer> apiResponse =
        await marvelApi.series.fetch();

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<SeriesDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Serie>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get characters from seriesId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.seriesCharacterList);

    const expectedSeriesId = 1945;

    dioAdapter.onGet('/series/$expectedSeriesId/characters', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CharacterDataContainer> apiResponse =
        await marvelApi.series.characters(expectedSeriesId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CharacterDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Character>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get comics from seriesId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.seriesComicList);

    const expectedSeriesId = 1945;

    dioAdapter.onGet('/series/$expectedSeriesId/comics', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<ComicDataContainer> apiResponse =
        await marvelApi.series.comics(expectedSeriesId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<ComicDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Comic>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get creators from seriesId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.seriesCreatorList);

    const expectedSeriesId = 1945;

    dioAdapter.onGet('/series/$expectedSeriesId/creators', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CreatorDataContainer> apiResponse =
        await marvelApi.series.creators(expectedSeriesId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CreatorDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Creator>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get events from seriesId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.seriesEventList);

    const expectedSeriesId = 1945;

    dioAdapter.onGet('/series/$expectedSeriesId/events', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<EventDataContainer> apiResponse =
        await marvelApi.series.events(expectedSeriesId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<EventDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Event>>());
    expect(apiResponse.data?.results?.length, 5);
  });

  test('get stories from seriesId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.seriesStoryList);

    const expectedSeriesId = 1945;

    dioAdapter.onGet('/series/$expectedSeriesId/stories', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<StoryDataContainer> apiResponse =
        await marvelApi.series.stories(expectedSeriesId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<StoryDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Story>>());
    expect(apiResponse.data?.results?.length, 20);
  });
}
