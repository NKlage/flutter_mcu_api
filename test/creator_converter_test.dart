import 'dart:convert';

import 'package:flutter_marvel_api/src/models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api_responses/api_responses.dart';

void main() {
  test('should convert creator response', () async {
    final creatorResponseBody =
        await ApiResponses.jsonResponse(ApiResponses.creatorList);
    final Map<String, dynamic> result = jsonDecode(creatorResponseBody);
    const creatorIdToTest = 13970;

    expect(result.containsKey('data'), true);

    final CreatorDataContainer creatorDataContainer =
        CreatorDataContainer.fromJson(result['data']);

    final List<Creator> creatorList = creatorDataContainer.results!;
    final firstCreator =
        creatorList.firstWhere((creator) => creator.id == creatorIdToTest);

    expect(firstCreator.id, creatorIdToTest);
    expect(firstCreator.firstName, 'firstname');
    expect(firstCreator.middleName, 'middlename');
    expect(firstCreator.lastName, 'lastname');
    expect(firstCreator.suffix, 'suffix');
    expect(firstCreator.fullName, '#O');
    expect(
        firstCreator.modified, DateTime.tryParse('2019-12-11T17:10:07-0500'));
    expect(firstCreator.resourceUri,
        'http://gateway.marvel.com/v1/public/creators/13970');

    expect(firstCreator.urls, _ExpectedCreatorObjects.expectedUrls);
    expect(firstCreator.thumbnail, _ExpectedCreatorObjects.expectedImage);
    expect(firstCreator.series, _ExpectedCreatorObjects.expectedSeries);
    expect(firstCreator.stories, _ExpectedCreatorObjects.expectedStories);
    expect(firstCreator.comics, _ExpectedCreatorObjects.expectedComics);
    expect(firstCreator.events, _ExpectedCreatorObjects.expectedEvents);
  });
}

class _ExpectedCreatorObjects {
  static List<Url> get expectedUrls => [
        Url(
            type: 'detail',
            url:
                'http://marvel.com/comics/creators/13970/o?utm_campaign=apiRef&utm_source=cc2caa9cfdaabd58ebf54e6c07e7fa0a')
      ];

  static Image get expectedImage => Image(
      path: 'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available',
      extension: 'jpg');

  static SeriesList get expectedSeries {
    List<SeriesSummary> items = [
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/378',
          name: 'Earth X (1999 - 2000)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2059',
          name: 'Paradise X (2002 - 2003)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2431',
          name: 'Paradise X Vol. 1 (2007)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2085',
          name: 'Universe X (2000 - 2001)'),
    ];
    return SeriesList()
      ..available = 4
      ..returned = 4
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/creators/13970/series'
      ..items = items;
  }

  static StoryList get expectedStories {
    List<StorySummary> items = [
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/25655',
          name: 'interior',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/26016',
          name: 'Paradise X Issue 0',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/26318',
          name: 'interior Earth X #O',
          type: 'interiorStory'),
    ];
    return StoryList()
      ..available = 3
      ..returned = 3
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/creators/13970/stories'
      ..items = items;
  }

  static ComicList get expectedComics {
    List<ComicSummary> items = [
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/8546',
          name: 'Earth X (1999)'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/10492',
          name: 'Paradise X (2002)'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/15902',
          name: 'Paradise X Vol. 1 (Trade Paperback)'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/11914',
          name: 'Universe X (2000)'),
    ];
    return ComicList()
      ..available = 4
      ..returned = 4
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/creators/13970/comics'
      ..items = items;
  }

  static EventList get expectedEvents {
    return EventList()
      ..available = 0
      ..returned = 0
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/creators/13970/events'
      ..items = [];
  }
}
