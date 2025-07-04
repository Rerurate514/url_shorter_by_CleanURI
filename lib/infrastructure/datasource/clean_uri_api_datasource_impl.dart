import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_shorter_by_cleanuri/core/exception/network_exception.dart';
import 'package:url_shorter_by_cleanuri/core/utils/dio.dart';
import 'package:url_shorter_by_cleanuri/infrastructure/datasource/clean_uri_api_datasource.dart';  
import 'package:url_shorter_by_cleanuri/infrastructure/model/short_url_response.dart';

part 'clean_uri_api_datasource_impl.g.dart';

@riverpod
CleanUriApiDatasourceImpl cleanUriApiDatasourceImpl(Ref ref) {
  return CleanUriApiDatasourceImpl(
    dio: ref.watch(dioProvider),
  );
}

class CleanUriApiDatasourceImpl implements CleanUriApiDatasource {
  final Dio _dio;

  CleanUriApiDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<ShortUrlResponse> getShortUrl({String url = ""}) async {
    try {
      final res = await _dio.post(
        'https://cleanuri.com/api/v1/shorten',
        data: 'url=${Uri.encodeComponent(url)}',
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      if (res.statusCode == 200) {
        final body = res.data;
        
        if (body['error'] != null) {
          throw NetworkException(
            statusCode: 400, 
            message: body['error']
          );
        }
        
        final data = ShortUrlResponse.fromJson(body);
        return data;
      } else {
        throw NetworkException(
          statusCode: res.statusCode ?? 400, 
          message: 'HTTP ${res.statusCode}: ${res.statusMessage}'
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw NetworkException(
          statusCode: e.response!.statusCode ?? 400,
          message: e.response!.data?['error'] ?? e.message ?? 'Network error'
        );
      } else {
        throw NetworkException(
          statusCode: 0,
          message: e.message ?? 'Network error'
        );
      }
    } catch (e) {
      throw NetworkException(
        statusCode: 0,
        message: e.toString()
      );
    }
  }
}
