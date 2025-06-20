import 'package:url_shorter_by_cleanuri/infrastructure/model/short_url_response.dart';

abstract class CleanUriApiDatasource {
  Future<ShortUrlResponse> getShortUrl({String url});
}
