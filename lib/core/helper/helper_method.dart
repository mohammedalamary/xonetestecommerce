// import 'dart:convert';
// import 'dart:math';
// import 'package:get/get.dart';
// import 'package:crypto/crypto.dart';
// import 'package:wallet_app/UI/Auth/login/login_controller.dart';
// import 'package:wallet_app/UI/Auth/login/model/acc.dart';
// import 'package:wallet_app/core/class/apiservices.dart';
// import 'package:wallet_app/core/class/random_number.dart';
// import 'package:wallet_app/core/constants/global_data.dart';
// import 'package:wallet_app/core/constants/global_key.dart';
// import 'package:wallet_app/core/enc/aes_encrypt.dart';
// import 'package:wallet_app/core/enc/rsa_enc.dart';
// import 'package:wallet_app/core/function/custom_progress_dialog.dart';
// import 'package:wallet_app/core/function/message_dialog.dart';
// import 'package:wallet_app/core/servicese/services.dart';
// class HelperMethod extends MyServices {
//   late List<Account> account = Get.find<LoginController>().accountData;
//   final random = Get.put(RandomNumber());
//   String getRandomNm="";
//   var dataBack;
// //GlobalData.visibleFingerLogin.value==true?Get.find<MyServices>().getStorage.read(GlobalData.userMob.toString()):GlobalData.userMob.toString()
//   String v='[{"jwt":${GlobalData.jwt.toString()},"UserId":"${GlobalValue.deviceOwner==1?Get.find<MyServices>().getStorage.read(GlobalConstantKey.userIdActive.toString()):GlobalData.userMob.toString()}","SecretID":"${GlobalData.clientKey.toString()}","apkID":"1","UUID":"${GlobalData.deviceCode.toString()}","isAg":"${GlobalData.userType.toString()}","accessType":"a_n","ifEmulator":"-","accessType#":"a_n_@#","transDate":"${GlobalData.dateTran}"},';
//  Future <dynamic> encryptESAFun({required String data,required String url})async{
//     getRandomNm = "";
//     for (int i = 0; i < 20; i++) {
//       getRandomNm = getRandomNm + Random().nextInt(11).toString();
//     }
//     print(getRandomNm.substring(0,16));
//     print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
//
//     print(v+data);
//     String viEn =await Encrypt().encryptString(data:getRandomNm.substring(0,16));
//     var v2=await AESEncrypt().encrypt(v+data,"3159a027584ad57a42c03d5dab118f68",getRandomNm.substring(0,16));
//     customProgressDialog();
//     await ServiceAPI(url:url,dataEncrept:v2,viEn:viEn).encrptPost(onSuccess: (data) {
//         dataBack=data;
//         print("1212121212$data");
//         Get.back();
//     }, onError: (error) {
//       dataBack=null;
//       Get.back();
//       MessageDialog().errorDialog(errorMessage:error.toString());
//     }, onRunTime: () {
//       dataBack=null;
//       Get.back();
//       MessageDialog().errorDialog(errorMessage:"انتهى زمن الاستجابة");
//     },noInterNet: () {
//       dataBack=null;
//       Get.back();
//       MessageDialog().errorDialog(errorMessage:"لا يوجد اتصال بالانترنت");
//     },
//     );
// return dataBack;
//   }
//
//
//  Future <dynamic> encryptPass({required String data})async{
//    final key = utf8.encode(GlobalValue.deviceOwner==1?Get.find<MyServices>().getStorage.read(GlobalConstantKey.uniqKey):GlobalData.uniqKey);
//    final val = utf8.encode(data);
//    final hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
//    final digest = hmacSha256.convert(val);
// //    print("HMAC digest as bytes: ${digest.bytes}");
//    print("HMAC digest as hex string: $digest");
//    print(digest.toString().length);
//    return digest.toString();
//   }
//
//
//   refrshAccountEnc() async {
//     print("===============");
//     print("===8888============");
//     encryptESAFun(
//         data: '{"AccountNo":"${GlobalData.accountNumber.toString()}","ClientCode":"${GlobalData.cID.toString()}","Lang_Id":"1","repType":"2","serv_id":"2","fromDate":"2023/06/01","toDate":"2023/06/20","accSrTyp":"a_n","method":"9","transRandom":"${random.randomNumber.toString()}"}]', url: GlobalData.xyz)
//         .then((data) {
//       if (data != null) {
//         try {
//           var backData = data[0] as List;
//           account.clear();
//           if (backData.isNotEmpty) {
//             print("444444444444");
//             // account.insert(0, element)
//             // reportDate.addAll(backData.map((e) => Report.fromJson(e)).toList());
//             account.addAll(backData.map((e) => Account.fromJson(e)));
//             Get.forceAppUpdate();
//             print("sldlklskl;kdl;d");
//           }else{
//             print("dddddddddsds");
//           }
//         }  catch(ex){
//           return;
//         }
//       }
//     }
//     );
//   }
//
//
// }
