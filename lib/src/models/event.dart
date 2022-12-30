import '../models.dart';

/// Represents a Marvel Event
class Event {
  /// The unique ID of the event resource.
  final int? id;

  /// The title of the event.
  final String? title;

  /// A description of the event.
  final String? description;

  /// The canonical URL identifier for this resource.
  final String? resourceUri;

  /// A set of public web site URLs for the event.
  final List<Url>? urls;

  /// The date the resource was most recently modified.
  final DateTime? modified;

  /// The date of publication of the first issue in this event.
  final DateTime? start;

  /// The date of publication of the last issue in this event.
  final DateTime? end;

  /// The representative image for this event.
  final Image? thumbnail;

  /// A resource list containing the comics in this event.
  final ComicList? comics;

  /// A resource list containing the stories in this event.
  final StoryList? stories;

  /// A resource list containing the series in this event.
  final SeriesList? series;

  /// A resource list containing the characters which appear in this event.
  final CharacterList? characters;

  /// A resource list containing creators whose work appears in this event.
  final CreatorList? creators;

  /// A summary representation of the event which follows this event.
  final EventSummary? next;

  /// A summary representation of the event which preceded this event.
  final EventSummary? previous;

  /// Default Constructor
  Event(
      this.id,
      this.title,
      this.description,
      this.resourceUri,
      this.urls,
      this.modified,
      this.start,
      this.end,
      this.thumbnail,
      this.comics,
      this.stories,
      this.series,
      this.characters,
      this.creators,
      this.next,
      this.previous); // (EventSummary, optional): A summary representation of the event which preceded this event.

  /// Convert from JSON
  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        resourceUri = json['resourceURI'],
        urls = null == json['urls']
            ? null
            : List<Url>.from(json['urls'].map((model) => Url.fromJson(model))),
        modified = null == json['modified']
            ? null
            : DateTime.tryParse(json['modified']),
        start = null == json['start'] ? null : DateTime.tryParse(json['start']),
        end = null == json['end'] ? null : DateTime.tryParse(json['end']),
        thumbnail = null == json['thumbnail']
            ? null
            : Image.fromJson(json['thumbnail']),
        comics =
            null == json['comics'] ? null : ComicList.fromJson(json['comics']),
        stories = null == json['stories']
            ? null
            : StoryList.fromJson(json['stories']),
        series =
            null == json['series'] ? null : SeriesList.fromJson(json['series']),
        characters = null == json['characters']
            ? null
            : CharacterList.fromJson(json['characters']),
        creators = null == json['creators']
            ? null
            : CreatorList.fromJson(json['creators']),
        next =
            null == json['next'] ? null : EventSummary.fromJson(json['next']),
        previous = null == json['previous']
            ? null
            : EventSummary.fromJson(json['previous']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Event &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          resourceUri == other.resourceUri &&
          urls == other.urls &&
          modified == other.modified &&
          start == other.start &&
          end == other.end &&
          thumbnail == other.thumbnail &&
          comics == other.comics &&
          stories == other.stories &&
          series == other.series &&
          characters == other.characters &&
          creators == other.creators &&
          next == other.next &&
          previous == other.previous;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      resourceUri.hashCode ^
      urls.hashCode ^
      modified.hashCode ^
      start.hashCode ^
      end.hashCode ^
      thumbnail.hashCode ^
      comics.hashCode ^
      stories.hashCode ^
      series.hashCode ^
      characters.hashCode ^
      creators.hashCode ^
      next.hashCode ^
      previous.hashCode;

  @override
  String toString() {
    return 'Event{id: $id, title: $title, description: $description, resourceUri: $resourceUri, urls: $urls, modified: $modified, start: $start, end: $end, thumbnail: $thumbnail, comics: $comics, stories: $stories, series: $series, characters: $characters, creators: $creators, next: $next, previous: $previous}';
  }
}
