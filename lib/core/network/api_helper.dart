import 'package:dio/dio.dart';

import 'api_response.dart';
import 'end_points.dart';

class NewsAPIHelper extends APIHelper {
  @override
  Dio dio  =
  Dio(
    BaseOptions(
      baseUrl: EndPoints.baseURL,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("--- Headers : ${options.headers.toString()}");
          try {
            print("data : ${(options.data as FormData).fields.toString()}");
          } catch (e) {
            print("data : ${options.data.toString()}");
          }
          print("method : ${options.method}");
          print(" EndPoint : ${options.path}");
          print('full url : ${options.uri.toString()}');

          // add api key to query params
          var apiKey = '836086f05b344448a16dd41ee51c6320';

          options.queryParameters.addAll({'apiKey': apiKey, 'q': 'e'});

          return handler.next(options);
        },
        onError: (error, handler) async {
          print(
            "------ ON ERROR ${error.toString()} \n---- BODY ${error.response?.data.toString()}",
          );
          return handler.next(error);
        },
        onResponse: (response, handler) {
          print(
            "------ ON RESPONSE ${response.realUri.toString()} ${response.toString()}",
          );
          return handler.next(response);
        },
      ),
    );

}
class WeatherAPIHelper extends APIHelper {
  @override
  Dio dio  =
  Dio(
    BaseOptions(
      baseUrl: EndPoints.weatherBaseURL,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("--- Headers : ${options.headers.toString()}");
          try {
            print("data : ${(options.data as FormData).fields.toString()}");
          } catch (e) {
            print("data : ${options.data.toString()}");
          }
          print("method : ${options.method}");
          print(" EndPoint : ${options.path}");
          print('full url : ${options.uri.toString()}');

          // add api key to query params
          var appId = '39ef56aa87e0f9d833e66cd9111de959';

          options.queryParameters.addAll({'appid': appId});

          return handler.next(options);
        },
        onError: (error, handler) async {
          print(
            "------ ON ERROR ${error.toString()} \n---- BODY ${error.response?.data.toString()}",
          );
          return handler.next(error);
        },
        onResponse: (response, handler) {
          print(
            "------ ON RESPONSE ${response.realUri.toString()} ${response.toString()}",
          );
          return handler.next(response);
        },
      ),
    );
}

abstract class APIHelper {


  // declaring dio
  abstract Dio dio;

  // get request

  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.get(endPoint, queryParameters: queryParams);
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  // post

  Future<ApiResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.post(
        endPoint,
        data: data == null
            ? null
            : isFormData
            ? FormData.fromMap(data)
            : data,
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      // ignore: avoid_print
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.put(
        endPoint,
        data: data == null
            ? null
            : isFormData
            ? FormData.fromMap(data)
            : data,
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.delete(
        endPoint,
        data: data == null
            ? null
            : isFormData
            ? FormData.fromMap(data)
            : data,
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
}