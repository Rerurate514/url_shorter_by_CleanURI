import 'package:url_shorter_by_cleanuri/domain/entity/short_url.dart';
import 'package:url_shorter_by_cleanuri/domain/repository/short_url_repository.dart';
import 'package:url_shorter_by_cleanuri/domain/usecase/get_short_url_usecase.dart';

class GetShortUrlUsecaseImpl extends GetShortUrlUsecase {
  final ShortUrlRepository _shortUrlRepository;

  GetShortUrlUsecaseImpl({
    required ShortUrlRepository shortUrlRepository,
  }) : _shortUrlRepository = shortUrlRepository;

  @override
  Future<ShortUrl> execute(String url) async {
    return _shortUrlRepository.fetchShortUrl(url);
  }
}
