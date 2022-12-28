/// Represent a generic DataConttainer
abstract class DataContainer<T> {
  /// The requested offset (number of skipped results) of the call.
  int? offset;

  /// The requested result limit.
  int? limit;

  /// The total number of resources available given the current filter set.
  int? total;

  // TODO: count field is missing
  /// The list of characters returned by the call
  T? results;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataContainer &&
          runtimeType == other.runtimeType &&
          offset == other.offset &&
          limit == other.limit &&
          total == other.total &&
          results == other.results;

  @override
  int get hashCode =>
      offset.hashCode ^ limit.hashCode ^ total.hashCode ^ results.hashCode;

  @override
  String toString() {
    return 'DataContainer{offset: $offset, limit: $limit, total: $total, results: $results}';
  }
}
