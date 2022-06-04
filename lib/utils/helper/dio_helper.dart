import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );
  }

  static Future<Response> getData({required String url}) async {
    return await dio.get(
      url,
      options: Options(
        headers: {
          'x-api-key': 'mwDA9w',
          'Content-Language': translator.activeLanguageCode,
          'Content-Country': '1'
        },
      ),
    );
  }
}
