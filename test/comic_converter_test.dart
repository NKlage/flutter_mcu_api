import 'dart:convert';

import 'package:flutter_marvel_api/flutter_marvel_api.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api_responses/api_responses.dart';

void main() {
  test('should convert comic response', () async {
    final comicResponseBody =
        await ApiResponses.jsonResponse(ApiResponses.comicList);
    final Map<String, dynamic> result = jsonDecode(comicResponseBody);

    const int comicIdToTest = 82967;

    expect(result.containsKey('data'), true);

    ComicDataContainer comicDataContainer =
        ComicDataContainer.fromJson(result['data']);

    final firstComic = comicDataContainer.results!
        .firstWhere((comic) => comic.id == comicIdToTest);

    expect(firstComic.id, comicIdToTest);
    expect(firstComic.digitalId, 0);
    expect(firstComic.title, 'Marvel Previews (2017)');
    expect(firstComic.issueNumber, 0);
    expect(firstComic.variantDescription, '');
    expect(firstComic.description, '');
    expect(firstComic.modified, DateTime.parse('2019-11-07T08:46:15-0500'));
    expect(firstComic.isbn, '');
    expect(firstComic.upc, '75960608839302811');
    expect(firstComic.diamondCode, '');
    expect(firstComic.ean, '');
    expect(firstComic.issn, '');
    expect(firstComic.format, '');
    expect(firstComic.pageCount, 112);
    expect(firstComic.textObjects, _ExpectedComicObjects.expectedTextObjects);
    expect(firstComic.resourceURI,
        'http://gateway.marvel.com/v1/public/comics/82967');
    expect(firstComic.urls, _ExpectedComicObjects.expectedUrls);
    expect(firstComic.series, _ExpectedComicObjects.expectedSeries);
    expect(firstComic.variants, _ExpectedComicObjects.expectedVariants);
    expect(firstComic.collections, _ExpectedComicObjects.expectedCollections);
    expect(firstComic.collectedIssues,
        _ExpectedComicObjects.expectedCollectedIssues);
    expect(firstComic.dates, _ExpectedComicObjects.expectedDates);
    expect(firstComic.prices, _ExpectedComicObjects.expectedPrices);
    expect(firstComic.thumbnail, _ExpectedComicObjects.expectedThumbnail);
    expect(firstComic.images, _ExpectedComicObjects.expectedImages);
    expect(firstComic.creators, _ExpectedComicObjects.expectedCreators);
    expect(firstComic.characters, _ExpectedComicObjects.expectedCharacters);
    expect(firstComic.stories, _ExpectedComicObjects.expectedStories);
    expect(firstComic.events, _ExpectedComicObjects.expectedEvents);
  });
}

class _ExpectedComicObjects {
  static List<TextObject> get expectedTextObjects => [
        TextObject(
            type: 'issue_solicit_text',
            language: 'en-us',
            text:
                'Collecting the first six art books of Marvel\'s REFLECTIONS series from multiple Eisner Award-nominated creator David Mack, this gorgeous volume of cover paintings and step-by-step art techniques is being presented in oversized hardcover format to show off Mack\'s work to full effect. Readers have been waiting for an oversized art-book collection of Mack\'s work for years, and this monster volume delivers with loads of extras -- including never-before-seen art, new paintings, a cover gallery, figure studies, step-by-step art techniques and commentary, remastered pages, new design pages, a "Best of Letters" section, and more! A whopping 320 pages with extra features -- all elegantly collected in a high-end oversized hardcover with high-quality paper, embossment, and an all-new introduction and interview!\r\n320PGS./\$39.99\r\nISBN: 978-0-7851-4328-4\r\nTrim size: oversized'),
      ];

  static List<Url> get expectedUrls => [
        Url(
            type: 'detail',
            url:
                'http://marvel.com/comics/issue/82967/marvel_previews_2017?utm_campaign=apiRef&utm_source=cc2caa9cfdaabd58ebf54e6c07e7fa0a'),
      ];

