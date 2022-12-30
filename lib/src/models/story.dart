import '../models.dart';

/// Represents a Story
class Story {
  /// The unique ID of the story resource.
  final int? id;

  ///The story title.
  final String? title;

  /// A short description of the story.
  final String? description;

  /// The canonical URL identifier for this resource.
  final String? resourceUri;

  /// The story type e.g. interior story, cover, text story.
  final String? type;

  /// The date the resource was most recently modified.
  final DateTime? modified;

  /// The representative image for this story.
  final ImageSummary? thumbnail;

  /// A resource list containing comics in which this story takes place.
  final ComicList? comics;

  /// A resource list containing series in which this story appears.
  final SeriesList? series;

  /// A resource list of the events in which this story appears.
  final EventList? events;

  /// A resource list of characters which appear in this story.
  final CharacterList? characters;

  /// A resource list of creators who worked on this story.
  final CreatorList? creators;

  /// A summary representation of the issue in which this story was originally published.
  final ComicSummary? originalIssue;

  /// Default Constructor
  Story(
      this.id,
      this.title,
      this.description,
      this.resourceUri,
      this.type,
      this.modified,
      this.thumbnail,
      this.comics,
      this.series,
      this.events,
      this.characters,
      this.creators,
      this.originalIssue);

  /// Convert from JSON
  Story.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        resourceUri = json['resourceURI'],
        type = json['type'],
        modified = null == json['modified']
            ? null
            : DateTime.tryParse(json['modified']),
        thumbnail = null == json['thumbnail']
            ? null
            : ImageSummary.fromJson(json['thumbnail']),
        comics =
            null == json['comics'] ? null : ComicList.fromJson(json['comics']),
        series =
            null == json['series'] ? null : SeriesList.fromJson(json['series']),
        events =
            null == json['events'] ? null : EventList.fromJson(json['events']),
        characters = null == json['characters']
            ? null
            : CharacterList.fromJson(json['characters']),
        creators = null == json['creators']
            ? null
            : CreatorList.fromJson(json['creators']),
        originalIssue = null == json['originalIssue']
            ? null
            : ComicSummary.fromJson(json['originalIssue']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Story &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          resourceUri == other.resourceUri &&
          type == other.type &&
          modified == other.modified &&
          thumbnail == other.thumbnail &&
          comics == other.comics &&
          series == other.series &&
          events == other.events &&
          characters == other.characters &&
          creators == other.creators &&
          originalIssue == other.originalIssue;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      resourceUri.hashCode ^
      type.hashCode ^
      modified.hashCode ^
      thumbnail.hashCode ^
      comics.hashCode ^
      series.hashCode ^
      events.hashCode ^
      characters.hashCode ^
      creators.hashCode ^
      originalIssue.hashCode;

  @override
  String toString() {
    return 'Story{id: $id, title: $title, description: $description, resourceUri: $resourceUri, type: $type, modified: $modified, thumbnail: $thumbnail, comics: $comics, series: $series, events: $events, characters: $characters, creators: $creators, originalissue: $originalIssue}';
  }
}
