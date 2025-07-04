import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_shorter_by_cleanuri/application/usecase/get_short_url_usecase_impl.dart';

part 'short_url_notifier.g.dart';

@riverpod
class ShortUrlResultNotifier extends _$ShortUrlResultNotifier {
  @override
  Future<String> build() async {
    return "";
  }

  Future<void> createShortUrl(String url) async {
    state = AsyncValue.loading();

    try{
      final getShortUrlUsecaseImpl = ref.watch(getShortUrlUsecaseImplProvider);
      final shortUrl = await getShortUrlUsecaseImpl.execute(url);
      state = AsyncValue.data(shortUrl.url);
    } catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void reset() {
    state = const AsyncValue.data("");
  }
}
