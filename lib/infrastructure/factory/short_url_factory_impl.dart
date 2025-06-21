import 'package:url_shorter_by_cleanuri/domain/entity/short_url.dart';
import 'package:url_shorter_by_cleanuri/domain/factory/short_url_factory.dart';
import 'package:url_shorter_by_cleanuri/infrastructure/model/short_url_response.dart';

class ShortUrlFactoryImpl implements ShortUrlFactory {
  @override
  ShortUrl create({required String url}) {
    return ShortUrl(url: url);
  }

  @override
  ShortUrl createFromModel(ShortUrlResponse response) {
    return ShortUrl(url: response.url);
  }
  
}
