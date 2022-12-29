import 'package:flutter_marvel_api/flutter_marvel_api.dart';

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
  final Image? thumbnail;

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
        modified = DateTime.tryParse(json['modified']),
        resourceUri = json['resourceURI'],
        urls = List<Url>.from(json['urls'].map((model) => Url.fromJson(model))),
        thumbnail = Image.fromJson(json['thumbnail']),
        series = SeriesList.fromJson(json['series']),
        stories = StoryList.fromJson(json['stories']),
        comics = ComicList.fromJson(json['comics']),
        events = EventList.fromJson(json['events']);
}
