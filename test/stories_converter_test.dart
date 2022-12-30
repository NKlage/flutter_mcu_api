import 'dart:convert';

import 'package:flutter_marvel_api/src/models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api_responses/api_responses.dart';

void main() {
  test('should convert stories response', () async {
    final storiesResponseBody =
        await ApiResponses.jsonResponse(ApiResponses.storiesList);
    final Map<String, dynamic> result = jsonDecode(storiesResponseBody);
    const storyIdToTest = 7;

    expect(result.containsKey('data'), true);

    final StoryDataContainer storyDataContainer =
        StoryDataContainer.fromJson(result['data']);

    final List<Story> storyList = storyDataContainer.results!;
    final story = storyList.firstWhere((story) => story.id == storyIdToTest);

    expect(story.id, storyIdToTest);
    expect(story.title,
        'Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf');
    expect(story.description, '');
    expect(story.resourceUri, 'http://gateway.marvel.com/v1/public/stories/7');
    expect(story.type, 'story');
    expect(story.modified, DateTime.tryParse('1969-12-31T19:00:00-0500'));
    expect(story.thumbnail, null);
    expect(story.creators, _ExpectedStoryObjects.expectedCreators);
    expect(story.characters, _ExpectedStoryObjects.expectedCharacters);
    expect(story.series, _ExpectedStoryObjects.expectedSeries);
    expect(story.comics, _ExpectedStoryObjects.expectedComics);
    expect(story.events, _ExpectedStoryObjects.expectedEvents);
    expect(story.originalIssue, _ExpectedStoryObjects.expectedOriginalIssue);
  });
}

class _ExpectedStoryObjects {
  static SeriesList get expectedSeries {
    List<SeriesSummary> items = [
      SeriesSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/series/6',
          name: 'CAGE HC (2002)')
    ];
    return SeriesList()
      ..available = 1
      ..returned = 1
      ..collectionUri = 'http://gateway.marvel.com/v1/public/stories/7/series'
      ..items = items;
  }

  static ComicList get expectedComics {
    List<ComicSummary> items = [
      ComicSummary(
          resourceUri: 'http://gateway.marvel.com/v1/public/comics/941',
          name: 'CAGE HC (Hardcover)')
    ];
    return ComicList()
      ..available = 1
      ..returned = 1
      ..collectionUri = 'http://gateway.marvel.com/v1/public/stories/7/comics'
      ..items = items;
  }

  static EventList get expectedEvents {
    return EventList()
      ..available = 0
      ..returned = 0
      ..collectionUri = 'http://gateway.marvel.com/v1/public/stories/7/events'
      ..items = [];
  }

  static CharacterList get expectedCharacters {
    return CharacterList()
      ..available = 0
      ..returned = 0
      ..collectionUri =
          'http://gateway.marvel.com/v1/public/stories/7/characters'
      ..items = [];
  }

  static CreatorList get expectedCreators {
    List<CreatorSummary> items = [];
    return CreatorList()
      ..available = 0
      ..returned = 0
      ..collectionUri = 'http://gateway.marvel.com/v1/public/stories/7/creators'
      ..items = items;
  }

  static ComicSummary get expectedOriginalIssue => ComicSummary(
      resourceUri: 'http://gateway.marvel.com/v1/public/comics/941',
      name: 'CAGE HC (Hardcover)');
}
