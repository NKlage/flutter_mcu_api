import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class MarvelApiQueryParamsMatcher extends HttpRequestMatcher {
  const MarvelApiQueryParamsMatcher();

  @override
  bool matches(RequestOptions ongoingRequest, Request matcher) {
    // add marvel api keys to request matcher queryParameters
    matcher.queryParameters?['ts'] = ongoingRequest.queryParameters['ts'];
    matcher.queryParameters?['apikey'] =
        ongoingRequest.queryParameters['apikey'];
    matcher.queryParameters?['hash'] = ongoingRequest.queryParameters['hash'];

    return ongoingRequest.doesRouteMatch(ongoingRequest.path, matcher.route);
  }
}
