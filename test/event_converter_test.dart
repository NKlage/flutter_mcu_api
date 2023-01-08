import 'dart:convert';

import 'package:flutter_mcu_api/flutter_mcu_api.dart';
import 'package:flutter_mcu_api/src/models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api_responses/api_responses.dart';

void main() {
  test('should convert events response', () async {
    final eventResponseBody =
        await ApiResponses.jsonResponse(ApiResponses.eventList);
    final Map<String, dynamic> result = jsonDecode(eventResponseBody);
    const eventIdToTest = 116;

    expect(result.containsKey('data'), true);

    final EventDataContainer eventDataContainer =
        EventDataContainer.fromJson(result['data']);

    final List<Event> eventList = eventDataContainer.results!;
    final firstEvent =
        eventList.firstWhere((event) => event.id == eventIdToTest);

    expect(firstEvent.id, eventIdToTest);
    expect(firstEvent.title, 'Acts of Vengeance!');
    expect(firstEvent.description,
        'Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.');
    expect(firstEvent.resourceUri,
        'http://gateway.marvel.com/v1/public/events/116');
    expect(firstEvent.urls, _ExpectedEventObjects.expectedUrls);
    expect(firstEvent.modified, DateTime.tryParse('2013-06-28T16:31:24-0400'));
    expect(firstEvent.start, DateTime.tryParse('1989-12-10 00:00:00'));
    expect(firstEvent.end, DateTime.tryParse('2008-01-04 00:00:00'));
    expect(firstEvent.thumbnail, _ExpectedEventObjects.expectedImage);
    expect(firstEvent.comics, _ExpectedEventObjects.expectedComics);
    expect(firstEvent.stories, _ExpectedEventObjects.expectedStories);
    expect(firstEvent.series, _ExpectedEventObjects.expectedSeries);
    expect(firstEvent.characters, _ExpectedEventObjects.expectedCharacters);
    expect(firstEvent.creators, _ExpectedEventObjects.expectedCreators);

    expect(firstEvent.next, _ExpectedEventObjects.expectedNext);
    expect(firstEvent.previous, _ExpectedEventObjects.expectedPrevious);
  });
}

class _ExpectedEventObjects {
  static List<Url> get expectedUrls => [
        Url(
            type: 'detail',
            url:
                'http://marvel.com/comics/events/116/acts_of_vengeance?utm_campaign=apiRef&utm_source=cc2caa9cfdaabd58ebf54e6c07e7fa0a'),
        Url(
            type: 'wiki',
            url:
                'http://marvel.com/universe/Acts_of_Vengeance!?utm_campaign=apiRef&utm_source=cc2caa9cfdaabd58ebf54e6c07e7fa0a')
      ];

  static ImageSummary get expectedImage => ImageSummary(
      path: 'http://i.annihil.us/u/prod/marvel/i/mg/9/40/51ca10d996b8b',
      extension: 'jpg');

