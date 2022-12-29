import 'dart:convert';

import 'package:flutter_marvel_api/src/models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api_responses/api_responses.dart';

void main() {
  test('should convert series response', () async {
    final creatorResponseBody =
        await ApiResponses.jsonResponse(ApiResponses.seriesList);
    final Map<String, dynamic> result = jsonDecode(creatorResponseBody);
    const seriesIdToTest = 31445;

    expect(result.containsKey('data'), true);

    final SeriesDataContainer seriesDataContainer =
        SeriesDataContainer.fromJson(result['data']);

    final List<Serie> seriesList = seriesDataContainer.results!;
    final seriesCreator =
        seriesList.firstWhere((creator) => creator.id == seriesIdToTest);

    expect(seriesCreator.id, seriesIdToTest);
    expect(seriesCreator.title, ' Fantastic Four by Dan Slott Vol. 1 (2021)');
    expect(seriesCreator.description, null);
    expect(seriesCreator.resourceUri,
        'http://gateway.marvel.com/v1/public/series/31445');
    expect(seriesCreator.urls, _ExpectedSeriesObjects.expectedUrls);
    expect(seriesCreator.startYear, 2021);
    expect(seriesCreator.endYear, 2021);
    expect(seriesCreator.rating, '');
    expect(seriesCreator.type, 'collection');
    expect(
        seriesCreator.modified, DateTime.tryParse('2020-07-29T09:04:18-0400'));
    expect(seriesCreator.thumbnail, _ExpectedSeriesObjects.expectedImage);
    expect(seriesCreator.comics, _ExpectedSeriesObjects.expectedComics);
    expect(seriesCreator.stories, _ExpectedSeriesObjects.expectedStories);
    expect(seriesCreator.events, _ExpectedSeriesObjects.expectedEvents);
    expect(seriesCreator.characters, _ExpectedSeriesObjects.expectedCharacters);
    expect(seriesCreator.creators, _ExpectedSeriesObjects.expectedCreators);
    expect(seriesCreator.next, null);
    expect(seriesCreator.previous, null);
  });
}

class _ExpectedSeriesObjects {
  static List<Url> get expectedUrls => [
        Url(
            type: 'detail',
            url:
                'http://marvel.com/comics/series/31445/_fantastic_four_by_dan_slott_vol_1_2021?utm_campaign=apiRef&utm_source=cc2caa9cfdaabd58ebf54e6c07e7fa0a'),
      ];

  static Image get expectedImage => Image(
      path: 'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available',
      extension: 'jpg');

  static StoryList get expectedStories {
    List<StorySummary> items = [
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/205070',
          name: 'cover from FANTASTIC FOUR BY DAN SLOTT VOL. 1 HC (2021) #1',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/205071',
          name: 'story from FANTASTIC FOUR BY DAN SLOTT VOL. 1 HC (2021) #1',
          type: 'interiorStory'),
    ];
    return StoryList()
      ..available = 2
      ..returned = 2
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/series/31445/stories'
      ..items = items;
  }

  static ComicList get expectedComics {
    List<ComicSummary> items = [
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/91992',
          name: ' Fantastic Four by Dan Slott Vol. 1 (Hardcover)')
    ];
    return ComicList()
      ..available = 1
      ..returned = 1
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/series/31445/comics'
      ..items = items;
  }

  static EventList get expectedEvents {
    return EventList()
      ..available = 0
      ..returned = 0
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/series/31445/events'
      ..items = [];
  }

  static CharacterList get expectedCharacters {
    return CharacterList()
      ..available = 0
      ..returned = 0
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/series/31445/characters'
      ..items = [];
  }

  static CreatorList get expectedCreators {
    List<CreatorSummary> items = [
      CreatorSummary(
          name: 'Jeff Youngquist',
          role: 'editor',
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/4430'),
    ];
    return CreatorList()
      ..available = 1
      ..returned = 1
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/series/31445/creators'
      ..items = items;
  }
}
