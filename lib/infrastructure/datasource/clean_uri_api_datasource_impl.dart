import 'package:dio/dio.dart';
import 'package:url_shorter_by_cleanuri/core/exception/network_exception.dart';
import 'package:url_shorter_by_cleanuri/infrastructure/datasource/clean_uri_api_datasource.dart';
import 'package:url_shorter_by_cleanuri/infrastructure/model/short_url_response.dart';

class CleanUriApiDatasourceImpl implements CleanUriApiDatasource {
  final Dio _dio;

  CleanUriApiDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<ShortUrlResponse> getShortUrl({String url = ""}) async {
    final res = await _dio.get(
      'https://cleanuri.com/api/v1/shorten',
      queryParameters: {
        "url": url
      }
    );

    if(res.statusCode == 200){
      final body = res.data;
      final data = ShortUrlResponse.fromJson(body);
      return data;
    } else {
      throw NetworkException(statusCode: res.statusCode ?? 400, message: res.extra["result_url"]);
    }
  }
}
