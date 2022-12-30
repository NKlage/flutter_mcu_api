import '../models.dart';

/// Represents a Marvel Comic
class Comic {
  /// The unique ID of the comic resource.
  final int? id;

  /// The ID of the digital comic representation of this comic.
  /// Will be 0 if the comic is not available digitally.
  final int? digitalId;

  /// The canonical title of the comic.
  final String? title;

  /// The number of the issue in the series
  /// (will generally be 0 for collection formats).
  final double? issueNumber;

  /// If the issue is a variant (e.g. an alternate cover, second printing,
  /// or director’s cut), a text description of the variant.
  final String? variantDescription;

  /// The preferred description of the comic.
  final String? description;

  /// The date the resource was most recently modified.
  final DateTime? modified;

  /// The ISBN for the comic (generally only populated for collection formats).
  final String? isbn;

  /// The UPC barcode number for the comic (generally only populated for
  /// periodical formats).
  final String? upc;

  /// The Diamond code for the comic.
  final String? diamondCode;

  /// The EAN barcode for the comic.
  final String? ean;

  /// The ISSN barcode for the comic.
  final String? issn;

  /// The publication format of the comic e.g. comic, hardcover, trade paperback.
  final String? format;

  /// The number of story pages in the comic.
  final int? pageCount;

  /// A set of descriptive text blurbs for the comic.
  final List<TextObject>? textObjects;

  /// The canonical URL identifier for this resource.
  final String? resourceURI;

  /// A set of public web site URLs for the resource.
  final List<Url>? urls;

  /// A summary representation of the series to which this comic belongs.
  final SeriesSummary? series;

  /// A list of variant issues for this comic (includes the "original" issue if the current issue is a variant).
  final List<ComicSummary>? variants;

  /// A list of collections which include this comic (will generally be empty
  /// if the comic's format is a collection).
  final List<ComicSummary>? collections;

  /// A list of issues collected in this comic (will generally be empty for
  /// periodical formats such as "comic" or "magazine").
  final List<ComicSummary>? collectedIssues;

  /// A list of key dates for this comic.
  final List<DateSummary>? dates;

  /// A list of prices for this comic.
  final List<PriceSummary>? prices;

  /// The representative image for this comic.
  final ImageSummary? thumbnail;

  /// A list of promotional images associated with this comic.
  final List<ImageSummary>? images;

  /// A resource list containing the creators associated with this comic.
  final CreatorList? creators;

  /// A resource list containing the characters which appear in this comic.
  final CharacterList? characters;

  /// A resource list containing the stories which appear in this comic.
  final StoryList? stories;

  /// A resource list containing the events in which this comic appears.
  final EventList? events;

  /// Default Constructor
  Comic(
      {this.id,
      this.digitalId,
      this.title,
      this.issueNumber,
      this.variantDescription,
      this.description,
      this.modified,
      this.isbn,
      this.upc,
      this.diamondCode,
      this.ean,
      this.issn,
      this.format,
      this.pageCount,
      this.textObjects,
      this.resourceURI,
      this.urls,
      this.series,
      this.variants,
      this.collections,
      this.collectedIssues,
      this.dates,
      this.prices,
      this.thumbnail,
      this.images,
      this.creators,
      this.characters,
      this.stories,
      this.events});

