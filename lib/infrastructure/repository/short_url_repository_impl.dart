import 'package:url_shorter_by_cleanuri/domain/entity/short_url.dart';
import 'package:url_shorter_by_cleanuri/domain/factory/short_url_factory.dart';
import 'package:url_shorter_by_cleanuri/domain/repository/short_url_repository.dart';
import 'package:url_shorter_by_cleanuri/infrastructure/datasource/clean_uri_api_datasource_impl.dart';

class ShortUrlRepositoryImpl implements ShortUrlRepository {
  final CleanUriApiDatasourceImpl _cleanUriApiDatasourceImpl;
  final ShortUrlFactory _shortUrlFactory;

  ShortUrlRepositoryImpl({
    required CleanUriApiDatasourceImpl cleanUriApiDatasourceImp,
    required ShortUrlFactory shortUriFactory
  }) :  _cleanUriApiDatasourceImpl = cleanUriApiDatasourceImp,
        _shortUrlFactory = shortUriFactory;

  @override
  Future<ShortUrl> fetchShortUrl(String url) async {
    try{
      final res = await _cleanUriApiDatasourceImpl.getShortUrl(url: url);
      return _shortUrlFactory.createFromModel(res);
    } catch(e) {
      rethrow;
    }
  }
}
