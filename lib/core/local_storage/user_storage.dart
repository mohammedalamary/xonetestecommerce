// import 'package:get_storage/get_storage.dart';
// import 'package:wallet_app/core/local_storage/storage_provider.dart';
//
//
// class GetLocalUser extends LocalStorage {
//   var box = GetStorage();
//   @override
//   // ignore: todo
//   // TODO: implement keyStore
//   String get keyStore => "userData";
//   // String get keyStore => AppMapKey.userData;
//
//   @override
//   saveLocal({required Map<String, dynamic> data}) async {
//     await box.write(keyStore, data);
//   }
//
//   @override
//   Future getLocal() async {
//     var data = await box.read(keyStore);
//   }
//
//
//   @override
//   deleteLocal() async {
//     await box.write(keyStore, null);
//   }
// }
