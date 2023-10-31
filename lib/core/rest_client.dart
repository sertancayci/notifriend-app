import 'package:notifriend/core/helpers/extensions.dart';
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/main.dart';
import 'package:dio/dio.dart';
import 'package:notifriend/services/base/base_response.dart';
import 'package:fpdart/fpdart.dart';
import 'exceptions/app_exceptions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:quiver/strings.dart';

class RestClient {
  RestClient(this.dio, this.storageService);

  final String _baseUrl = 'http://localhost:8086/api/v1/';
  final StorageService storageService;

  final Dio dio;

  Future<Response> post(
    String url,
    Map<String, dynamic>? data, {
    bool appendAuth = true,
  }) async {
    try {
      url = _baseUrl + url;
      //
      var options = Options();
      options = await _prepareCall();
      options.headers!['Content-Type'] = 'application/json';
      options.headers!['Accept'] = 'application/json';
      final Response<dynamic> future =
          await dio.post<dynamic>(url, data: data, options: options);
      if (future.statusCode! >= 200 && future.statusCode! < 300) {
        // check if response data isSuccess props is not true
        final BaseResponse<dynamic> result = BaseResponse<dynamic>.fromJson(
          future.data as Map<String, dynamic>,
          (json) => json,
        );
        if (!result.result) {
          throw ApiException(message: result.errors.message);
        } else {
          return future;
        }
      } else {
        throw UnexpectedErrorException();
      }
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServiceConnectionException(mainException: e);
      } else if ([400, 401, 402, 403]
          .filter(
            (t) => e.response!.statusCode == t,
          )
          .isNotEmpty) {
        throw UnauthorizedException(message: e.message);
      } else {
        throw UnexpectedErrorException(e.message);
      }
    } catch (e, s) {
      rethrow;
    }
  }

  _prepareCall() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult == ConnectivityResult.none) {
      throw InternetNotConnectedException();
    }
    final options = Options()..headers = {};
    await _appendAuth(options);

    return options;
  }

  Future<void> _appendAuth(Options options) async {
    final String? token = await storageService.getAuthToken();
    if (isNotEmpty(token)) {
      options.headers!['Authorization'] = 'Bearer ${token!}';
    }
  }

  // Future<Response> get(String url, {
  // bool appendAuth = true}) async {
  //   try {
  //     url = _baseUrl + url;
  //
  //     var options = Options();
  //     options = await _prepareCallCache(options);
  //     options.headers!['Content-Type'] = 'application/json';
  //     options.headers!['Accept'] = 'application/json';
  //
  // } catch (e, s) {
  //     rethrow;
  //   }
  // }



}