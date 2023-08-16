import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
class HandlerExptionsHepler {
  static String handle(error) {
    if (error is Exception) {
      try {
        String networkExceptions = "";
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = "تم الغاء الطلب";
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = "انتهت مدة الطلب";
              break;

            case DioErrorType.receiveTimeout:
              networkExceptions = "انتهت مدة الاستجابة";
              break;

            case DioErrorType.other:
              if (error.message.contains("SocketException")) {
                networkExceptions = "Translate.noInternetFound.tr";
              }
              break;

            case DioErrorType.sendTimeout:
              networkExceptions = "انتهاء وقت الارسال حاول مرة اخرى";
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 400:
                  networkExceptions = "ليس مخول لهذه البيانات";
                  break;
                case 401:
                  networkExceptions = "ليس مخول لهذه البيانات";
                  break;
                case 403:
                  networkExceptions = "ليس مخول لهذه البيانات";
                  break;
                case 404:
                  print((error.response!.data['messages']).toString());
                  networkExceptions =(error.response!.data['messages']).toString();
                  break;
                case 409:
                  networkExceptions = "حدث تعارض";
                  break;
                case 408:
                  networkExceptions = "انتهت مدة الطلب";
                  break;
                case 500:
                  networkExceptions = "حدث خطاء غير متوقع في الخادم";
                  break;
                case 503:
                  networkExceptions = "هذا الخادم غير متاح";
                  break;
                default:
                  var responseCode = error.response!.statusCode;
                  networkExceptions =
                      "تم استقبال حالة  $responseCode الكود  ليست معرفة";
              }
              break;

            // case DioErrorType.other:
            //   if (error.message.contains("SocketException")) {
            //     networkExceptions = Translate.noInternetFound.tr;
            //     break;
            //   }

          //     message = "Unexpected error occurred";
          //     break;
          //   default:
          //     message = "Something went wrong";
          //     break;
          // }
              return "هناك اخطاء اخرى حدثت";
          }
        } else if (error is SocketException) {
          networkExceptions = "تاكد من اتصالك بشبكة الانترانت";
        } else {
          networkExceptions = "حدث خطاء غير متوقع";
        }
        return networkExceptions;
      } on FormatException {
        // Helper.printError(e.toString());
        return "التطبيق غير قادر على معالجة هذه البيانات";
      } catch (_) {
        return "حدث خطاء غير متوقع";
      }
    } else {
      if (error.toString().contains("ok")) {
      // if (error.toString().contains("is not a subtype of")) {
        return "التطبيق غير قادر على معالجة هذه البيانات";
      } else {
        return "حدث خطاء غير متوقع";
      }
    }
  }

  String getMsgError(dynamic error) {
    if (error is DioError) {
      return error.message;
    } else {
      return error.toString();
    }
  }
}
