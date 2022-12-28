import 'dart:convert';

import 'package:flutter_marvel_api/flutter_marvel_api.dart';
import 'package:flutter_marvel_api/src/models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api_responses/api_responses.dart';

void main() {
  test('should convert character response', () async {
    final characterResponseBody =
        await ApiResponses.jsonResponse(ApiResponses.characterList);
    final Map<String, dynamic> result = jsonDecode(characterResponseBody);
    const characterIdToTest = 1011334;

    expect(result.containsKey('data'), true);

    final CharacterDataContainer characterDataContainer =
        CharacterDataContainer.fromJson(result['data']);

    final List<Character> characterList = characterDataContainer.results!;
    final firstCharacter = characterList
        .firstWhere((character) => character.id == characterIdToTest);

    expect(firstCharacter.id, characterIdToTest);
    expect(firstCharacter.name, '3-D Man');
    expect(firstCharacter.description, 'fancy description');
    expect(
        firstCharacter.modified, DateTime.tryParse('2014-04-29T14:18:17-0400'));
    expect(firstCharacter.resourceUri,
        'http://gateway.marvel.com/v1/public/characters/1011334');
    expect(firstCharacter.urls, _ExpectedCharacterObjects.expectedUrls);
    expect(firstCharacter.thumbnail, _ExpectedCharacterObjects.expectedImage);
    expect(firstCharacter.comics, _ExpectedCharacterObjects.expectedComics);
    expect(firstCharacter.stories, _ExpectedCharacterObjects.expectedStories);
    expect(firstCharacter.events, _ExpectedCharacterObjects.expectedEvents);
    expect(firstCharacter.series, _ExpectedCharacterObjects.expectedSeries);
  });
}

class _ExpectedCharacterObjects {
  static List<Url> get expectedUrls => [
        Url(
            type: 'detail',
            url:
                'http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=cc2caa9cfdaabd58ebf54e6c07e7fa0a'),
        Url(
            type: 'wiki',
            url:
                'http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=cc2caa9cfdaabd58ebf54e6c07e7fa0a'),
        Url(
            type: 'comiclink',
            url:
                'http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=cc2caa9cfdaabd58ebf54e6c07e7fa0a'),
      ];

  static Image get expectedImage => Image(
      path: 'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784',
      extension: 'jpg');

  static ComicList get expectedComics {
    List<ComicSummary> items = [
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/21366',
          name: 'Avengers: The Initiative (2007) #14'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/24571',
          name: 'Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/21546',
          name: 'Avengers: The Initiative (2007) #15'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/21741',
          name: 'Avengers: The Initiative (2007) #16'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/21975',
          name: 'Avengers: The Initiative (2007) #17'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/22299',
          name: 'Avengers: The Initiative (2007) #18'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/22300',
          name: 'Avengers: The Initiative (2007) #18 (ZOMBIE VARIANT)'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/22506',
          name: 'Avengers: The Initiative (2007) #19'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/8500',
          name: 'Deadpool (1997) #44'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/10223',
          name: 'Marvel Premiere (1972) #35'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/10224',
          name: 'Marvel Premiere (1972) #36'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/10225',
          name: 'Marvel Premiere (1972) #37'),
    ];
    return ComicList()
      ..available = 12
      ..returned = 12
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/characters/1011334/comics'
      ..items = items;
  }

  static StoryList get expectedStories {
    List<StorySummary> items = [
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19947',
          name: 'Cover #19947',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19948',
          name: 'The 3-D Man!',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19949',
          name: 'Cover #19949',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19950',
          name: 'The Devil\'s Music!',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19951',
          name: 'Cover #19951',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19952',
          name: 'Code-Name:  The Cold Warrior!',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47184',
          name: 'AVENGERS: THE INITIATIVE (2007) #14',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47185',
          name: 'Avengers: The Initiative (2007) #14 - Int',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47498',
          name: 'AVENGERS: THE INITIATIVE (2007) #15',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47499',
          name: 'Avengers: The Initiative (2007) #15 - Int',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47792',
          name: 'AVENGERS: THE INITIATIVE (2007) #16',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47793',
          name: 'Avengers: The Initiative (2007) #16 - Int',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/48361',
          name: 'AVENGERS: THE INITIATIVE (2007) #17',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/48362',
          name: 'Avengers: The Initiative (2007) #17 - Int',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49103',
          name: 'AVENGERS: THE INITIATIVE (2007) #18',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49104',
          name: 'Avengers: The Initiative (2007) #18 - Int',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49106',
          name: 'Avengers: The Initiative (2007) #18, Zombie Variant - Int',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49888',
          name: 'AVENGERS: THE INITIATIVE (2007) #19',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49889',
          name: 'Avengers: The Initiative (2007) #19 - Int',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/54371',
          name: 'Avengers: The Initiative (2007) #14, Spotlight Variant - Int',
          type: 'interiorStory'),
    ];
    return StoryList()
      ..available = 21
      ..returned = 20
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/characters/1011334/stories'
      ..items = items;
  }

  static EventList get expectedEvents {
    List<EventSummary> items = [
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19947',
          name: 'Cover #19947'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19948',
          name: 'The 3-D Man!'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19949',
          name: 'Cover #19949'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19950',
          name: 'The Devil\'s Music!'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19951',
          name: 'Cover #19951'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/19952',
          name: 'Code-Name:  The Cold Warrior!'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47184',
          name: 'AVENGERS: THE INITIATIVE (2007) #14'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47185',
          name: 'Avengers: The Initiative (2007) #14 - Int'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47498',
          name: 'AVENGERS: THE INITIATIVE (2007) #15'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47499',
          name: 'Avengers: The Initiative (2007) #15 - Int'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47792',
          name: 'AVENGERS: THE INITIATIVE (2007) #16'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/47793',
          name: 'Avengers: The Initiative (2007) #16 - Int'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/48361',
          name: 'AVENGERS: THE INITIATIVE (2007) #17'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/48362',
          name: 'Avengers: The Initiative (2007) #17 - Int'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49103',
          name: 'AVENGERS: THE INITIATIVE (2007) #18'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49104',
          name: 'Avengers: The Initiative (2007) #18 - Int'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49106',
          name: 'Avengers: The Initiative (2007) #18, Zombie Variant - Int'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49888',
          name: 'AVENGERS: THE INITIATIVE (2007) #19'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/49889',
          name: 'Avengers: The Initiative (2007) #19 - Int'),
      EventSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/54371',
          name: 'Avengers: The Initiative (2007) #14, Spotlight Variant - Int'),
    ];

    return EventList()
      ..available = 21
      ..returned = 20
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/characters/1011334/stories'
      ..items = items;
  }

  static SeriesList get expectedSeries {
    List<SeriesSummary> items = [
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/1945',
          name: 'Avengers: The Initiative (2007 - 2010)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2005',
          name: 'Deadpool (1997 - 2002)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2045',
          name: 'Marvel Premiere (1972 - 1981)'),
    ];
    return SeriesList()
      ..available = 3
      ..returned = 3
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/characters/1011334/series'
      ..items = items;
  }
}
