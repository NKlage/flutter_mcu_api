import 'data_container.dart';

class ApiResponse<T extends DataContainer> {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHTML;
  final T? data;
  final String? etag;

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
