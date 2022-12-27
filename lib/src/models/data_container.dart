abstract class DataContainer<T> {
  int? offset;
  int? limit;
  int? total;
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