  static SeriesSummary get expectedSeries => SeriesSummary(
      resourceUri: 'http://gateway.marvel.com/v1/public/series/23665',
      name: 'Marvel Previews (2017 - Present)');

  static List<ComicSummary> get expectedVariants => [
        ComicSummary(
            resourceUri: 'http://gateway.marvel.com/v1/public/comics/82965',
            name: 'Marvel Previews (2017)'),
        ComicSummary(
            resourceUri: 'http://gateway.marvel.com/v1/public/comics/82970',
            name: 'Marvel Previews (2017)'),
        ComicSummary(
            resourceUri: 'http://gateway.marvel.com/v1/public/comics/82969',
            name: 'Marvel Previews (2017)')
      ];

  static List<ComicSummary> get expectedCollections => [
        ComicSummary(
            resourceUri: 'http://gateway.marvel.com/v1/public/comics/16621',
            name:
                'ULTIMATE SPIDER-MAN VOL. 18: ULTIMATE KNIGHTS TPB (Trade Paperback)'),
      ];

  static List<ComicSummary> get expectedCollectedIssues => [
        ComicSummary(
            resourceUri: 'http://gateway.marvel.com/v1/public/comics/26616',
            name: 'The Stand: American Nightmares (2009) #5'),
        ComicSummary(
            resourceUri: 'http://gateway.marvel.com/v1/public/comics/26613',
            name: 'The Stand: American Nightmares (2009) #4'),
        ComicSummary(
            resourceUri: 'http://gateway.marvel.com/v1/public/comics/23997',
            name: 'The Stand: American Nightmares (2009) #2'),
        ComicSummary(
            resourceUri: 'http://gateway.marvel.com/v1/public/comics/23807',
            name: 'The Stand: American Nightmares (2009) #1'),
      ];

  static List<DateSummary> get expectedDates => [
        DateSummary(
            type: 'onsaleDate',
            date: DateTime.parse('2099-10-30 05:00:00.000Z')),
        DateSummary(
            type: 'focDate', date: DateTime.parse('2019-10-07 04:00:00.000Z')),
      ];

  static List<PriceSummary> get expectedPrices => [
        PriceSummary(type: 'printPrice', price: 0),
      ];

  static ImageSummary get expectedThumbnail => ImageSummary(
      path: 'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available',
      extension: 'jpg');

  static List<ImageSummary> get expectedImages => [
        ImageSummary(
            path: 'http://i.annihil.us/u/prod/marvel/i/mg/8/c0/51dda501724ed',
            extension: 'jpg'),
        ImageSummary(
            path: 'http://i.annihil.us/u/prod/marvel/i/mg/c/d0/4bb67e65e44df',
            extension: 'jpg'),
      ];

  static CreatorList get expectedCreators {
    List<CreatorSummary> items = [
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/10021',
          name: 'Jim Nausedas',
          role: 'editor'),
    ];
    return CreatorList()
      ..available = 1
      ..returned = 1
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/comics/82967/creators'
      ..items = items;
  }

  static CharacterList get expectedCharacters {
    List<CharacterSummary> items = [
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009610',
          name: 'Spider-Man (Peter Parker)',
          role: null)
    ];
    return CharacterList()
      ..available = 1
      ..returned = 1
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/comics/82967/characters'
      ..items = items;
  }

  static StoryList get expectedStories {
    List<StorySummary> items = [
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/183698',
          name: 'cover from Marvel Previews (2017)',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/183699',
          name: 'story from Marvel Previews (2017)',
          type: 'interiorStory'),
    ];
    return StoryList()
      ..available = 2
      ..returned = 2
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/comics/82967/stories'
      ..items = items;
  }

  static EventList get expectedEvents {
    return EventList()
      ..available = 0
      ..returned = 0
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/comics/82967/events'
      ..items = [];
  }
}
