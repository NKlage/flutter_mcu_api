import 'package:flutter_marvel_api/flutter_marvel_api.dart';

class Character {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? modified;
  final String? resourceUri;
  final List<Url>? urls;
  final Image? thumbnail;
  final ComicList? comics;
  final StoryList? stories;
  final EventList? events;
  final SeriesList? series;

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

  Character.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        modified = DateTime.tryParse(json['modified']),
        resourceUri = json['resourceURI'],
        urls = List<Url>.from(json['urls'].map((model) => Url.fromJson(model))),
        thumbnail = Image.fromJson(json['thumbnail']),
        comics = ComicList.fromJson(json['comics']),
        stories = StoryList.fromJson(json['stories']),
        events = EventList.fromJson(json['stories']),
        series = SeriesList.fromJson(json['series']);

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
    return 'Character{id: $id, name: $name, description: $description, modified: $modified, resourceUri: $resourceUri, urls: $urls, thumbnail: $thumbnail, comics: $comics, stories: $stories, events: $events, series: $series}';
  }
}
