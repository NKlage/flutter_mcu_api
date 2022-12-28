import 'package:flutter/foundation.dart';

/// Represents a generic SummaryList
abstract class SummaryList<T extends List> {
  /// The number of total available items in this list.
  /// Will always be greater than or equal to the "returned" value.
  int? available;

  /// The number of items returned in this collection (up to 20).
  int? returned;

  /// The path to the full list of items in this collection
  String? collectionUri;

  /// The list of returned summary items in this collection
  T? items;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SummaryList &&
          runtimeType == other.runtimeType &&
          available == other.available &&
          returned == other.returned &&
          collectionUri == other.collectionUri &&
          listEquals(items, other.items);

  @override
  int get hashCode =>
      available.hashCode ^
      returned.hashCode ^
      collectionUri.hashCode ^
      items.hashCode;

  @override
  String toString() {
    return 'SummaryList{available: $available, returned: $returned, collectionUri: $collectionUri, items: $items}';
  }
}
