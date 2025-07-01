import 'package:freezed_annotation/freezed_annotation.dart';

part 'short_url_response.freezed.dart';
part 'short_url_response.g.dart';

@freezed
sealed class ShortUrlResponse with _$ShortUrlResponse {

    const factory ShortUrlResponse({
    // ignore: non_constant_identifier_names
    required String result_url
  }) = _ShortUrlResponse;

  factory ShortUrlResponse.fromJson(Map<String, dynamic> json) => _$ShortUrlResponseFromJson(json);
}
