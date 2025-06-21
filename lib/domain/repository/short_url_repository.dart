import 'package:url_shorter_by_cleanuri/domain/entity/short_url.dart';

abstract class ShortUrlRepository {
  Future<ShortUrl> fetchShortUrl(String url);
}
