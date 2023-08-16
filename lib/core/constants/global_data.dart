
import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class GlobalData{
  static const String domainLocale = 'http://209.127.24.250:7001/restRegWS1/resources/WLTWS/';  // test cloud
  static const String forgetPass = 'frgt';
 static String todayDate = DateFormat('yyyy/MM/dd HH:mm:ss.SSS').format(DateTime.now());
 static String dateTran = DateFormat('yyyy/MM/dd HH:mm:ss.SSS').format(DateTime.now());
  static String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  static String loginMode = "onLine";
  static RxBool hasInternet = true.obs;
  static String language = "1";
  static int labelSize = 9;
  static int inputTextSize = 10;
  static String saveImage = "saveImage";
  static String typeReport = "typeReport";
  static int changePassword = 0;
  static  String userName = 'userName';
  static  String productsList = 'products';
  static  String StorelistServDTL = 'StorelistServDTL';
  static String jwt = 'jwt';
  static  String userPosCode = 'userPosCode';
  static  String cID = 'cID';
  static String amntLength = 'amntLength';
  static String benMinLen = 'benMinLen';
  static String memAccLen = 'memAccLen';
  static String pinLength = 'pinLength';
  static String storeId = 'storeId';
  static String id = 'id';




}