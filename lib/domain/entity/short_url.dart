import 'package:freezed_annotation/freezed_annotation.dart';

part 'short_url.freezed.dart';
part 'short_url.g.dart';

@freezed
sealed class ShortUrl with _$ShortUrl {
  const factory ShortUrl({
    required String url
  }) = _ShortUrl;

  factory ShortUrl.fromJson(Map<String, dynamic> json) => _$ShortUrlFromJson(json);
}
