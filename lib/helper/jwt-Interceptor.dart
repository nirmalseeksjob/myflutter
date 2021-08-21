import 'package:dio/dio.dart';
import 'package:sfframework/constant/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

tokenDio() async {
  Dio dio = new Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString(access_token);

  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    options.headers.addAll({"Authorization": "Bearer $token"});
  }));
  return dio;
}





// class JwtInterceptors extends Interceptor {

  
  // @override
  // FutureOr<dynamic> onRequest(RequestOptions options) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
       
  //   if (prefs.containsKey(access_token)) {
  //     String token = prefs.get(access_token);
  //     options.headers.addAll({"Authorization": "Bearer $token"});
  //     return options;
  //   }
  // }

  // @override
  // FutureOr<dynamic> onRequest(RequestOptions options) async {
  //   if (options.headers.containsKey("requiresToken")) {
  //     //remove the auxiliary header
  //     options.headers.remove("requiresToken");
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var token = prefs.get("access_token");
  //     options.headers.addAll({"Authorization": "Bearer $token"});
  //     return options;
  //   }
  // }

  // @override
  // FutureOr<dynamic> onError(DioError dioError) {
  //   if (dioError.message.contains("ERROR_001")) {
  //     // this will push a new route and remove all the routes that were present
  //     var navigatorKey;
  //     navigatorKey.currentState
  //         .pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);
  //   }

  //   return dioError;
  // }

  // @override
  // FutureOr<dynamic> onResponse(Response options) async {
  //   if (options.headers.value("verifyToken") != null) {
  //     //if the header is present, then compare it with the Shared Prefs key
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var verifyToken = prefs.get("VerifyToken");

  //     // if the value is the same as the header, continue with the request
  //     if (options.headers.value("verifyToken") == verifyToken) {
  //       return options;
  //     }
  //   }

  //   return DioError(
  //       request: options.request, message: "User is no longer active");
  // }
// }
