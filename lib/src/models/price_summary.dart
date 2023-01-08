/// Represents a Price
class PriceSummary {
  /// A description of the price (e.g. print price, digital price).
  final String? type;

  /// The price (all prices in USD).
  final double? price;

  /// Default Constructor
  PriceSummary({this.type, this.price});

  /// Convert from JSON
  PriceSummary.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        price = null == json['price']
            ? null
            : double.tryParse(json['price'].toString());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceSummary &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          price == other.price;

  @override
  int get hashCode => type.hashCode ^ price.hashCode;

  @override
  String toString() {
    return 'PriceSummary{type: $type, price: $price}';
  }
}
