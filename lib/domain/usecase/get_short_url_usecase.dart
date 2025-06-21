import 'package:url_shorter_by_cleanuri/domain/entity/short_url.dart';

abstract class GetShortUrlUsecase {
  Future<ShortUrl> execute(String url);
}