  /// Convert from JSON
  Comic.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        digitalId = json['digitalId'],
        title = json['title'],
        issueNumber = null == json['issueNumber']
            ? null
            : double.tryParse(json['issueNumber'].toString()),
        variantDescription = json['variantDescription'],
        description = json['description'],
        modified = null == json['modified']
            ? null
            : DateTime.tryParse(json['modified']),
        isbn = json['isbn'],
        upc = json['upc'],
        diamondCode = json['diamondCode'],
        ean = json['ean'],
        issn = json['issn'],
        format = json['format'],
        pageCount = json['pageCount'],
        textObjects = null == json['textObjects']
            ? null
            : List<TextObject>.from(
                json['textObjects'].map((model) => TextObject.fromJson(model))),
        resourceURI = json['resourceURI'],
        urls = null == json['urls']
            ? null
            : List<Url>.from(json['urls'].map((model) => Url.fromJson(model))),
        series = null == json['series']
            ? null
            : SeriesSummary.fromJson(json['series']),
        variants = null == json['variants']
            ? null
            : List<ComicSummary>.from(
                json['variants'].map((model) => ComicSummary.fromJson(model))),
        collections = null == json['collections']
            ? null
            : List<ComicSummary>.from(json['collections']
                .map((model) => ComicSummary.fromJson(model))),
        collectedIssues = null == json['collectedIssues']
            ? null
            : List<ComicSummary>.from(json['collectedIssues']
                .map((model) => ComicSummary.fromJson(model))),
        dates = null == json['dates']
            ? null
            : List<DateSummary>.from(
                json['dates'].map((model) => DateSummary.fromJson(model))),
        prices = null == json['prices']
            ? null
            : List<PriceSummary>.from(
                json['prices'].map((model) => PriceSummary.fromJson(model))),
        thumbnail = null == json['thumbnail']
            ? null
            : ImageSummary.fromJson(json['thumbnail']),
        images = null == json['images']
            ? null
            : List<ImageSummary>.from(
                json['images'].map((model) => ImageSummary.fromJson(model))),
        creators = null == json['creators']
            ? null
            : CreatorList.fromJson(json['creators']),
        characters = null == json['characters']
            ? null
            : CharacterList.fromJson(json['characters']),
        stories = null == json['stories']
            ? null
            : StoryList.fromJson(json['stories']),
        events =
            null == json['events'] ? null : EventList.fromJson(json['events']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Comic &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          digitalId == other.digitalId &&
          title == other.title &&
          issueNumber == other.issueNumber &&
          variantDescription == other.variantDescription &&
          description == other.description &&
          modified == other.modified &&
          isbn == other.isbn &&
          upc == other.upc &&
          diamondCode == other.diamondCode &&
          ean == other.ean &&
          issn == other.issn &&
          format == other.format &&
          pageCount == other.pageCount &&
          textObjects == other.textObjects &&
          resourceURI == other.resourceURI &&
          urls == other.urls &&
          series == other.series &&
          variants == other.variants &&
          collections == other.collections &&
          collectedIssues == other.collectedIssues &&
          dates == other.dates &&
          prices == other.prices &&
          thumbnail == other.thumbnail &&
          images == other.images &&
          creators == other.creators &&
          characters == other.characters &&
          stories == other.stories &&
          events == other.events;

  @override
  int get hashCode =>
      id.hashCode ^
      digitalId.hashCode ^
      title.hashCode ^
      issueNumber.hashCode ^
      variantDescription.hashCode ^
      description.hashCode ^
      modified.hashCode ^
      isbn.hashCode ^
      upc.hashCode ^
      diamondCode.hashCode ^
      ean.hashCode ^
      issn.hashCode ^
      format.hashCode ^
      pageCount.hashCode ^
      textObjects.hashCode ^
      resourceURI.hashCode ^
      urls.hashCode ^
      series.hashCode ^
      variants.hashCode ^
      collections.hashCode ^
      collectedIssues.hashCode ^
      dates.hashCode ^
      prices.hashCode ^
      thumbnail.hashCode ^
      images.hashCode ^
      creators.hashCode ^
      characters.hashCode ^
      stories.hashCode ^
      events.hashCode;

  @override
  String toString() {
    return 'Comic{id: $id, digitalId: $digitalId, title: $title, issueNumber: $issueNumber, variantDescription: $variantDescription, description: $description, modified: $modified, isbn: $isbn, upc: $upc, diamondCode: $diamondCode, ean: $ean, issn: $issn, format: $format, pageCount: $pageCount, textObjects: $textObjects, resourceURI: $resourceURI, urls: $urls, series: $series, variants: $variants, collections: $collections, collectedIssues: $collectedIssues, dates: $dates, prices: $prices, thumbnail: $thumbnail, images: $images, creators: $creators, characters: $characters, stories: $stories, events: $events}';
  }
}
