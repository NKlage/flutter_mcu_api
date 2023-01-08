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

  test('get comic list should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.comicList);

    dioAdapter.onGet('/comics', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<ComicDataContainer> apiResponse =
        await mcuApi.comics.fetch();

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<ComicDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Comic>>());
    expect(apiResponse.data?.results?.length, 20);
  });

  test('get characters from comicId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.comicCharacterList);

    const expectedComicId = 1308;

    dioAdapter.onGet('/comics/$expectedComicId/characters', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CharacterDataContainer> apiResponse =
        await mcuApi.comics.characters(expectedComicId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CharacterDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Character>>());
    expect(apiResponse.data?.results?.length, 1);
  });

  test('get creators from comicId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.comicCreatorList);

    const expectedComicId = 1308;

    dioAdapter.onGet('/comics/$expectedComicId/creators', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<CreatorDataContainer> apiResponse =
        await mcuApi.comics.creators(expectedComicId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<CreatorDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Creator>>());
    expect(apiResponse.data?.results?.length, 10);
  });

  test('get events from comicId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.comicEventList);

    const expectedComicId = 12744;

    dioAdapter.onGet('/comics/$expectedComicId/events', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<EventDataContainer> apiResponse =
        await mcuApi.comics.events(expectedComicId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<EventDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Event>>());
    expect(apiResponse.data?.results?.length, 1);
  });

  test('get stories from comicId should return 200', () async {
    final expectedResponse =
        await ApiResponses.jsonResponse(ApiResponses.comicStoryList);

    const expectedComicId = 12744;

    dioAdapter.onGet('/comics/$expectedComicId/stories', (server) {
      server.reply(HttpStatus.ok, expectedResponse);
    }, queryParameters: defaultApiQueryParameters);

    final ApiResponse<StoryDataContainer> apiResponse =
        await mcuApi.comics.stories(expectedComicId);

    expect(apiResponse.code, HttpStatus.ok);
    expect(apiResponse.status, 'Ok');
    expect(apiResponse.data, isNotNull);
    expect(apiResponse.data, isA<StoryDataContainer>());
    expect(apiResponse.data?.results, isNotNull);
    expect(apiResponse.data?.results, isA<List<Story>>());
    expect(apiResponse.data?.results?.length, 2);
  });
}
