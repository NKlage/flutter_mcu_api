import 'package:flutter_marvel_api/flutter_marvel_api.dart';

import 'image.dart';
import 'url.dart';

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
}