  static ComicList get expectedComics {
    List<ComicSummary> items = [
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/12744',
          name: 'Alpha Flight (1983) #79'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/12746',
          name: 'Alpha Flight (1983) #80'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/7188',
          name: 'Avengers (1963) #311'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/7189',
          name: 'Avengers (1963) #312'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/7190',
          name: 'Avengers (1963) #313'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/6933',
          name: 'Avengers Annual (1967) #19'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/17774',
          name: 'Avengers Annual (1967) #19 (Variant)'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/17795',
          name: 'West Coast Avengers (1985) #53'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/17796',
          name: 'West Coast Avengers (1985) #54'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/17797',
          name: 'West Coast Avengers (1985) #55'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/17695',
          name:
              'AVENGERS WEST COAST: DARKER THAN SCARLET TPB (Trade Paperback)'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/7746',
          name: 'Captain America (1968) #365'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/7747',
          name: 'Captain America (1968) #366'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/7748',
          name: 'Captain America (1968) #367'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/8268',
          name: 'Daredevil (1964) #275'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/8269',
          name: 'Daredevil (1964) #276'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/20170',
          name: 'Doctor Strange, Sorcerer Supreme (1988) #11'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/20171',
          name: 'Doctor Strange, Sorcerer Supreme (1988) #12'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/20172',
          name: 'Doctor Strange, Sorcerer Supreme (1988) #13'),
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/13155',
          name: 'Fantastic Four (1961) #334')
    ];
    return ComicList()
      ..available = 53
      ..returned = 20
      ..collectionUri = 'http://gateway.marvel.com/v1/public/events/116/comics'
      ..items = items;
  }

  static StoryList get expectedStories {
    List<StorySummary> items = [
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/12960',
          name: 'Fantastic Four (1961) #334',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/12961',
          name: 'Shadows of Alarm..!',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/12962',
          name: 'Fantastic Four (1961) #335',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/12963',
          name: 'Death by Debate',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/12964',
          name: 'Fantastic Four (1961) #336',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/12965',
          name: 'Dark Congress!',
          type: ''),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14056',
          name: 'Amazing Spider-Man (1963) #326',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14057',
          name: 'Amazing Spider-Man (1963) #326',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14058',
          name: 'Amazing Spider-Man (1963) #327',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14059',
          name: 'Cunning Attractions!',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14060',
          name: 'Amazing Spider-Man (1963) #328',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14061',
          name: 'Shaw\'s Gambit',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14062',
          name: 'Amazing Spider-Man (1963) #329',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14063',
          name: 'Amazing Spider-Man (1963) #329',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14916',
          name: 'AVENGERS (1963) #311',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14917',
          name: 'The Weakest Point',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14918',
          name: 'AVENGERS (1963) #312',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14919',
          name: 'Has the Whole World Gone Mad?!?',
          type: 'interiorStory'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14920',
          name: 'AVENGERS (1963) #313',
          type: 'cover'),
      StorySummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/stories/14921',
          name: 'Thieves Honor',
          type: 'interiorStory')
    ];
    return StoryList()
      ..available = 161
      ..returned = 20
      ..collectionUri = 'http://gateway.marvel.com/v1/public/events/116/stories'
      ..items = items;
  }

  static SeriesList get expectedSeries {
    List<SeriesSummary> items = [
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2116',
          name: 'Alpha Flight (1983 - 1994)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/1991',
          name: 'Avengers (1963 - 1996)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/1988',
          name: 'Avengers Annual (1967 - 1994)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/3462',
          name: 'AVENGERS WEST COAST: DARKER THAN SCARLET TPB (2008)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/1996',
          name: 'Captain America (1968 - 1996)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2002',
          name: 'Daredevil (1964 - 1998)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/3741',
          name: 'Doctor Strange, Sorcerer Supreme (1988 - 1996)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2121',
          name: 'Fantastic Four (1961 - 1998)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2021',
          name: 'Incredible Hulk (1962 - 1999)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2029',
          name: 'Iron Man (1968 - 1996)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2055',
          name: 'New Mutants (1983 - 1991)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2271',
          name: 'Peter Parker, the Spectacular Spider-Man (1976 - 1998)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/5860',
          name: 'Punisher War Journal (1988 - 1995)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/3695',
          name: 'Quasar (1989 - 1994)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2288',
          name: 'Silver Surfer (1987 - 1998)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/1987',
          name: 'The Amazing Spider-Man (1963 - 1998)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2083',
          name: 'Thor (1966 - 1996)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2258',
          name: 'Uncanny X-Men (1963 - 2011)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/2092',
          name: 'Web of Spider-Man (1985 - 1995)'),
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/3630',
          name: 'West Coast Avengers (1985 - 1994)')
    ];
    return SeriesList()
      ..available = 22
      ..returned = 20
      ..collectionUri = 'http://gateway.marvel.com/v1/public/events/116/series'
      ..items = items;
  }

  static CharacterList get expectedCharacters {
    List<CharacterSummary> items = [
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009435',
          name: 'Alicia Masters'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1010370',
          name: 'Alpha Flight'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009152',
          name: 'Ancient One'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009156',
          name: 'Apocalypse'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009159',
          name: 'Archangel'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009165',
          name: 'Avengers'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1011456',
          name: 'Balder'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009168',
          name: 'Banshee'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009175',
          name: 'Beast'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009179',
          name: 'Beetle (Abner Jenkins)'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009329',
          name: 'Ben Grimm'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009186',
          name: 'Black Knight (Sir Percy of Scandia)'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009189',
          name: 'Black Widow'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1010366',
          name: 'Boom Boom'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009167',
          name: 'Bruce Banner'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009213',
          name: 'Bushwacker'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009220',
          name: 'Captain America'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1011027',
          name: 'Captain Universe'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009234',
          name: 'Chameleon'),
      CharacterSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/characters/1009239',
          name: 'Clea')
    ];
    return CharacterList()
      ..available = 108
      ..returned = 20
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/events/116/characters'
      ..items = items;
  }

  static CreatorList get expectedCreators {
    List<CreatorSummary> items = [
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/2707',
          name: 'Jeff Albrecht',
          role: 'inker'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/2077',
          name: 'Hilary Barta',
          role: 'inker'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/1277',
          name: 'Bret Blevins',
          role: 'inker'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/5823',
          name: 'Danilo Bulanadi',
          role: 'inker'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/87',
          name: 'Mark Bagley',
          role: 'penciler'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/211',
          name: 'Mark Bright',
          role: 'penciler'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/2043',
          name: 'Eliot Brown',
          role: 'penciler'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/1216',
          name: 'Rich Buckler',
          role: 'penciler'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/1827',
          name: 'John Byrne',
          role: 'penciler'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/2713',
          name: 'Gary Barnum',
          role: 'writer'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/1231',
          name: 'Kurt Busiek',
          role: 'writer'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/452',
          name: 'Virtual Calligr',
          role: 'writer'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/44',
          name: 'Chris Claremont',
          role: 'writer'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/954',
          name: 'Gerry Conway',
          role: 'writer'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/1935',
          name: 'Paul Becton',
          role: 'colorist'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/1909',
          name: 'Steve Buccellato',
          role: 'colorist'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/1871',
          name: 'Ken Bruzenak',
          role: 'letterer'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/1887',
          name: 'Janice Chiang',
          role: 'letterer'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/105',
          name: 'Sal Buscema',
          role: 'penciller (cover)'),
      CreatorSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/creators/3415',
          name: 'John Calimee',
          role: 'penciller (cover)')
    ];
    return CreatorList()
      ..available = 102
      ..returned = 20
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/events/116/creators'
      ..items = items;
  }

  static EventSummary get expectedNext => EventSummary(
      resourceUri: 'http://gateway.marvel.com/v1/public/events/240',
      name: 'Days of Future Present');

  static EventSummary get expectedPrevious => EventSummary(
      resourceUri: 'http://gateway.marvel.com/v1/public/events/233',
      name: 'Atlantis Attacks');
}
