import 'data_container.dart';

/// Generic DataWrapper
class ApiResponse<T extends DataContainer> {
  /// The HTTP status code of the returned result.
  final int? code;

  /// A string description of the call status.
  final String? status;

  /// The copyright notice for the returned result.
  final String? copyright;

  /// The attribution notice for this result. Please display either this notice
  /// or the contents of the attributionHTML field on all screens which contain
  /// data from the Marvel Comics API.
  final String? attributionText;

  /// An HTML representation of the attribution notice for this result.
  /// Please display either this notice or the contents of the attributionText
  /// field on all screens which contain data from the Marvel Comics API.
  final String? attributionHTML;

  /// The results returned by the call.
  final T? data;

  /// A digest value of the content returned by the call.
  final String? etag;

  /// Default Constructor
  ApiResponse(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.data,
      this.etag});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiResponse &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          status == other.status &&
          copyright == other.copyright &&
          attributionText == other.attributionText &&
          attributionHTML == other.attributionHTML &&
          data == other.data &&
          etag == other.etag;

  @override
  int get hashCode =>
      code.hashCode ^
      status.hashCode ^
      copyright.hashCode ^
      attributionText.hashCode ^
      attributionHTML.hashCode ^
      data.hashCode ^
      etag.hashCode;

  @override
  String toString() {
    return 'ApiResponse{code: $code, status: $status, copyright: $copyright, attributionText: $attributionText, attributionHTML: $attributionHTML, data: $data, etag: $etag}';
  }
}
