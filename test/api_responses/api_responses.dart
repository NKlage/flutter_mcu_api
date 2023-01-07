import 'dart:io';

class ApiResponses {
  static const String _jsonRootFolder = 'test/api_responses';
  // Characters
  static const String characterList =
      '$_jsonRootFolder/characters/character-list.json';
  static const String characterComicList =
      '$_jsonRootFolder/characters/character-comic-list.json';
  static const String characterEventList =
      '$_jsonRootFolder/characters/character-event-list.json';
  static const String characterSeriesList =
      '$_jsonRootFolder/characters/character-series-list.json';
  static const String characterStoriesList =
      '$_jsonRootFolder/characters/character-stories-list.json';
  // Comics
  static const String comicList = '$_jsonRootFolder/comics/comic-list.json';
  static const String comicCharacterList =
      '$_jsonRootFolder/comics/comic-character-list.json';
  static const String comicCreatorList =
      '$_jsonRootFolder/comics/comic-creator-list.json';
  static const String comicEventList =
      '$_jsonRootFolder/comics/comic-event-list.json';
  static const String comicStoryList =
      '$_jsonRootFolder/comics/comic-story-list.json';
  // Creators
  static const String creatorList =
      '$_jsonRootFolder/creators/creator-list.json';
  static const String creatorComicList =
      '$_jsonRootFolder/creators/creator-comic-list.json';
  static const String creatorEventList =
      '$_jsonRootFolder/creators/creator-event-list.json';
  static const String creatorSeriesList =
      '$_jsonRootFolder/creators/creator-series-list.json';
  static const String creatorStoriesList =
      '$_jsonRootFolder/creators/creator-stories-list.json';
  // Events
  static const String eventList = '$_jsonRootFolder/events/event-list.json';
  static const String eventComicList =
      '$_jsonRootFolder/events/event-comic-list.json';
  static const String eventCharacterList =
      '$_jsonRootFolder/events/event-character-list.json';
  static const String eventCreatorList =
      '$_jsonRootFolder/events/event-creator-list.json';
  static const String eventSeriesList =
      '$_jsonRootFolder/events/event-series-list.json';
  static const String eventStoriesList =
      '$_jsonRootFolder/events/event-story-list.json';
  // Series
  static const String seriesList = '$_jsonRootFolder/series/series-list.json';
  static const String seriesCharacterList =
      '$_jsonRootFolder/series/series-character-list.json';
  static const String seriesComicList =
      '$_jsonRootFolder/series/series-comic-list.json';
  static const String seriesCreatorList =
      '$_jsonRootFolder/series/series-creator-list.json';
  static const String seriesEventList =
      '$_jsonRootFolder/series/series-event-list.json';
  static const String seriesStoryList =
      '$_jsonRootFolder/series/series-stories-list.json';
  // Stories
  static const String storiesList =
      '$_jsonRootFolder/stories/stories-list.json';
  static const String storiesCharacterList =
      '$_jsonRootFolder/stories/stories-character-list.json';
  static const String storiesComicList =
      '$_jsonRootFolder/stories/stories-comic-list.json';
  static const String storiesCreatorList =
      '$_jsonRootFolder/stories/stories-creator-list.json';
  static const String storiesEventList =
      '$_jsonRootFolder/stories/stories-event-list.json';
  static const String storiesSeriesList =
      '$_jsonRootFolder/stories/stories-series-list.json';

  static Future<String> jsonResponse(String responseFile) async {
    final file = File(responseFile);
    return await file.readAsString();
  }
}
