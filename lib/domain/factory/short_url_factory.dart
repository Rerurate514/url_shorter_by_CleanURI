import 'package:url_shorter_by_cleanuri/domain/entity/short_url.dart';
import 'package:url_shorter_by_cleanuri/infrastructure/model/short_url_response.dart';

abstract class ShortUrlFactory {
  ShortUrl create({
    required String url
  });

  ShortUrl createFromModel(ShortUrlResponse response);
}
