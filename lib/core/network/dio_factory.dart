import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



// dio factory it used to get dio  only not for request
// Dio dio = await DioFactory.getDio(); this syntax to use,call the same dio in any request or any place
// Singleton pattern cause same instance call every time

class DioFactory {
  // default private constructor
  DioFactory._(); // النقطة + underscore معناها: constructor اسمه private
  static Dio? dio;


  static Future<Dio> getDio() async {
    Duration timeout = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;

      addDioInterceptor();

      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
