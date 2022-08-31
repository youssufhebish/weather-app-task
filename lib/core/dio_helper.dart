import 'package:dio/dio.dart';
import 'package:mini_weather_app/core/constants.dart';



class DioHelper{
  static Dio? dio;

  /// INIT DIO HELPER
  static init(){
    dio = Dio(
        BaseOptions(
          baseUrl: Constants.apiUrl,
          receiveDataWhenStatusError: true,
        )
    );
  }


  /// DIO GET REQUESTS METHOD ..
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    // ignore: always_specify_types
    dio!.options.headers = {
      'Accept' : 'application/json'
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

}