import '../models.dart';

/// Represents a Marvel Series
class Serie {
  /// The unique ID of the series resource.
  final int? id;

  /// The canonical title of the series.
  final String? title;

  /// A description of the series.
  final String? description;

  /// The canonical URL identifier for this resource.
  final String resourceUri;

  /// A set of public web site URLs for the resource.
  final List<Url>? urls;

  /// The first year of publication for the series.
  final int? startYear;

  /// The last year of publication for the series (conventionally, 2099 for ongoing series) .
  final int? endYear;

  /// The age-appropriateness rating for the series.
  final String? rating;

  /// The type of the the series
  final String? type;

  /// The date the resource was most recently modified.
  final DateTime? modified;

  /// The representative image for this series.
  final Image? thumbnail;

  /// A resource list containing comics in this series.
  final ComicList? comics;

  /// A resource list containing stories which occur in comics in this series.
  final StoryList? stories;

  /// A resource list containing events which take place in comics in this series.
  final EventList? events;

  /// A resource list containing characters which appear in comics in this series.
  final CharacterList? characters;

  /// A resource list of creators whose work appears in comics in this series.
  final CreatorList? creators;

  /// A summary representation of the series which follows this series.
  final SeriesSummary? next;

  /// A summary representation of the series which preceded this series.
  final SeriesSummary? previous;

  /// Default Constructor
  Serie(
      this.id,
      this.title,
      this.description,
      this.resourceUri,
      this.urls,
      this.startYear,
      this.endYear,
      this.rating,
      this.type,
      this.modified,
      this.thumbnail,
      this.comics,
      this.stories,
      this.events,
      this.characters,
      this.creators,
      this.next,
      this.previous);

  /// Convert from JSON
  Serie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        resourceUri = json['resourceURI'],
        urls = List<Url>.from(json['urls'].map((model) => Url.fromJson(model))),
        startYear = json['startYear'],
        endYear = json['endYear'],
        rating = json['rating'],
        type = json['type'],
        modified = null == json['modified']
            ? null
            : DateTime.tryParse(json['modified']),
        thumbnail = null == json['thumbnail']
            ? null
            : Image.fromJson(json['thumbnail']),
        comics =
            null == json['comics'] ? null : ComicList.fromJson(json['comics']),
        stories = null == json['stories']
            ? null
            : StoryList.fromJson(json['stories']),
        events =
            null == json['events'] ? null : EventList.fromJson(json['events']),
        characters = null == json['characters']
            ? null
            : CharacterList.fromJson(json['characters']),
        creators = null == json['creators']
            ? null
            : CreatorList.fromJson(json['creators']),
        next =
            null == json['next'] ? null : SeriesSummary.fromJson(json['next']),
        previous = null == json['previous']
            ? null
            : SeriesSummary.fromJson(json['previous']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Serie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          resourceUri == other.resourceUri &&
          urls == other.urls &&
          startYear == other.startYear &&
          endYear == other.endYear &&
          rating == other.rating &&
          type == other.type &&
          modified == other.modified &&
          thumbnail == other.thumbnail &&
          comics == other.comics &&
          stories == other.stories &&
          events == other.events &&
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
      startYear.hashCode ^
      endYear.hashCode ^
      rating.hashCode ^
      type.hashCode ^
      modified.hashCode ^
      thumbnail.hashCode ^
      comics.hashCode ^
      stories.hashCode ^
      events.hashCode ^
      characters.hashCode ^
      creators.hashCode ^
      next.hashCode ^
      previous.hashCode;

  @override
  String toString() {
    return 'Serie{id: $id, title: $title, description: $description, resourceUri: $resourceUri, urls: $urls, startYear: $startYear, endYear: $endYear, rating: $rating, type: $type, modified: $modified, thumbnail: $thumbnail, comics: $comics, stories: $stories, events: $events, characters: $characters, creators: $creators, next: $next, previous: $previous}';
  }
}
