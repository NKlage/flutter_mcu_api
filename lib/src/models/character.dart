import '../models.dart'
    show Url, ImageSummary, ComicList, StoryList, EventList, SeriesList;

/// Represents a Character
class Character {
  /// The unique ID of the character resource.
  final int? id;

  /// The name of the character.
  final String? name;

  /// A short bio or description of the character.
  final String? description;

  /// The date the resource was most recently modified.
  final DateTime? modified;

  /// The canonical URL identifier for this resource.
  final String? resourceUri;

  /// A set of public web site URLs for the resource.
  final List<Url>? urls;

  /// The representative image for this character.
  final ImageSummary? thumbnail;

  /// A resource list containing comics which feature this character.
  final ComicList? comics;

  /// A resource list of stories in which this character appears.
  final StoryList? stories;

  /// A resource list of events in which this character appears.
  final EventList? events;

  /// A resource list of series in which this character appears.
  final SeriesList? series;

  /// Default Constructor
  Character(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.resourceUri,
      this.urls,
      this.thumbnail,
      this.comics,
      this.stories,
      this.events,
      this.series});

  /// Convert from JSON
  Character.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        modified = null == json['modified']
            ? null
            : DateTime.tryParse(json['modified']),
        resourceUri = json['resourceURI'],
        urls = null == json['urls']
            ? null
            : List<Url>.from(json['urls'].map((model) => Url.fromJson(model))),
        thumbnail = null == json['thumbnail']
            ? null
            : ImageSummary.fromJson(json['thumbnail']),
        comics =
            null == json['comics'] ? null : ComicList.fromJson(json['comics']),
        stories = null == json['stories']
            ? null
            : StoryList.fromJson(json['stories']),
        events = null == json['stories']
            ? null
            : EventList.fromJson(json['stories']),
        series =
            null == json['series'] ? null : SeriesList.fromJson(json['series']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Character &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          modified == other.modified &&
          resourceUri == other.resourceUri &&
          urls == other.urls &&
          thumbnail == other.thumbnail &&
          comics == other.comics &&
          stories == other.stories &&
          events == other.events &&
          series == other.series;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      modified.hashCode ^
      resourceUri.hashCode ^
      urls.hashCode ^
      thumbnail.hashCode ^
      comics.hashCode ^
      stories.hashCode ^
      events.hashCode ^
      series.hashCode;

  @override
  String toString() {
    return 'Character{id: $id, name: $name, description: $description, '
        'modified: $modified, resourceUri: $resourceUri, urls: $urls, '
        'thumbnail: $thumbnail, comics: $comics, stories: $stories, '
        'events: $events, series: $series}';
  }
}
