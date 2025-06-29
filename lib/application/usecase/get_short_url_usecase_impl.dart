import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_shorter_by_cleanuri/domain/entity/short_url.dart';
import 'package:url_shorter_by_cleanuri/domain/repository/short_url_repository.dart';
import 'package:url_shorter_by_cleanuri/domain/usecase/get_short_url_usecase.dart';
import 'package:url_shorter_by_cleanuri/infrastructure/repository/short_url_repository_impl.dart';

part 'get_short_url_usecase_impl.g.dart';

@riverpod
GetShortUrlUsecaseImpl getShortUrlUsecaseImpl(Ref ref) {
  return GetShortUrlUsecaseImpl(
    shortUrlRepository: ref.watch(shortUrlRepositoryImplProvider) 
  );
} 

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
