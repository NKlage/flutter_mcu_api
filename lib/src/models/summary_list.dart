import 'package:flutter/foundation.dart';

abstract class SummaryList<T extends List> {
  int? available;
  int? returned;
  String? collectionUri;
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
