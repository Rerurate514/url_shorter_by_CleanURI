import 'package:freezed_annotation/freezed_annotation.dart';

part 'short_url_response.freezed.dart';
part 'short_url_response.g.dart';

@freezed
sealed class ShortUrlResponse with _$ShortUrlResponse {

    const factory ShortUrlResponse({
    required String url
  }) = _ShortUrlResponse;

  factory ShortUrlResponse.fromJson(Map<String, dynamic> json) => _$ShortUrlResponseFromJson(json);
}
