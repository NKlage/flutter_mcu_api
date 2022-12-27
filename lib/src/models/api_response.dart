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
}
