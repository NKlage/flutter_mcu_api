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

  test('get event list should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.eventList);

    dioAdapter.onGet('/events', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<EventDataContainer> apiResponse =
        await marvelApi.events.fetch();

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<EventDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Event>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get characters from eventId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.eventCharacterList);

    const expectedEventId = 2707;

    dioAdapter.onGet('/events/$expectedEventId/characters', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CharacterDataContainer> apiResponse =
        await marvelApi.events.characters(expectedEventId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CharacterDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Character>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get comics from eventId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.eventComicList);

    const expectedEventId = 2707;

    dioAdapter.onGet('/events/$expectedEventId/comics', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<ComicDataContainer> apiResponse =
        await marvelApi.events.comics(expectedEventId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<ComicDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Comic>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get creators from eventId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.eventCreatorList);

    const expectedEventId = 2707;

    dioAdapter.onGet('/events/$expectedEventId/creators', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CreatorDataContainer> apiResponse =
        await marvelApi.events.creators(expectedEventId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CreatorDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Creator>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get series from eventId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.eventSeriesList);

    const expectedEventId = 2707;

    dioAdapter.onGet('/events/$expectedEventId/series', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<SeriesDataContainer> apiResponse =
        await marvelApi.events.series(expectedEventId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<SeriesDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Serie>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get stories from eventId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.eventStoriesList);

    const expectedEventId = 2707;

    dioAdapter.onGet('/events/$expectedEventId/stories', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<StoryDataContainer> apiResponse =
        await marvelApi.events.stories(expectedEventId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<StoryDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Story>>());
    expect(apiResponse.data?.results?.length, 20);
  });
}
