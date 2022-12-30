import 'package:flutter_marvel_api/flutter_marvel_api.dart';

/// Represents a Marvel Creator
class Creator {
  /// The unique ID of the creator resource.
  final int? id;

  /// The first name of the creator.
  final String? firstName;

  /// The middle name of the creator.
  final String? middleName;

  /// The last name of the creator.
  final String? lastName;

  /// The suffix or honorific for the creator.
  final String? suffix;

  /// The full name of the creator (a space-separated concatenation of the above four fields).
  final String? fullName;

  /// The date the resource was most recently modified.
  final DateTime? modified;

  /// The canonical URL identifier for this resource.
  final String? resourceUri;

  ///  A set of public web site URLs for the resource.
  final List<Url>? urls;

  /// The representative image for this creator.
  final ImageSummary? thumbnail;

  /// A resource list containing the series which feature work by this creator.
  final SeriesList? series;

  /// A resource list containing the stories which feature work by this creator.
  final StoryList? stories;

  /// A resource list containing the comics which feature work by this creator.
  final ComicList? comics;

  /// A resource list containing the events which feature work by this creator.
  final EventList? events;

  /// Default Constructor
  Creator(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.suffix,
      this.fullName,
      this.modified,
      this.resourceUri,
      this.urls,
      this.thumbnail,
      this.series,
      this.stories,
      this.comics,
      this.events});

  /// Convert from Json
  Creator.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        middleName = json['middleName'],
        lastName = json['lastName'],
        suffix = json['suffix'],
        fullName = json['fullName'],
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
        series =
            null == json['series'] ? null : SeriesList.fromJson(json['series']),
        stories = null == json['stories']
            ? null
            : StoryList.fromJson(json['stories']),
        comics =
            null == json['comics'] ? null : ComicList.fromJson(json['comics']),
        events =
            null == json['events'] ? null : EventList.fromJson(json['events']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Creator &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstName == other.firstName &&
          middleName == other.middleName &&
          lastName == other.lastName &&
          suffix == other.suffix &&
          fullName == other.fullName &&
          modified == other.modified &&
          resourceUri == other.resourceUri &&
          urls == other.urls &&
          thumbnail == other.thumbnail &&
          series == other.series &&
          stories == other.stories &&
          comics == other.comics &&
          events == other.events;

  @override
  int get hashCode =>
      id.hashCode ^
      firstName.hashCode ^
      middleName.hashCode ^
      lastName.hashCode ^
      suffix.hashCode ^
      fullName.hashCode ^
      modified.hashCode ^
      resourceUri.hashCode ^
      urls.hashCode ^
      thumbnail.hashCode ^
      series.hashCode ^
      stories.hashCode ^
      comics.hashCode ^
      events.hashCode;

  @override
  String toString() {
    return 'Creator{id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, suffix: $suffix, fullName: $fullName, modified: $modified, resourceUri: $resourceUri, urls: $urls, thumbnail: $thumbnail, series: $series, stories: $stories, comics: $comics, events: $events}';
  }
}
