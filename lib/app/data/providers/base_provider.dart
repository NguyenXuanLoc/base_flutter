import 'package:cuuhoxe/app/data/providers/api_result.dart';
import 'package:cuuhoxe/app/services/globals.dart' as globals;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseProvider extends GetConnect {
  void initProvider() {
    httpClient.baseUrl = dotenv.env['BASE_API'];
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> GET(String url) async {
    print('============================================================');
    print('[GET] ' + httpClient.baseUrl! + url);
    print(globals.accessToken);
    try {
      final response = await get(url, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      if (response.isOk && response.body != null) {
        var result = response.body;
        // Logger().d(result);
        return ApiResult<dynamic>(
          error: buildErrorMessage(result['error']),
          data: result,
        );
      } else {
        print('Error ${response.status.code} - ${response.statusText}');
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      print(error);
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> POST(String url, dynamic body) async {
    print('============================================================');
    print('[POST] ' + httpClient.baseUrl! + url);
    print('[PARAMS] ' + body.toString());
    print(globals.accessToken);
    try {
      final response = await post(url, body, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      if (response.isOk && response.body != null) {
        var result = response.body;
        // Logger().d(result);
        return ApiResult<dynamic>(
          error: buildErrorMessage(result['error']),
          data: result,
        );
      } else {
        print('Error ${response.status.code} - ${response.statusText}');
        var result = response.body;
        return ApiResult<dynamic>(
          error: result["error"] != null ? buildErrorMessage(result["error"]) : response.statusText ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> PUT(String url, dynamic body) async {
    print('============================================================');
    print('[PUT] ' + httpClient.baseUrl! + url);
    print('[PARAMS] ' + body.toString());
    try {
      final response = await put(url, body, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      if (response.isOk && response.body != null) {
        var result = response.body;
        // Logger().d(result);
        return ApiResult<dynamic>(
          error: buildErrorMessage(result['error']),
          data: result,
        );
      } else {
        print('Error ${response.status.code} - ${response.statusText}');
        return ApiResult<dynamic>(
          error: response.body?["error"] != null ? buildErrorMessage(response.body?["error"]) : response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> DELETE(String url) async {
    print('============================================================');
    print('[DELETE] ' + httpClient.baseUrl! + url);
    try {
      final response = await delete(url, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      if (response.isOk && response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: buildErrorMessage(result['error']),
          data: result,
        );
      } else {
        print('Error ${response.status.code} - ${response.statusText}');
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  String buildErrorMessage(dynamic error) {
    String errorMessage = "";
    if (error != null) {
      if (error.runtimeType == String) {
        errorMessage = error;
      } else if (error["messages"] != null) {
        error["messages"].forEach((k, v) {
          var msg = "";
          // if (v.runtimeType == List) {
          msg = v.join(" ");
          // } else {
          //   msg = v.toString();
          // }
          errorMessage += "$msg ";
        });
      } else {
        errorMessage = "C?? l???i x???y ra, vui l??ng th??? l???i sau!";
      }
    }
    if (error.runtimeType == String) {
      errorMessage = error;
    }
    return errorMessage;
  }

  // String buildErrorMessage(dynamic error) {
  //   String errorMessage = "";
  //   if (error != null) {
  //     if (error.runtimeType == String) {
  //       errorMessage = error;
  //     } else if (error["message"] != null) {
  //       errorMessage = error["message"];
  //     } else if (error["messages"] != null) {
  //       error["messages"].forEach((k, v) {
  //         var msg = "";
  //         // if (v.runtimeType == List) {
  //         msg = v.join(" ");
  //         // } else {
  //         //   msg = v.toString();
  //         // }
  //         errorMessage += "$msg ";
  //       });
  //     } else {
  //       errorMessage = "C?? l???i x???y ra, vui l??ng th??? l???i sau!";
  //     }
  //   } else {
  //     errorMessage = "C?? l???i x???y ra, vui l??ng th??? l???i sau!";
  //   }
  //   return errorMessage;
  // }
}
